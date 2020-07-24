package com.valent.service;

import com.valent.dao.PostMapper;
import com.valent.pojo.Post;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class PostServiceImpl implements PostService{

    @Autowired
    private PostMapper postMapper;

    public List<Post> selectAll(Integer currentPage,Integer pageCount,String title) {

        return postMapper.selectAll((currentPage-1)*pageCount,pageCount,title);
    }


    //pageCount 每页记录数
    //total 总记录数
    public Integer getTotalPage(Integer pageCount, String title) {
        if(title==null){
            title="";
        }
        Integer total = postMapper.getTotal(title);
        return (total-1)/pageCount+1;
    }

    public void insertPost(Post post, HttpSession session) {
        post.setCreateTime(new Date());
        post.setUpdateTime(new Date());
        User user =(User) session.getAttribute("user");
        post.setUserId(user.getUserid());
        postMapper.insertPost(post);
    }

    public Post selectById(Integer id) {
        return postMapper.selectById(id);
    }
}
