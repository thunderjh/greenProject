package com.spring.client.campaignboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.campaignboard.dao.CampaignBoardDao;
import com.spring.client.campaignboard.vo.CampaignBoardVo;


import lombok.Setter;

@Service
public class CampaignBoardServiceImlp implements CampaignBoardService {
	/**/
	@Setter(onMethod_ = @Autowired)
	private CampaignBoardDao campaignBoardDao;
	
	
	@Override
	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo) {
		List<CampaignBoardVo> list = null;
		list = campaignBoardDao.campaignBoardList(cbvo);
		return list;
	}

}
