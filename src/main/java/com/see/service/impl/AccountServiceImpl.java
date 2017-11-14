package com.see.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see.dao.AccountMapper;
import com.see.entity.Account;
import com.see.service.AccountService;
import com.see.vo.Page;
import com.see.vo.SearchVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountMapper accountMapper;
	

	@Override
	public Account login(String email, String password) {
		
		Account account = accountMapper.findByEmail(email);
		
		if( null == account || ! password.equals( account.getPassword() ) ) {
			throw new RuntimeException("用户名或密码错误");
		}
		
		return account;
	}

	@Transactional
	@Override
	public int transfer(int a, int b, int fans) {
		Account ab = new Account();
		ab.setAid(b);
		ab.setFans( fans );
		accountMapper.update(ab);
		
		Account aa = new Account();
		aa.setAid(a);
		aa.setFans(-fans);
		accountMapper.update(aa);
		
		return 0;
	}

	@Override
	public Account getAccount(int id) {
		// TODO Auto-generated method stub
		return accountMapper.findById(id);
	}

	@Override
	public Page search(String q, Integer p) {
		Page page = new Page(p);
		
		int count = accountMapper.count(q);
		page.setCount(count);
		
		List<Account> accounts = accountMapper.search(new SearchVO(q, page.getOffset(), page.getSize()));
		page.setList( accounts );
		
		
		System.out.println( page );
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

}
