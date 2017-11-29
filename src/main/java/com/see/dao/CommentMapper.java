package com.see.dao;

import java.util.List;

import com.see.entity.Comment;

public interface CommentMapper {

	List<Comment> findByWid(int wid);
	
	int delete(int aid);
	
	int insert(Comment comment);
	
}
