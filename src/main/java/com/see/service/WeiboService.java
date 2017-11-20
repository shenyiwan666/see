package com.see.service;

import java.util.List;

import com.see.entity.Weibo;

public interface WeiboService {
	
	int insert(int aid,Weibo weibo);
	
	List<Weibo> findTop(int aid);
	
	int setLiked(int aid,int wid);
	
	int setFollow(int aid,int followAid);
	
}