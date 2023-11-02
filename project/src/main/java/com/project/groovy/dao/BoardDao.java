package com.project.groovy.dao;

import java.util.List;
import java.util.Map;

import com.project.groovy.model.Board;
import com.project.groovy.model.SearchCondition;
import com.project.groovy.model.User;

public interface BoardDao {

	int count();

	List<User> selectAll();

	Board select(int num);

	int deleteAll();

	int delete(Map<Integer, String> map);

	int insert(Board board);

	int increaseViewCnt(int num);

	int update(Board board);

	List<Board> selectPage(Map<Integer, String> map);

	List<Board> searchSelectPage(SearchCondition sc);

	int searchResultCnt(SearchCondition sc);

	int updateLikeCnt(Map<Integer, Integer> map);

	int updateCommentCnt(Map<Integer, Integer> map);

}