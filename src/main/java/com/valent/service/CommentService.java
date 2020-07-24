package com.valent.service;

import com.valent.pojo.Comment;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CommentService {
    List<Comment> selectAllByPostId(Integer id);

    void insertComment(Comment comment, HttpSession session);
}
