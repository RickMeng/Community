package com.valent.utils;


import com.valent.dao.PostMapper;
import com.valent.dao.UserMapper;
import com.valent.pojo.Post;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class SysUtils {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PostMapper postMapper;



    public static SysUtils sysUtils;

    @PostConstruct
    public void init() {
        sysUtils = this;
    }


    /**
     * getUser
     */
    public static User getUser(Integer userId) {
        return sysUtils.userMapper.findUserByUserId(userId);
    }

    /**
     * getPost
     */
    public static Post getPost(Integer postId){ return sysUtils.postMapper.selectById(postId);}


}
