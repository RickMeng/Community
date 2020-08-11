package com.valent.dao;

import com.valent.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    //register
    int insertUser(User user);

    //login
    User findUserByUsername(String username);

    User findUserByUserId(@Param("id")Integer id);
}
