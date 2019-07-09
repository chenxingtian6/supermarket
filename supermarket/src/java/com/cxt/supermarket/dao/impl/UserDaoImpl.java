package com.cxt.supermarket.dao.impl;

import com.cxt.supermarket.dao.UserDao;
import com.cxt.supermarket.entity.User;
import com.cxt.supermarket.util.User1;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

/**
 * 用户信息持久化操作接口实现类
 */
public class UserDaoImpl implements UserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public User selectById(Integer id) {
        return null;
    }

    @Override
    public List<User> selectAll() {
        return null;
    }

    @Override
    public List<User> selectByCode(String userCode) {
        return sqlSession.selectList("com.cxt.supermarket.dao.UserDao.selectByCode",userCode);
    }

    @Override
    public List<User> selectByName(String userName) {
        return null;
    }


    @Override
    public int insert(User1 user) {

        return sqlSession.insert("com.cxt.supermarket.dao.UserDao.insert",user);
    }

    @Override
    public int delete(String userCode) {
        return sqlSession.delete(userCode);
    }

    @Override
    public int update(User1 user1) {

        return sqlSession.update("com.cxt.supermarket.dao.UserDao.update",user1);
    }

    @Override
    public int updatePassword(Integer id, String password) {
        return 0;
    }

    @Override
    public List<User> getUserlist(Map<String, Object> condition) {
        return null;
    }

    @Override
    public List<User> selectUserList(User u) {
        return null;
    }
}
