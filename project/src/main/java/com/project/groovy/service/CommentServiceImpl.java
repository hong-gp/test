package com.project.groovy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groovy.dao.BoardDao;
import com.project.groovy.dao.CommentDao;
import com.project.groovy.model.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	private BoardDao boardDao;
	private CommentDao commentDao;
	
	public CommentServiceImpl() {
		super();
	}

	@Autowired
	public CommentServiceImpl(BoardDao boardDao, CommentDao commentDao) {
		super();
		this.boardDao = boardDao;
		this.commentDao = commentDao;
	}
	
	@Override
	public int getCount(Integer bno) throws Exception {
		return commentDao.count(bno);
	}
	
	@Override
	public int remove(Integer cno, Integer bno, String commenter) throws Exception {
		int rowCnt = commentDao.delete(cno, commenter);
		System.out.println("cno = " + cno + ", commenter = " + commenter);
		System.out.println("rowCnt = " + rowCnt);
		
		if (rowCnt == 1) {
			rowCnt = boardDao.updateCommentCnt(bno, -1);
		}
		System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
		return rowCnt;
	}
	
	@Override
	public int write(Comment comment) throws Exception {
		int rowCnt = commentDao.insert(comment);
		
		if (rowCnt == 1) {
			boardDao.updateCommentCnt(comment.getBno(), 1);
		}
		return rowCnt;
	}
	
	@Override
	public List<Comment> getList(Integer bno) throws Exception {
		return commentDao.selectAll(bno);
	}
	
	@Override
	public Comment read(Integer cno) throws Exception {
		return commentDao.select(cno);
	}
	
	@Override
	public int modify(Comment comment) throws Exception {
		return commentDao.update(comment);
	}

	@Override
	public int maxStep(Integer ref) throws Exception {
		return commentDao.maxStep(ref);
	}

	@Override
	public int updateStep(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		return commentDao.updateStep(comment);
	}
	
}
