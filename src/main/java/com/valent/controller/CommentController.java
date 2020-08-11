package com.valent.controller;

import com.valent.pojo.Comment;
import com.valent.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;


    @RequestMapping("/save")
    public String save(int postId,String newComment, HttpSession session){
        commentService.insertComment(postId,newComment,session);
        return "redirect:/post/detail?id="+postId;
    }
//    @ResponseBody
//    @RequestMapping("/save")
//    public String save(int postId,String content,HttpSession session){
//        System.out.println("到达Controller层");
//        return commentService.insertComment(postId,content,session);
//    }

}
