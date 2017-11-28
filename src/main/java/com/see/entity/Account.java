package com.see.entity;

import java.util.List;

public class Account {
	
	private Integer aid;
	private String nickName;
	private String email;
	private String password;
	private String pic;
	private Integer fans;
	private Weibo weibo;
	private String follow;
	private Integer allweibo;
	
	private List<Weibo> weibos;
	
	
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getFans() {
		return fans;
	}
	public void setFans(Integer fans) {
		this.fans = fans;
	}
	public List<Weibo> getWeibos() {
		return weibos;
	}
	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}
	
	public Weibo getWeibo() {
		return weibo;
	}
	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}
	
	public String getFollow() {
		return follow;
	}
	public void setFollow(String follow) {
		this.follow = follow;
	}
	
	
	public Integer getAllweibo() {
		return allweibo;
	}
	public void setAllweibo(Integer allweibo) {
		this.allweibo = allweibo;
	}
	@Override
	public String toString() {
		return "Account [aid=" + aid + ", nickName=" + nickName + ", email=" + email + ", password=" + password
				+ ", pic=" + pic + ", fans=" + fans + ", weibo=" + weibo + ", follow=" + follow + ", allweibo="
				+ allweibo + ", weibos=" + weibos + "]";
	}

	
}
