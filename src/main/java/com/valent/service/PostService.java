package com.valent.service;

import com.valent.pojo.Post;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PostService {
    List<Post> selectAll();
    void insertPost(Post post, HttpSession session);
}
