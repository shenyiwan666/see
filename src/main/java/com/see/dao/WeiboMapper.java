package com.see.dao;

import java.util.List;


import com.see.entity.Weibo;

public interface WeiboMapper {
	
	
	Weibo findByWid(int wid);
	
	List<Weibo> findTop();

	int insert(Weibo weibo);
	
	int update(Weibo weibo);
}
