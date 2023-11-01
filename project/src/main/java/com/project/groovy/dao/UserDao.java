package com.project.groovy.dao;

import java.util.List;

import com.project.groovy.model.User;

public interface UserDao {

	int insert(User user) throws Exception;

	int update(User user) throws Exception;

	int delete(String id) throws Exception;

	User select(String id) throws Exception;

	List<User> selectAll() throws Exception;

	int deleteAll();

}