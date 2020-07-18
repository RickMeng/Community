package com.valent.dao;

import com.valent.pojo.User;

public interface UserMapper {

    //register
    void insertUser(User user);

    //login
    User findUserByUsername(String username);
}
