package com.valent.service;

import com.valent.dao.PostMapper;
import com.valent.pojo.Post;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class PostServiceImpl implements PostService{

    @Autowired
    private PostMapper postMapper;

    public List<Post> selectAll() {
        return postMapper.selectAll();
    }

    public void insertPost(Post post, HttpSession session) {
        post.setCreateTime(new Date());
        post.setUpdateTime(new Date());
        User user =(User) session.getAttribute("user");
        post.setUserId(user.getUserid());
        postMapper.insertPost(post);
    }
}
