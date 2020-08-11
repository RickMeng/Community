package com.valent.dao;

import com.valent.pojo.Item;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ItemTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml");
        UserMapper userMapper=context.getBean("userMapper", UserMapper.class);
        ItemMapper itemMapper=context.getBean("ItemMapper",ItemMapper.class);
        for(Item item:itemMapper.selectAll()){
            System.out.println(item);
        }

    }
}
