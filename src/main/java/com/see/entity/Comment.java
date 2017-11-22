package com.see.entity;

import java.util.Date;

public class Comment {
	private int cid;
	private int aid;
	private int wid;
	private String ccontent;
	private Date ctime;
	private int show;
	
	private Account account;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
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
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", aid=" + aid + ", wid=" + wid + ", ccontent=" + ccontent + ", ctime=" + ctime
				+ ", show=" + show + ", account=" + account + "]";
	}


	
	


	
	
	

}
