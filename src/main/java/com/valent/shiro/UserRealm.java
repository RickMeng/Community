package com.valent.shiro;

import com.valent.pojo.User;
import com.valent.service.PostService;
import com.valent.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class UserRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;

    @Override
    public String getName() {
        return "userRealm";
    }

    // 支持什么类型的token
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    // 认证：也就是登陆，获取信息给securityManager处理
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {

        // token 就是封装好的用户提交的用户名和密码
        String Username = (String) token.getPrincipal();

        User sysUser = userService.findUserByUsername(Username);
        // 拿username从数据库中查询
        // ....
        // 如果查询不到则返回null
        if (sysUser == null) {// 这里模拟查询不到
            return null;
        }

        // 获取从数据库查询出来的用户密码
        String password = sysUser.getPassword();

        //获取盐
        //String salt = sysUser.getSalt();

        // 构建用户身份信息
        User Activeuser=new User();
        Activeuser.setUserid(sysUser.getUserid());
        Activeuser.setUsername(sysUser.getUsername());
        Activeuser.setNickname(sysUser.getNickname());

        // 返回认证信息由父类AuthenticatingRealm进行认证
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
                Activeuser, password, getName());

        return simpleAuthenticationInfo;
    }

    // 授权：给予用户资源授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {

        // 将权限信息封闭为AuthorizationInfo
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();


        return simpleAuthorizationInfo;
    }


}
