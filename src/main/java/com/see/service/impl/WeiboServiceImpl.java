package com.see.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see.dao.FollowMapper;
import com.see.dao.LikedMapper;
import com.see.dao.WeiboMapper;
import com.see.entity.Follow;
import com.see.entity.Liked;
import com.see.entity.Weibo;
import com.see.service.WeiboService;


@Service
public class WeiboServiceImpl implements WeiboService {
	
	
	@Autowired
	private WeiboMapper weiboMapper;
	
	@Autowired
	private LikedMapper likedMapper;
	
	@Autowired
	private FollowMapper followMapper;
	
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

	@Override
	public String findFollow(int aid, int followAid) {
		Boolean bool=followMapper.findFollow(aid, followAid);
		String s=String.valueOf(bool);
		return s;
	}

	@Override
	public int followdelete(int aid) {
		// TODO Auto-generated method stub
		return followMapper.delete(aid);
	}

	@Override
	public int followinsert(Follow follow) {
		int followed=followMapper.insert(follow);
		if(followed != 1 ) {
			throw new RuntimeException("添加失败");
		}
		
		return followed;
	}

	
}
