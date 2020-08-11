package com.valent.service;

import com.valent.pojo.Comment;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CommentService {
    List<Comment> selectAllByPostId(Integer id);

    String insertComment(int postId,String content, HttpSession session);

    List<Comment> selectUnCheckedByAndUserId(Integer userId);

    void updateChecked(Integer commentId);
}
