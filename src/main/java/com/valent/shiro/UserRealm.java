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
    // token 就是封装好的用户提交的用户名和密码
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String username=(String) token.getPrincipal();
        System.out.println("在realm中 显示"+username);
        User sysUser=userService.findUserByUsername(username);
        if(sysUser==null){
            throw new UnknownAccountException("用户不存在");
        }
        String password=sysUser.getPassword();
        User user = new User();
        user.setUserid(sysUser.getUserid());
        user.setUsername(sysUser.getUsername());
        user.setNickname(sysUser.getNickname());
        System.out.println("到这一步了嘛");

        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user,password,getName());
        return simpleAuthenticationInfo;
    }

    // 授权：给予用户资源授权 ,与过滤器组合使用
    //在登录成功后，根据用户id获取到该用户的权限，并把权限保存在安全管理器之中，
    // 当用户访问的时候，会从管理器中判断该用户是否有权限去访问该url。
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {

        // 将权限信息封闭为AuthorizationInfo
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();


        return simpleAuthorizationInfo;
    }


}
