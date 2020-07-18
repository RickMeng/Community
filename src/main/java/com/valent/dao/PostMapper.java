package com.valent.dao;

import com.valent.pojo.Post;
import com.valent.pojo.User;

import java.util.List;

public interface PostMapper {
    List<Post> selectAll();
    void insertPost(Post post);
}
