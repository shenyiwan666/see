package com.see.see.mapper;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.see.dao.AccountMapper;
import com.see.entity.Account;
import com.see.vo.SearchVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-context.xml"})
public class AccountMapperTest {
	

	@Autowired
	private AccountMapper accountMapper;
	
	

	@Test
	public void testFindById() {
		
		Account account = accountMapper.findById(1);
		
		Assert.assertNotNull( account );
		
		System.out.println( account );
	}

	@Test
	public void testFindByEmail() {
		fail("Not yet implemented");
	}

//	@Test
//	public void testFindAll() {
//		List<Integer> list = new ArrayList<>();
//		list.add(1);
//		list.add(2);
//		list.add(3);
//		list.add(4);
//		
//		List<Account> accounts =  accountMapper.findAll(list);
//		System.out.println( accounts );
//		
//	}
	@Test
	public void testInsert() {
		Account account = new Account();
		account.setEmail("abcdefghijklmn@abc.com");
		account.setNickName("这是测试昵称");
		account.setPassword("654321");
		account.setPic("2.jpg");
		
		int count = accountMapper.insert(account);
		
		System.out.println( account.getAid() );
		
		Assert.assertEquals(1, count);
	}
	
	
	@Test
	public void testUpdate() {
		Account account = new Account();
		account.setEmail("abc12345@abc.com");
		account.setNickName("这是修改后的测试昵称");
		account.setPassword("654321");
		account.setPic("3.jpg");
		account.setAid(144);
		
		int count = accountMapper.update(account);
		
		Assert.assertEquals(1, count);
	}
	
	@Test
	public void testDelete() {
		
		int count = accountMapper.delete(136);
		
		Assert.assertEquals(1, count);
	}

	
	@Test
	public void testSearch() {
		SearchVO svo = new SearchVO("三", 2, 1);
		
		
		List<Account> accounts = accountMapper.search( svo );
		
		System.out.println( accounts );
	}

}
