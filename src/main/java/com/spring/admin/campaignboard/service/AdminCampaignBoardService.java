package com.spring.admin.campaignboard.service;

import java.util.List;

import com.spring.client.campaignboard.vo.CampaignBoardVo;

public interface AdminCampaignBoardService {

	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo);

	public int campaignBoardInsert(CampaignBoardVo cbvo) throws Exception;

	public CampaignBoardVo campaignBoardDetail(CampaignBoardVo cbvo);



}
