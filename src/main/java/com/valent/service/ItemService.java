package com.valent.service;

import com.valent.pojo.Item;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ItemService {

    void insertItem(Item item, HttpSession session);

    List<Item> selectAll();
}
