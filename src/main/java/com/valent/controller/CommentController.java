package com.valent.controller;

import com.valent.pojo.Comment;
import com.valent.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;


    @RequestMapping("/save")
    public String save(Comment comment, HttpSession session){
        commentService.insertComment(comment,session);
        return "redirect:/post/detail?id="+comment.getPostId();
    }

}
