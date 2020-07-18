package com.valent.service;

import com.valent.pojo.User;

import javax.servlet.http.HttpSession;

public interface UserService {

    void register (User user);

    String login (String username, String password, HttpSession session);
}
