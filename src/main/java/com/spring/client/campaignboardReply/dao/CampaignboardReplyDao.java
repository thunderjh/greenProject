package com.spring.client.campaignboardReply.dao;



import java.util.List;

import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

public interface CampaignboardReplyDao {
	
	public List<CampaignboardReplyVo> campaignboardReplyList(Integer c_no);
	public int campaignboardReplyInsert(CampaignboardReplyVo cb_rvo);
	public int campaignboardReplyDelete(CampaignboardReplyVo cb_rvo);
}
