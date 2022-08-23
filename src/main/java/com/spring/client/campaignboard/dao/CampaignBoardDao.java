package com.spring.client.campaignboard.dao;

import java.util.List;

import com.spring.client.campaignboard.vo.CampaignBoardVo;

public interface CampaignBoardDao {
	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo); //게시판 리스트 표현

	public CampaignBoardVo campaignBoardDetail(CampaignBoardVo cbvo);
	
	public int campaignBoardView(CampaignBoardVo cbvo);
	
}
