package com.valent.controller;


import com.valent.pojo.User;
import com.valent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
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

    //registration request
    @ResponseBody
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        String sign = userService.login(username,password,session);
        //判断sign，跳转不同视图(继续登陆or跳转到首页)
        //登陆成功的话，把登陆信息添加到session中
//        if(sign.equals("101")){
//            session.setAttribute("userSession",username);
//        }
        return sign;
    }


//    @ResponseBody
//    @RequestMapping("/register")
//    public String register(User user){
//        user.setCreatetime(new Date());
//        userService.register(user);
//        return "success";
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
