package com.valent.controller;

import com.valent.pojo.Comment;
import com.valent.pojo.Post;
import com.valent.pojo.User;
import com.valent.service.CommentService;
import com.valent.service.PostService;
import com.valent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("post")
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

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
    public String detail(String id, Model model){
        Post post=postService.selectAndViewCountPlusOne(Integer.valueOf(id));
        User user=userService.findUserByUserId(post.getUserId());
        List<Comment> commentList = commentService.selectAllByPostId(Integer.valueOf(id));
        model.addAttribute("user",user);
        model.addAttribute("post",post);
        model.addAttribute("commentList",commentList);
        return "postDetail";
    }

}
