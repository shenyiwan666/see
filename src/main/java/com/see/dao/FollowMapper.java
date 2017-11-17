package com.see.dao;

import com.see.entity.Follow;

public interface FollowMapper {

	Boolean findFollow(int aid,int followAid);
	
	int delete(int aid);
	
	int insert(Follow follow);
}
