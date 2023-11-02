package com.project.groovy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groovy.model.Board;
import com.project.groovy.model.SearchCondition;
import com.project.groovy.model.User;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession session;
	String namespace = "com.project.groovy.Board.";
	
	@Override
	public int count() {
		return session.selectOne(namespace + "count");
	}
	
	@Override
	public List<User> selectAll() {
		return session.selectList(namespace + "selectAll");
	}
	
	@Override
	public Board select(int num) {
		return session.selectOne(namespace + "select", num);
	}
	
	@Override
	public int deleteAll() {
		return session.delete(namespace + "deleteAll");
	}
	
	@Override
	public int delete(Map<Integer, String> map) {
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int insert(Board board) {
		return session.insert(namespace + "insert", board);
	}
	
	@Override
	public int increaseViewCnt(int num) {
		return session.update(namespace + "increaseViewCnt", num);
	}
	
	@Override
	public int update(Board board) {
		return session.update(namespace + "update", board);
	}
	
	@Override
	public List<Board> selectPage(Map<Integer, String> map) {
		return session.selectList(namespace + "selectPage", map);
	}
	
	@Override
	public List<Board> searchSelectPage(SearchCondition sc) {
		return session.selectList(namespace + "searchSelectPage", sc);
	}
	
	@Override
	public int searchResultCnt(SearchCondition sc) {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}
	
	@Override
	public int updateLikeCnt(Map<Integer, Integer> map) {
		return session.selectOne(namespace + "updateLikeCnt", map);
	}
	
	@Override
	public int updateCommentCnt(Map<Integer, Integer> map) {
		return session.update(namespace + "updateCommentCnt", map);
	}
}
