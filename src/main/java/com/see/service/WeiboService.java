package com.see.service;

import java.util.List;

import com.see.entity.Weibo;

public interface WeiboService {
	
	int insert(Weibo weibo);
	
	List<Weibo> findTop();
	
	Weibo findByWid(int wid);
	
	int update(Weibo weibo);
}