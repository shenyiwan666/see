package com.see.service;


import com.see.entity.Account;
import com.see.entity.Weibo;
import com.see.vo.Page;

public interface AccountService {

	/**
	 * 用户登录
	 * <b>测试登录</b>
	 * @param email 注册邮箱
	 * @param password 密码
	 * @return com.hwadee.spring_mybatis.entity.Account
	 */
	Account login(String email, String password);
	
	int insert(Account account);

	Account findById(int id);
	
	Account getAccount(int id);
	
	int transfer(int a, int b, int fans);
	
	/**
	 * 帐号搜索
	 * @param q 搜索关键字
	 * @return  List<Account>
	 */
	Page search(String q, Integer p);
	
	int delete(int aid);

}