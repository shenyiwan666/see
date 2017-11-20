package com.see.see.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.see.entity.Account;
import com.see.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class AccountServiceTest {
	
	@Autowired
	private AccountService accountService;

	@Test
	public void testLogin() {
		Account account = accountService.login("wangwu@163.com", "123456");
		Assert.assertNotNull(account);
	}
	
}
