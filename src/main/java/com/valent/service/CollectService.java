package com.valent.service;

import com.valent.pojo.Collect;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CollectService {
    List<Collect> findByUserId(HttpSession session);

    void insertCollect(HttpSession session,int postId);

    void deleteCollect(int collectId);

}
