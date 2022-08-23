package com.spring.admin.campaignboardReply.service;

import java.util.List;

import com.spring.admin.campaignboardReply.vo.AdminCampaignboardReplyVo;

public interface AdminCampaignboardReplyService {
	
	public List<AdminCampaignboardReplyVo> adminCampaignboardReplyList(Integer c_no);
	public int adminCampaignboardReplyInsert(AdminCampaignboardReplyVo cb_rvo);
}
