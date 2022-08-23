package com.spring.admin.campaignboardReply.dao;

import java.util.List;

import com.spring.admin.campaignboardReply.vo.AdminCampaignboardReplyVo;




public interface AdminCampaignboardReplyDao {
	
	
	public List<AdminCampaignboardReplyVo> adminCampaignboardReplyList(Integer c_no);
	public int adminCampaignboardReplyInsert(AdminCampaignboardReplyVo cb_rvo);
}
