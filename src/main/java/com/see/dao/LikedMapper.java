package com.see.dao;

import com.see.entity.Liked;


public interface LikedMapper {

	Boolean findByAidWid(int aid,int wid);
	
	int delete(int aid);
	
	int insert(Liked liked);
	
}
