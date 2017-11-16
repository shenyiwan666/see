package com.see.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see.dao.WeiboMapper;
import com.see.entity.Weibo;
import com.see.service.WeiboService;


@Service
public class WeiboServiceImpl implements WeiboService {
	
	
	@Autowired
	private WeiboMapper weiboMapper;
	
	@Override
	public int insert(Weibo weibo) {
		
		int wb=weiboMapper.insert(weibo);
		if( wb != 1 ) {
			throw new RuntimeException("发送失败");
		}
		
		return wb;
	}

	
}
