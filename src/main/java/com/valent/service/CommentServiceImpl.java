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

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> selectAllByPostId(Integer id) {
        return commentMapper.selectAllByPostId(id);
    }

    public void insertComment(Comment comment, HttpSession session) {
        comment.setCreateTime(new Date());
        User user = (User) session.getAttribute("user");
        comment.setUserId(user.getUserid());
//        //匿名回复功能
//        if(user==null){
//            comment.setUserId(1);
//        }else {
//            comment.setUserId(user.getUserid());
//        }
        commentMapper.insertComment(comment);

    }
}
