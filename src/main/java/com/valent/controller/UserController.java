package com.valent.controller;


import com.valent.pojo.User;
import com.valent.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //to loginpage
    @RequestMapping("/loginpage")
    public String loginpage(){
        return "login";
    }

    //to registration page
    @RequestMapping("/registerpage")
    public String registerpage(){
        return "register";
    }

    //login request
//version1
    @ResponseBody
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        String sign = userService.login(username,password,session);
        return sign;
    }
//version2
//    @RequestMapping("/login")
//    public String login(HttpServletRequest request) throws Exception{
//        // shiro在认证过程中出现错误后将异常类路径通过request返回
//        String exceptionClassName=(String) request.getAttribute("shiroLoginFailure");
//        if(exceptionClassName!=null){
//            if(UnknownAccountException.class.getName().equals(exceptionClassName)){
//                throw new Exception("The Username doesn't exist");
//            }else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
//                throw new Exception("Username or password is wrong");
//            }else {
//                throw new Exception();//最终在错误处理器生成未知错误
//            }
//        }
//        return "redirect:/index";
//    }

//version3
//    @RequestMapping("/login")
//    public String login(@RequestParam("username")String username, @RequestParam("password")String password){
//        System.out.println("前token的密码"+password);
//        Subject currentUser = SecurityUtils.getSubject();
//        if(!currentUser.isAuthenticated()){
//            //把用户名和密码封装成UsernamePsswordToken
//            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
//            token.setRememberMe(true);
//            try{
//                //执行登陆
//                System.out.println("后后token的密码"+String.valueOf((char[]) token.getCredentials()));
//                currentUser.login(token);
//            }catch (AuthenticationException exception){
//                System.out.println("Login failed:"+exception.getMessage());
//            }
//        }
//
//        return "redirect:/index";
//
//    }

    //registration request
    @ResponseBody
    @RequestMapping("/register")
    public String register(@RequestParam("username")String username,@RequestParam("password") String password,@RequestParam("gender") String gender,@RequestParam("nickname") String nickname,@RequestParam("profile") String profile){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(Integer.valueOf(gender));
        user.setNickname(nickname);
        user.setProfile(profile);
        user.setCreatetime(new Date());
        userService.register(user);
        return "success";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";

    }






}
