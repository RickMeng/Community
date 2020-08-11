package com.valent.service;

import com.valent.dao.UserMapper;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;


    public int register(User user) {
        //userMapper.insertUser(user);
        return userMapper.insertUser(user);

    }

    public String login(String username, String password, HttpSession session) {
        User user=userMapper.findUserByUsername(username);
        if(user!=null){
            if(user.getPassword().equals(password)){

                //如果用户登陆成功，把user【对象】存到session中
                session.setAttribute("user",user);
                session.setMaxInactiveInterval(3600);
                return "101";//登陆成功
            }else {
                return "102";
            }
        }else {
            return "102";//登陆失败
        }
    }

    public User findUserByUsername(String Username) {
        return userMapper.findUserByUsername(Username);
    }

    public User findUserByUserId(Integer id) {
        return userMapper.findUserByUserId(id);
    }
}
