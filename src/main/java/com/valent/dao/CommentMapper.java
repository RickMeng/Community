package com.valent.dao;

import com.valent.pojo.Comment;

import java.util.List;

public interface CommentMapper {

    List<Comment> selectAllByPostId(Integer id);

    void insertComment(Comment comment);
}
