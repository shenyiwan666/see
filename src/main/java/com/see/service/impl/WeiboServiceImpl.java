package com.see.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see.dao.CommentMapper;
import com.see.dao.FollowMapper;
import com.see.dao.LikedMapper;
import com.see.dao.WeiboMapper;
import com.see.entity.Comment;
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
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public int insert(int aid,Weibo weibo){
	
		try {
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date now;
			now = dateFormat.parse(dateFormat.format(new Date()));
			java.sql.Date time=new java.sql.Date(now.getTime());
			
			weibo.setLastUpdateTime(time);
			weibo.setAid(aid);
			weibo.setLiked(0);
			weibo.setComment(0);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return weiboMapper.insert(weibo);
	}

	
	@Override
	public List<Weibo> findTop(int aid) {
		// TODO Auto-generated method stub
		List<Weibo> weibo=weiboMapper.findTop();
		
		for(int i=0;i<10;i++) {
			int topuser=weibo.get(i).getAccount().getAid();
			
			String s=String.valueOf(followMapper.findFollow(aid, topuser));
			
			if(s.equals("null")) {
				weibo.get(i).getAccount().setFollow("关注");
			}else {
				weibo.get(i).getAccount().setFollow("已关注");
			}
			
			if(topuser==aid) {
				weibo.get(i).getAccount().setFollow("");
			}
			
		}
		
		return weibo;
	}


	@Override
	public int setLiked(int aid,int wid) {
		
		Weibo weibo=weiboMapper.findByWid(wid);
		
		Boolean bool=likedMapper.findByAidWid(aid, wid);
		
		String s=String.valueOf(bool);
		
		if(s.equals("null")) {
			
			weibo.setLiked(weibo.getLiked()+1);
			
			Liked liked=new Liked();
			liked.setAid(aid);
			liked.setWid(weibo.getWid());
			likedMapper.insert(liked);
			
		}else {
		
			weibo.setLiked(weibo.getLiked()-1);
			likedMapper.delete(aid);
		}
		
		weiboMapper.update(weibo);
		
		return weibo.getLiked();
	}


	@Override
	public int setFollow(int aid, int followAid) {
		
		String s=String.valueOf(followMapper.findFollow(aid, followAid));
		
		if(s.equals("null")) {
			
			Follow follow=new Follow();
			follow.setAid(aid);
			follow.setFollowAid(followAid);
			followMapper.insert(follow);
			return 1;
			
		}else {
			
			followMapper.delete(followAid);
			return 0;
		}
				
	}


	@Override
	public List<Comment> showComment(int wid) {
		
		List<Comment> comment=commentMapper.findByWid(wid);
		
		return comment;
	}
	
	@Override
	public int insertComment(int wid,int aid,Comment comment){
	
		try {
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date now;
			now = dateFormat.parse(dateFormat.format(new Date()));
			java.sql.Date time=new java.sql.Date(now.getTime());
			
			comment.setCtime(time);
			comment.setAid(aid);
			comment.setWid(wid);
			
			Weibo weibo=weiboMapper.findByWid(wid);
			weibo.setComment(weibo.getComment()+1);
			weiboMapper.update(weibo);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentMapper.insert(comment);
	}
	
	
}

	

