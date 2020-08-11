package com.valent.service;

import com.valent.dao.CommentMapper;
import com.valent.pojo.Comment;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    public List<Comment> selectUnCheckedByAndUserId(Integer userId) {
        return commentMapper.selectUnCheckedByAndUserId(userId);
    }

    public void updateChecked(Integer commentId) {
        commentMapper.updateChecked(commentId);
    }

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> selectAllByPostId(Integer id) {
        return commentMapper.selectAllByPostId(id);
    }

    public String insertComment(int postId,String content, HttpSession session) {
        Comment comment =new Comment();
        User user = (User) session.getAttribute("user");
        comment.setUserId(user.getUserid());
        comment.setContent(content);
        comment.setPostId(postId);
        comment.setCreateTime(new Date());
//        //匿名回复功能
//        if(user==null){
//            comment.setUserId(1);
//        }else {
//            comment.setUserId(user.getUserid());
//        }
        int result = commentMapper.insertComment(comment);
        if(result==1){
            System.out.println("service层返回101");
            return "101";
        }else {
            return "102";
        }

    }
}
