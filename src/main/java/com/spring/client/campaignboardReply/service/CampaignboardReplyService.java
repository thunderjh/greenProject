package com.spring.client.campaignboardReply.service;

import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

public interface CampaignboardReplyService {
	
	public int campaignboardReplyInsert(CampaignboardReplyVo cb_rvo);
	public int campaignboardReplyDelete(CampaignboardReplyVo cb_rvo);
}
