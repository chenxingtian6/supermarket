package com.cxt.supermarket.dao;

import com.cxt.supermarket.entity.User;
import com.cxt.supermarket.util.User1;

import java.util.List;
import java.util.Map;

/**
 * 用户信息持久化接口
 */
public interface UserDao {
    public User selectById(Integer id);
    public List<User> selectAll();
    public List<User> selectByCode(String userCode);
    public List<User> selectByName(String userName);
    public int insert(User1 user);
    public int delete(String userCode);
    public int update(User1 user1);
    public int updatePassword(Integer id,String password);
    public  List<User> getUserlist(Map<String,Object> condition);
    public  List<User> selectUserList(User u );

}
