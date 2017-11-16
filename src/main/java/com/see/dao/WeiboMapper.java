package com.see.dao;

import java.util.List;

import com.see.entity.Weibo;

public interface WeiboMapper {
	
	
	
	
	List<Weibo> findAll();

	int insert(Weibo weibo);
}
