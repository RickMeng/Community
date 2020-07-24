package com.valent.controller;


import com.valent.pojo.User;
import com.valent.service.UserService;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
//    @RequestMapping("/loginpage")
//    public String loginpage(){
//        return "login";
//    }

    //to registration page
    @RequestMapping("/registerpage")
    public String registerpage(){
        return "register";
    }

    //login request
//    @ResponseBody
//    @RequestMapping("/login")
//    public String login(String username, String password, HttpSession session){
//        String sign = userService.login(username,password,session);
//        return sign;
//    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request) throws Exception{
        String exceptionClassName=(String) request.getAttribute("shiroLoginFailure");
        if(exceptionClassName!=null){
            if(UnknownAccountException.class.getName().equals(exceptionClassName)){
                throw new Exception("The Username doesn't exist");
            }else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
                throw new Exception("Username or password is wrong");
            }else {
                throw new Exception();//最终在错误处理器生成未知错误
            }
        }
        return "login";
    }

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

    /*@RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";

    }*/






}
