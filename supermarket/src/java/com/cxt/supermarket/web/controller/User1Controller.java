package com.cxt.supermarket.web.controller;

import com.cxt.supermarket.util.Test;
import com.cxt.supermarket.util.User1;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class User1Controller {
@RequestMapping("/user/users.action")
    public String users(User1 user1){
    System.out.println(user1);
        return null;
    }
@RequestMapping("/user/tousers.action")
    public String tousers(){
    return "../../index";
}
}
