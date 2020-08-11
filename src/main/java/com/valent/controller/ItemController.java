package com.valent.controller;

import com.valent.pojo.Item;
import com.valent.service.ItemService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.FileNameMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @RequestMapping("/list")
    public String itemPage(Model model){
        List<Item> itemList=itemService.selectAll();
        int length= itemList.size();
        model.addAttribute("itemList",itemList);
        model.addAttribute("length",length);
        return "itemList";
    }

    @RequestMapping("/form")
    private String itemForm(){
        return "itemForm";
    }

    @RequestMapping("/save")
    private String save(HttpServletRequest request,
                         Integer price,
                        String name,
                        String content,
                        @RequestParam(value="pictureFile")MultipartFile pictureFile,
                        HttpSession session) throws IOException {
        Item item = new Item();
        item.setContent(content);
        item.setItemName(name);
        item.setPrice(price);

        //使用UUID给图片重命名，并去掉四个“-”
        String ImgName= UUID.randomUUID().toString().replace("-", "");
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        //设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/img");
        String url2 ="E:\\Programing\\Community\\web\\img";
        //以绝对路径保存重名命后的图片
        pictureFile.transferTo(new File(url2 + "/" + ImgName + "." + ext));
        //把图片存储路径保存到数据库
        item.setImg("/img/"+ImgName+"."+ext);

        itemService.insertItem(item,session);
        return "redirect:/index";


    }

}
