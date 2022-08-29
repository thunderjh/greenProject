package com.spring.client.campaignboardReply.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CampaignBoardReplyTest {
	/**/
	@Setter(onMethod_ = @Autowired)
	private CampaignboardReplyDao campaignboardReplyDao;
	
	@Test
	public void testReplyInsert() {
		CampaignboardReplyVo cbrvo= new CampaignboardReplyVo();
		cbrvo.setC_no(25);
		cbrvo.setId("green123");
		cbrvo.setC_r_content("하나둘셋야");
		int result = campaignboardReplyDao.campaignboardReplyInsert(cbrvo);
		
		log.info("입력 결과  : " + result);
	}
	
	
}
