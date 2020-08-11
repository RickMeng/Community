package com.valent.controller;

import com.valent.pojo.Comment;
import com.valent.pojo.Post;
import com.valent.pojo.User;
import com.valent.service.CommentService;
import com.valent.service.PostService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DispacherController {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/index")
    public String index(String title, String page, Model model){
        //主体,通过subject来获得user,因为UserRealm中simpleAuthenticationInfo传入的就是user对象
         //Subject subject = SecurityUtils.getSubject();
        //身份
        //User user = (User)subject.getPrincipal();
        //model.addAttribute("user",user);
        System.out.println("title is "+title);


        // default first page is 1 (the first page)
        int currentPage=1;
        int pageCount=4;

        if(page!=null){
            currentPage=Integer.valueOf(page);
        }

        List<Post> result = postService.selectAll(currentPage,pageCount,title);
        int totalPage=postService.getTotalPage(pageCount,title);

        model.addAttribute("postList",result);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("title",title);

        /*if(session!=null){
            User user =(User) session.getAttribute("user");
            List<Comment> commentList = commentService.selectUnCheckedByAndUserId(user.getUserid());
            int notificationNumber = commentList.size();
            model.addAttribute("notificationNumber",notificationNumber);
        }
*/

        return "index";
    }
}
