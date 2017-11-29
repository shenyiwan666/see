package com.see.entity;

import java.util.Date;

public class Follow {
	private int fid;
	private int aid;
	private int followAid;
	private Date ftime;
	
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getFollowAid() {
		return followAid;
	}
	public void setFollowAid(int followAid) {
		this.followAid = followAid;
	}
	public Date getFtime() {
		return ftime;
	}
	public void setFtime(Date ftime) {
		this.ftime = ftime;
	}
	@Override
	public String toString() {
		return "follow [fid=" + fid + ", aid=" + aid + ", followAid=" + followAid + ", ftime=" + ftime + "]";
	}
	
}
