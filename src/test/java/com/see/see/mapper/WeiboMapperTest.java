package com.see.see.mapper;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.see.dao.WeiboMapper;
import com.see.entity.Weibo;

public class WeiboMapperTest {

	private static SqlSessionFactory  sqlSessionFactory;
	private SqlSession session;

	private WeiboMapper weiboMapper;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream;
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Before
	public void before() {
		this.session = sqlSessionFactory.openSession();
		weiboMapper = this.session.getMapper( WeiboMapper.class );
	}
	@After
	public void after() {
		if( this.session != null ) {
			
			this.session.close();
		}
	}


//	@Test
//	public void testFindAll() {
//		List<Weibo> weibos = weiboMapper.findAll();
//		
//		String email = null; String nickName = null;String password = null;
//		
//		//select * from account where nick_name = nickName
//		//select * from account where email = email and nick_name = nickName
//		//select * from account
//		
//		// update account set email=?, nick_name=?, password=? where aid = 1
//		StringBuilder sql = new StringBuilder("update account ");
//		if( null != email && !"".equals(email) ) {
//			sql.append( " SET email = ? ,");
//		}
//		if( null != nickName && ! "".equals( nickName) ) {
//			sql.append(", nick_name = ? ");
//		}
//		
//		System.out.println( weibos );
//	}

}
