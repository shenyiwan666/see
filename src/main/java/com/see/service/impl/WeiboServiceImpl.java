package com.see.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see.dao.LikedMapper;
import com.see.dao.WeiboMapper;
import com.see.entity.Liked;
import com.see.entity.Weibo;
import com.see.service.WeiboService;


@Service
public class WeiboServiceImpl implements WeiboService {
	
	
	@Autowired
	private WeiboMapper weiboMapper;
	
	@Autowired
	private LikedMapper likedMapper;
	
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
		int wid=weibo.getWid();
		
		weiboMapper.update(weibo);
		
		Weibo newweibo=weiboMapper.findByWid(wid);

		return newweibo.getLiked();
	}

	@Override
	public String findLiked(int aid,int wid) {
		
		Boolean bool=likedMapper.findByAidWid(aid, wid);
		String s=String.valueOf(bool);
		return s;
	}

	@Override
	public int likeddelete(int aid) {
		// TODO Auto-generated method stub
		return likedMapper.delete(aid);
	}

	@Override
	public int likedinsert(Liked liked) {
		int like=likedMapper.insert(liked);
		if(like != 1 ) {
			throw new RuntimeException("添加失败");
		}
		
		return like;
	}

	
}
