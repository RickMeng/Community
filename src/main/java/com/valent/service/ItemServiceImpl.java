package com.valent.service;

import com.valent.dao.ItemMapper;
import com.valent.pojo.Item;
import com.valent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService{

    @Autowired
    private ItemMapper itemMapper;

    public void insertItem(Item item, HttpSession session) {
        item.setCreateTime(new Date());
        User user = (User) session.getAttribute("user");
        item.setUserId(user.getUserid());
        itemMapper.insertItem(item);
    }

    public List<Item> selectAll() {
        System.out.println("进入Service");
        return itemMapper.selectAll();
    }
}
