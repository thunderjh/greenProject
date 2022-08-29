package com.spring.client.campaignboard.service;

import java.util.List;

import com.spring.client.campaignboard.vo.CampaignBoardVo;

public interface CampaignBoardService {

	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo);
	
	public int campaignBoardListCnt(CampaignBoardVo cbvo);
	
	public CampaignBoardVo campaignBoardDetail(CampaignBoardVo cbvo);

}
