package com.project.groovy.service;

import java.util.List;

import com.project.groovy.model.User;

public interface UserService {

	int regist(User user) throws Exception;

	int update(User user) throws Exception;

	int delete(String id) throws Exception;

	User select(String id) throws Exception;

	List<User> selectAll() throws Exception;

	int deleteAll() throws Exception;

}