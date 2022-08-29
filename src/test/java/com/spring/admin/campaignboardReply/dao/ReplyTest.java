package com.spring.admin.campaignboardReply.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.admin.campaignboardReply.dao.AdminCampaignboardReplyDao;
import com.spring.admin.campaignboardReply.vo.AdminCampaignboardReplyVo;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyTest {
	
	@Setter(onMethod_ = @Autowired)
	private AdminCampaignboardReplyDao adminCampaignboardReplyDao;
	/*
	@Test
	public void  testReplyList() {
		List<AdminCampaignboardReplyVo> list = adminCampaignboardReplyDao.adminCampaignboardReplyList(1);
		for(AdminCampaignboardReplyVo vo : list) {
			log.info(vo);
		}
	}*/
	@Test
	public void testReplyInsert() {
		AdminCampaignboardReplyVo cbrvo= new AdminCampaignboardReplyVo();
		cbrvo.setC_no(13);
		cbrvo.setA_id("javauser");
		cbrvo.setC_r_content("안뇽하쉐요 바람이");
		int result = adminCampaignboardReplyDao.adminCampaignboardReplyInsert(cbrvo);
		
		log.info("입력 결과  : " + result);
				
	}
	
	
}
