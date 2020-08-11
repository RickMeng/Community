package com.valent.dao;

import com.valent.pojo.Item;

import java.util.List;

public interface ItemMapper {
    void insertItem(Item item);
    List<Item> selectAll();
}
