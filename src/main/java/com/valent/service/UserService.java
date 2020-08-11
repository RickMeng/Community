package com.valent.service;

import com.valent.pojo.User;

import javax.servlet.http.HttpSession;

public interface UserService {

    int register (User user);

    String login (String username, String password, HttpSession session);

    /**
     * 根据登陆名称查询用户
     */
    User findUserByUsername(String Username);

    /**
     * 根据userid查询用户
     */
    User findUserByUserId(Integer id);
}
