package com.spring.admin.campaignboard.dao;

import java.util.List;



import com.spring.client.campaignboard.vo.CampaignBoardVo;


public interface AdminCampaignBoardDao {
	
	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo); //게시판 리스트 표현

	public int campaignBoardInsert(CampaignBoardVo cbvo) throws Exception;

	public CampaignBoardVo campaignBoardDetail(CampaignBoardVo cbvo);
	
	public CampaignBoardVo updateDataForm(CampaignBoardVo cbvo);
	
	public int campaignBoardUpdate(CampaignBoardVo cbvo);
	
	public int campaignBoardDelete(int c_no);
	
	public int campaignBoardView(CampaignBoardVo cbvo);
	
	public int comment_cnt(int c_no);
	
}
