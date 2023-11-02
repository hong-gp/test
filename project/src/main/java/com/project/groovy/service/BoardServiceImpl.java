package com.project.groovy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groovy.dao.BoardDao;
import com.project.groovy.model.Board;
import com.project.groovy.model.User;

@Service
public class BoardServiceImpl {

	@Autowired
	BoardDao boardDao;
	
	public int count() {
		return boardDao.count();
	}
	
	public List<User> selectAll() {
		return boardDao.selectAll();
	}
	
	public Board select(int num) {
		return boardDao.select(num);
	}
	
	public int deleteAll() {
		return boardDao.deleteAll();
	}
	
	public int delete(Map<Integer, String> map) {
		return boardDao.delete(map);
	}
	
	public int insert(Board board) {
		return boardDao.insert(board);
	}
}
