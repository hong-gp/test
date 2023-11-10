package com.project.groovy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groovy.model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSession session;
	String namespace = "com.project.groovy.Comment.";
	
	@Override
	public int deleteAll(Integer bno) throws Exception {
		return session.delete(namespace + "deleteAll", bno);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(namespace + "count", bno);
	}
	
	@Override
	public int delete(Integer cno, String commenter) throws Exception {
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("commenter", commenter);
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int insert(Comment comment) {
		return session.insert(namespace + "insert", comment);
	}
	
	@Override
	public List<Comment> selectAll(Integer bno) throws Exception {
		return session.selectList(namespace + "selectAll", bno);
	}
	
	@Override
	public Comment select(Integer cno) {
		return session.selectOne(namespace + "select", cno);
	}
	
	@Override
	public int update(Comment comment) {
		return session.update(namespace + "update", comment);
	}

	@Override
	public int maxStep(Integer ref) throws Exception {
		return session.selectOne(namespace + "maxStep", ref);
	}

	@Override
	public int updateStep(Comment comment) throws Exception {
		return session.update(namespace + "updateStep", comment);
	}

	@Override
	public int selectLast() throws Exception {
		return session.selectOne(namespace + "selectLast");
	}
	
	
}
