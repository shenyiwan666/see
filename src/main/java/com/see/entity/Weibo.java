package com.see.entity;

import java.util.Date;

public class Weibo {
	
	private Integer wid;
	
	private Integer aid;
	
	private Account account;
	
	private String wcontent;
	
	private Date lastUpdateTime;
	
	private String service;
	
	private int liked;
	
	private int comment;

	public Integer getWid() {
		return wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getWcontent() {
		return wcontent;
	}

	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Weibo [wid=" + wid + ",aid=" + aid +" account=" + account + ", wcontent=" + wcontent + ", lastUpdateTime="
				+ lastUpdateTime + ", service=" + service + ", liked=" + liked + ", comment=" + comment + "]";
	}

}
