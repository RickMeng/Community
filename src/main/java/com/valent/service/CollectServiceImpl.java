package com.valent.service;

import com.valent.dao.CollectMapper;
import com.valent.dao.UserMapper;
import com.valent.pojo.Collect;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class CollectServiceImpl implements CollectService{

    @Autowired
    private CollectMapper collectMapper;


    public List<Collect> findByUserId(HttpSession session)
    {
        User user =(User) session.getAttribute("user");
        int userId= user.getUserid();
        return collectMapper.findByUserId(userId);
    }

    public void insertCollect(HttpSession session, int postId) {
        User user =(User) session.getAttribute("user");
        int userId= user.getUserid();
        Collect collect = new Collect();
        collect.setUserId(userId);
        collect.setPostId(postId);
        collectMapper.insertCollect(collect);


    }

    public void deleteCollect(int collectId) {
        collectMapper.deleteCollect(collectId);
    }
}
