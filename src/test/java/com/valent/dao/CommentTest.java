package com.valent.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@MapperScan("com.valent.dao")
public class CommentTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml");
        CommentMapper commentMapper=context.getBean("CommentMapper",CommentMapper.class);

        System.out.println(commentMapper.selectAllByPostId(7));

    }
}
