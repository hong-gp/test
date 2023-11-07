package com.project.groovy.dao;

import java.util.List;

import com.project.groovy.model.Comment;

public interface CommentDao {

	int deleteAll(Integer bno) throws Exception;

	int count(Integer bno) throws Exception;

	int delete(Integer cno, String commenter) throws Exception;

	int insert(Comment comment);

	List<Comment> selectAll(Integer bno) throws Exception;

	Comment select(Integer cno);

	int update(Comment comment);
	
	int maxStep(Integer ref) throws Exception;
	
	int updateStep(Comment comment) throws Exception;
}