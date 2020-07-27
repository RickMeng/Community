package com.valent.service;

import com.valent.pojo.Post;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PostService {

    List<Post> selectAll(Integer currentPage,Integer pageCount,String title);

    Integer getTotalPage(Integer pageCount,String title);

    void insertPost(Post post, HttpSession session);

    Post selectById(Integer id);

    Post selectAndViewCountPlusOne(Integer id);
}
