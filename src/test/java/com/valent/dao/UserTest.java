package com.valent.dao;

import com.valent.dao.UserMapper;
import com.valent.pojo.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml");
        UserMapper userMapper=context.getBean("userMapper", UserMapper.class);
        System.out.println(userMapper.findUserByUserId(1).getNickname());
//        User user = new User();
//        user.setUsername("wang");
//        user.setPassword("123456");
//        user.setNickname("wang");
//        user.setProfile("nothing");
//        userMapper.insertUser(user);
    }
}
