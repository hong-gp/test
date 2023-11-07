package com.project.groovy.service;

import java.util.List;

import com.project.groovy.model.Comment;

public interface CommentService {

	int getCount(Integer bno) throws Exception;

	int remove(Integer cno, Integer bno, String commenter) throws Exception;

	int write(Comment comment) throws Exception;
	
	List<Comment> getList(Integer bno) throws Exception;

	Comment read(Integer cno) throws Exception;

	int modify(Comment comment) throws Exception;
	
	int maxStep(Integer ref) throws Exception;
	
	int updateStep(Comment comment) throws Exception;
}