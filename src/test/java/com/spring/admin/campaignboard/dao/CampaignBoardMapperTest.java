package com.spring.admin.campaignboard.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.admin.campaignboardReply.dao.AdminCampaignboardReplyDao;
import com.spring.admin.campaignboardReply.dao.ReplyTest;
import com.spring.client.campaignboard.vo.CampaignBoardVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CampaignBoardMapperTest {
	/*
	@Setter(onMethod_ =@Autowired )
	private AdminCampaignBoardDao adminCampaignBoardDao;
	
	@Test
	public void testBoardList(){
		CampaignBoardVo cbvo = new CampaignBoardVo();
		cbvo.setPageNum(1);
		cbvo.setAmount(10);
		
		List<CampaignBoardVo> list = adminCampaignBoardDao.campaignBoardList(cbvo);
		for(CampaignBoardVo vo : list) {
			log.info(vo);
		}
		log.info("레코드수 : " + adminCampaignBoardDao.campaignBoardCnt(cbvo));
		
		
	}
	
	*/
}
