package com.valent.dao;

import com.valent.pojo.Collect;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class CollectionTest {
    public static void main(String[] args) {
        ApplicationContext Context = new ClassPathXmlApplicationContext("spring-dao.xml");
        CollectMapper mapper = (CollectMapper) Context.getBean("CollectMapper", CollectMapper.class);
        System.out.println(mapper.findByCollectId(2).getPostId());
    }
}
