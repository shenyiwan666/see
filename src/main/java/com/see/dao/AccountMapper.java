package com.see.dao;

import java.util.List;

import com.see.entity.Account;
import com.see.entity.Weibo;
import com.see.vo.SearchVO;

public interface AccountMapper {
	
	
	//Account findById(@Param("id") int id, @Param("fans") int fans);
	Account findById(int id);
	
	Account findByEmail(String email);
	
	List<Weibo> findAll(int aid);
	
	int count(String q);
	
	List<Weibo> search(SearchVO svo);
	List<Account> searchuser(String q);
	
	int insert(Account account);
	
	int update(Account account);
	
	int delete(int id);
	
	

}
