package com.see.entity;

import java.util.Date;

public class Liked {
	
	private int aid;
	private int wid;
	private Date ltime;
	
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public Date getLtime() {
		return ltime;
	}
	public void setLtime(Date ltime) {
		this.ltime = ltime;
	}
	@Override
	public String toString() {
		return "Liked [aid=" + aid + ", wid=" + wid + ", ltime=" + ltime + "]";
	}
	
	
}
