package com.see.service.impl;


import java.util.List;

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

	@Override
	public List<Weibo> findTop() {
		// TODO Auto-generated method stub
		return weiboMapper.findTop();
	}

	@Override
	public Weibo findByWid(int wid) {
		// TODO Auto-generated method stub
		return weiboMapper.findByWid(wid);
	}

	@Override
	public int update(Weibo weibo) {
		weiboMapper.update(weibo);
		int wid=weibo.getWid();
		Weibo newweibo=weiboMapper.findByWid(wid);

		return newweibo.getLiked();
	}

	
}
