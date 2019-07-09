package com.cxt.supermarket.web.controller;


import com.alibaba.fastjson.JSONArray;
import com.cxt.supermarket.entity.User;
import com.cxt.supermarket.service.UserService;

import com.cxt.supermarket.util.User1;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping("/toLogin.action")
    public String toLogin() {
        return "../../jsp/login";
    }

    /**
     * 登录
     *
     * @param userCode
     * @param userPassword
     * @param session
     * @return
     */
    @RequestMapping("/login.action")
    public String login(@RequestParam(value = "userCode") String userCode, @RequestParam(value = "userPassword") String userPassword, HttpServletRequest request, HttpSession session) {
        User user = userService.login(userCode, userPassword);
        //System.out.println(user);
        if (user != null) {
            session.setAttribute("loginedUser", user);
            return "../../jsp/welcome";
        }
        request.setAttribute("message", "用户名或密码错误！");
        return "../../jsp/login";
    }

    /**
     * 注销
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout.action")
    public String logout(HttpSession session) {
        //移除会话
        session.removeAttribute("loginedUser");
        //销毁会话 使会话失效
        session.invalidate();
        return "redirect:/user/toLogin.action";
    }

    @RequestMapping("/toAdd.action")
    public String toAdd() {
        return "../../jsp/userAdd";
    }

    /**
     * 添加用户
     *
     * @return
     */
    @RequestMapping("/addUser.action")
    public String addUser(User1 user1, @RequestParam(value = "gender", defaultValue = "") Integer gender, @RequestParam(value = "userType", defaultValue = "") Integer userType) {

        user1.setGender(gender);
        user1.setUserType(userType);
        user1.setCreationDate(new Date());


       // System.out.println(user1);
        if (userService.insert(user1)) {
            return "redirect:/user/list.action";
        }


        return "redirect:/user/toAdd.action";

    }

    /**
     * 用户列表
     *
     * @param model
     * @param pageNo
     * @param pageSize
     * @param user
     * @return
     */
    @RequestMapping("/list.action")
    public String list(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo, @RequestParam(value = "pageSize", defaultValue = "3") int pageSize, User user) {
        if (user.getUserName() != null) {
            user.setUserName("%" + user.getUserName() + "%");
        }
        PageHelper.startPage(pageNo, pageSize);
        List<User> userList = userService.getUserList(user);
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        if (user.getUserName() != null) {
            user.setUserName(user.getUserName().replace("%", ""));
        }
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("user", user);
        return "../../jsp/userList";
    }

    @RequestMapping("/toupdate.action")
    public String toupdate(Model model, @RequestParam(value = "userCode", defaultValue = "") String userCode) {
        User user = userService.getByCode(userCode);
        model.addAttribute("user", user);
        return "../../jsp/userUpdate";
    }

    @RequestMapping("/update.action")
    public String update(User1 user1, @RequestParam(value = "gender", defaultValue = "") Integer gender, @RequestParam(value = "userType", defaultValue = "") Integer userType) {
        user1.setGender(gender);
        user1.setUserType(userType);
        if (userService.updateuser(user1)) {
            return "redirect:/user/list.action";
        }
        return "../../jsp/userUpdate";
    }
@RequestMapping("/delete.action")
@ResponseBody
    public Object del(@RequestParam(value = "userCode") String userCode) {
        Map<String,String> resultMap=new HashMap<>();
        if (userService.delete(userCode)){
            resultMap.put("result","success");
        }else {
            resultMap.put("result","failure");
        }
        return JSONArray.toJSONString(resultMap);

    }

    public String updatePassword() {
        return null;
    }

    public String toDetatils() {
        return null;
    }


    @RequestMapping("/userView.action")
    public String userView(Model model, @RequestParam(value = "userCode", defaultValue = "") String userCode) {
        User user = userService.getByCode(userCode);
        model.addAttribute("user", user);
        return "../../jsp/userView";
    }

    @RequestMapping("/checkCodeExists.action")
    @ResponseBody
    public Object checkCodeExists(@RequestParam(value = "userCode", defaultValue = "") String userCode) {
        Map<String, String> resultMap = new HashMap<String, String>();
        User user = userService.getByCode(userCode);
        if (user != null) {
            resultMap.put("result", "exists");
        } else {
            resultMap.put("result", "noexists");
        }
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/checkPassword.action")
    @ResponseBody
    public Object checkPassword(@RequestParam(value = "userPassword", defaultValue = "") String userPassword, @RequestParam(value = "userPassword2") String userPassword2) {
        Map<String, String> resultMap = new HashMap<>();
        //System.out.println(userPassword+"\t"+userPassword2);
        if (userPassword.equals(userPassword2)) {
            resultMap.put("result", "eq");
        } else {
            resultMap.put("result", "noeq");
        }
        return JSONArray.toJSONString(resultMap);
    }
}

