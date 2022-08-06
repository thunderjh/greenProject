package com.spring.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JDBCTests {
	
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;

	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testConnection() {
		try (Connection conn = dataSource.getConnection()) {
			log.info(conn);
			log.info("오라클 데이터베이스에 정상적으로 연결");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testMybatis() {
		try (SqlSession session = sqlSessionFactory.openSession(); Connection conn = session.getConnection();) {
			log.info(session);
			log.info(conn);
			log.info("Mybatis 연동 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
