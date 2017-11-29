package com.see.dao;

import com.see.entity.Follow;

public interface FollowMapper {

	Boolean findFollow(int aid,int followAid);
	
	int delete(int followAid);
	
	int insert(Follow follow);
}
