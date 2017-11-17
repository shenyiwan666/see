package com.see.service;

import java.util.List;

import com.see.entity.Follow;
import com.see.entity.Liked;
import com.see.entity.Weibo;

public interface WeiboService {
	
	int insert(Weibo weibo);
	
	List<Weibo> findTop();
	
	Weibo findByWid(int wid);
	
	int update(Weibo weibo);
	
	String findLiked(int aid,int wid);
	
	int likeddelete(int aid);
	
	int likedinsert(Liked liked);
	
	String findFollow(int aid,int followAid);
	
	int followdelete(int followAid);
	
	int followinsert(Follow follow);
}