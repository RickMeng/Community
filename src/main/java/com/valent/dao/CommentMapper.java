package com.valent.dao;

import com.valent.pojo.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


public interface CommentMapper {

    List<Comment> selectAllByPostId(@Param("id")Integer id);

    int insertComment(Comment comment);

    List<Comment> selectUnCheckedByAndUserId(Integer userId);

    void updateChecked(Integer commentId);
}
