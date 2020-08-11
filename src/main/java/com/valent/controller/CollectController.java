package com.valent.controller;


import com.valent.pojo.Collect;
import com.valent.service.CollectService;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("collect")
public class CollectController {

    @Autowired
    private CollectService collectService;

    @RequestMapping("save")
    //看看是不是string postId
    public String save (int postId, HttpSession session  ){
        collectService.insertCollect(session,postId);
        return "redirect:/post/detail?id="+postId;

    }

    @RequestMapping("list")
    public String list(HttpSession session, Model model){
        List<Collect> collectList =collectService.findByUserId(session);
        model.addAttribute("collectList",collectList);
        return "collectList";
    }

    @RequestMapping("delete")
    public String delete(int collectId){
        System.out.println("id是"+collectId);
        collectService.deleteCollect(collectId);

        return "redirect:/collect/list";
    }


}
