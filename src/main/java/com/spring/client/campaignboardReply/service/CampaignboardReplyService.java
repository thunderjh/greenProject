package com.spring.client.campaignboardReply.service;

import java.util.List;

import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

public interface CampaignboardReplyService {
	public List<CampaignboardReplyVo> campaignboardReplyList(Integer c_no);
	public int campaignboardReplyInsert(CampaignboardReplyVo cb_rvo);
	public int campaignboardReplyDelete(CampaignboardReplyVo cb_rvo);
}
