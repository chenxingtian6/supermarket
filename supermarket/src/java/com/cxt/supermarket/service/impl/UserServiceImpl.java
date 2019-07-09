package com.cxt.supermarket.service.impl;

import com.cxt.supermarket.dao.UserDao;
import com.cxt.supermarket.entity.User;
import com.cxt.supermarket.service.UserService;
import com.cxt.supermarket.util.User1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("userService")
@Transactional
@Scope(value = "prototype")
public class UserServiceImpl implements UserService {
    @Autowired(required = true)
    @Qualifier("userDao")
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(String userCode, String userPassword) {
        List<User> userList=userDao.selectByCode(userCode);
        for (User user:userList
             ) {
            if (user.getUserPassword().equals(userPassword)) {

                return user;
            }
        }
        return null;
    }

    @Override
    public boolean register(User1 user) {
        return userDao.insert(user)>0;
    }

    public List<User> getUserList(User user) {
        return userDao.selectUserList(user);
    }

    @Override
    public User getByCode(String userCode) {
        List<User> userList=userDao.selectByCode(userCode);

        return userList!=null&&!userList.isEmpty()?userList.get(0):null ;
    }

    @Override
    public boolean insertUser(List<User> userList) {
//        for (User user:userList
//             ) {
//        userDao.insert(user);
//    }
       return true;
}

    @Override
    public boolean insert(User1 user) {
        if (user!=null){
            userDao.insert(user);
            return true;
        }
      return false;
    }

    @Override
    public boolean updateuser(User1 user1) {
        if (user1!=null){
            userDao.update(user1);
            return true;
        }
        return false;
    }

    @Override
    public boolean delete(String userCode) {
        return userDao.delete(userCode)>0;
    }
}
