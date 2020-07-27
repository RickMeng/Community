package com.valent.dao;

import com.valent.pojo.Post;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

public class PostTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml");
        PostMapper postMapper=context.getBean("postMapper", PostMapper.class);

//        for(Post post: postMapper.selectAll()){
//            System.out.println(post);

//        Post post = new Post();
//        post.setUserId(1);
//        post.setTagId(2);
//        post.setTitle("war");
//        post.setContent("end");
//        postMapper.insertPost(post);

        System.out.println(postMapper.selectById(1).getViewCount());
        postMapper.AddViewCount(1);
        System.out.println(postMapper.selectById(1).getViewCount());

    }
}

