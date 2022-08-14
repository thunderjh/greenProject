package com.spring.client.campaignboard.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.campaignboard.vo.CampaignBoardVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CampaignBoardMapperTest {

	
	
			@Setter(onMethod_ = @Autowired)
			private CampaignBoardDao campaignBoardDao;
			
			@Test
			public void testCampaignBoardList() {
				CampaignBoardVo cbvo = new CampaignBoardVo();
				List<CampaignBoardVo> list = campaignBoardDao.campaignBoardList(cbvo);
				for(CampaignBoardVo vo : list) {
					log.info(vo);
				}
			}
}
