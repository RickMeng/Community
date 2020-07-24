package com.valent.controller;

import com.valent.pojo.Post;
import com.valent.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("post")
public class PostController {

    @Autowired
    private PostService postService;

    @RequestMapping("/form")
    public String form(){
        return "postForm";
    }

    @RequestMapping("/save")
    public String save(Post post, HttpSession session){
        postService.insertPost(post,session);
        return "redirect:/index";
    }

    @RequestMapping("/detail")
    public String detail(Integer id, Model model){
        Post post=postService.selectById(id);
        model.addAttribute("post",post);
        return "postDetail";
    }

}
