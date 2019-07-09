package com.cxt.supermarket.service;

import com.cxt.supermarket.entity.User;
import com.cxt.supermarket.util.User1;

import java.util.List;
import java.util.Map;

/**
 * 用户信息业务操作接口
 */
public interface UserService {
    public User login(String userCode, String userPassword);//登录

    public boolean register(User1 user); //注册

    public List<User> getUserList(User user);//查询

    public User getByCode(String userCode);//检查用户名是否存在

    public boolean insertUser(List<User> userList);//批量添加用户信息

    public  boolean insert(User1 user);//添加用户

    public boolean updateuser(User1 user1);//更新用户信息

    public boolean delete(String userCode);

}
