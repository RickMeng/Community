package com.valent.dao;

import com.valent.pojo.Post;
import com.valent.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {

    int insertPost(Post post);

    //query all the posts
    List<Post> selectAll(@Param("beginPage")Integer beginpage,@Param("pageCount")Integer pageCount,@Param("title")String title);

    //query the number of record
    Integer getTotal(@Param("title")String title);

    Post selectById(@Param("id")Integer id);

    void AddViewCount(@Param("id")Integer id);

    List<Post> selectByUserId(@Param("userId")Integer userId);

    void deletePost(@Param("postId") Integer postId);


}
