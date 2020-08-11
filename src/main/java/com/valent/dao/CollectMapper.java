package com.valent.dao;

import com.valent.pojo.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectMapper {

    List<Collect> findByUserId(@Param("userId") int userId);

    Collect  findByCollectId(int collectId);

    void insertCollect(Collect collect);

    void deleteCollect(int collectId);

}
