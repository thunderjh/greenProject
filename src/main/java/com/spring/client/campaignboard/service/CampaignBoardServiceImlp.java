package com.spring.client.campaignboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.client.campaignboard.dao.CampaignBoardDao;
import com.spring.client.campaignboard.vo.CampaignBoardVo;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class CampaignBoardServiceImlp implements CampaignBoardService {
	
	@Setter
	private CampaignBoardDao campaignBoardDao;
	
	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo) {
		List<CampaignBoardVo> list = null;
		list = campaignBoardDao.campaignBoardList(cbvo);
		return list;
	}
}
