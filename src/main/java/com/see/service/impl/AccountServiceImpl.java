package com.see.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.see.dao.AccountMapper;
import com.see.dao.FollowMapper;
import com.see.entity.Account;
import com.see.entity.Weibo;
import com.see.service.AccountService;
import com.see.vo.FindVO;
import com.see.vo.Page;
import com.see.vo.SearchVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountMapper accountMapper;
	
	@Autowired
	private FollowMapper followMapper;
	
	@Override
	public Account login(String email, String password) {
		
		Account account = accountMapper.findByEmail(email);
		
		if( null == account || ! password.equals( account.getPassword() ) ) {
			throw new RuntimeException("用户名或密码错误");
		}
		
		return account;
	}


	@Override
	public Page search(String q, Integer p, int aid) {
		Page page = new Page(p);
		
		int count = accountMapper.count(q);
		page.setCount(count);
		
		List<Weibo> accounts = accountMapper.search(new SearchVO(q, page.getOffset(), page.getSize()));
		int size=accounts.size();
		
		for(int i=0;i<size;i++) {
			int searchuser=accounts.get(i).getAccount().getAid();
			String s=String.valueOf(followMapper.findFollow(aid, searchuser));
			
			if(s.equals("null")) {
				accounts.get(i).getAccount().setFollow("关注");
			}else {
				accounts.get(i).getAccount().setFollow("已关注");
			}
			
			if(searchuser==aid) {
				accounts.get(i).getAccount().setFollow("");
			}
		}
		
		page.setList( accounts );
				
		return page;
	}

	@Override
	public int delete(int aid) {
		
		int rows = accountMapper.delete(aid);
		if( rows != 1 ) {
			throw new RuntimeException("删除失败");
		}
		
		return rows;
	}

	@Override
	public int insert(Account account) {
		// TODO Auto-generated method stub
		
		account.setFollows(0);
		account.setFans(0);
		account.setAllweibo(0);
		
		String email = String.valueOf(accountMapper.findByemail(account.getEmail()));
		String nick = String.valueOf(accountMapper.findByNickname(account.getNickName()));

		if( email.equals("null") && nick.equals("null") ) {
			accountMapper.insert(account);
			return 1;
		}else {
			
			return 0;
		}
	}

	
	@Override
	public Account findById(int id) {
		// TODO Auto-generated method stub
		Account account=accountMapper.findById(id);	
		
		return account;
	
	}

	@Override
	public Page findAll(int aid,Integer p) {

		Page page = new Page(p);
		
		int count = accountMapper.countAll(aid);
		page.setCount(count);
		List<Weibo> weibos = accountMapper.findAll(new FindVO(aid, page.getOffset(), page.getSize()));
		
		page.setList( weibos );
		
		return page;
	}
	
//	@Override
//	public List<Weibo> findAll(int aid) {
//		// TODO Auto-generated method stub
//		List<Weibo> accounts = accountMapper.findAll(aid);
//	
//		return accounts;
//	}


	@Override
	public List<Account> searchuser(String q,int aid) {
		// TODO Auto-generated method stub
		 List<Account> accounts=accountMapper.searchuser(q);
		 
		 for(int i=0;i<accounts.size();i++) {
			 int finduser=accounts.get(i).getAid();
			 String s=String.valueOf(followMapper.findFollow(aid, finduser));
			 
			 if(s.equals("null")) {
					accounts.get(i).setFollow("关注");
				}else {
					accounts.get(i).setFollow("已关注");
				}
				
				if(finduser==aid) {
					accounts.get(i).setFollow("");
				}
			 
		 }
		 
		 return accounts;
	}


	@Override
	public int updatenickName(Account account) {
		// TODO Auto-generated method stub
		String nick = String.valueOf(accountMapper.findByNickname(account.getNickName()));
		if(nick.equals("null")) {
			accountMapper.updatenickName(account);
			return 1;
		}else {
			return 0;
		}
	}


	@Override
	public int updateemail(Account account) {
		// TODO Auto-generated method stub
		String email = String.valueOf(accountMapper.findByemail(account.getEmail()));
		if(email.equals("null")) {
			accountMapper.updateemail(account);
			return 1;
		}else {
			return 0;
		}
	}


	@Override
	public int updatepassword(Account account) {
		// TODO Auto-generated method stub
		accountMapper.updatepassword(account);
		return 0;
	}


	@Override
	public int updatepic(Account account) {
		// TODO Auto-generated method stub
		accountMapper.updatepic(account);
		return 0;
	}


	

}
