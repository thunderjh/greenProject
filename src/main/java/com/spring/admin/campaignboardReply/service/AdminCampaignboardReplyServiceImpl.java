package com.spring.admin.campaignboardReply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.campaignboardReply.dao.AdminCampaignboardReplyDao;
import com.spring.admin.campaignboardReply.vo.AdminCampaignboardReplyVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminCampaignboardReplyServiceImpl implements AdminCampaignboardReplyService{
	
	private AdminCampaignboardReplyDao adminCampaignboardReplyDao;
	
	@Override
	public List<AdminCampaignboardReplyVo> adminCampaignboardReplyList(Integer c_no) {
		List<AdminCampaignboardReplyVo> list = null;
		list = adminCampaignboardReplyDao.adminCampaignboardReplyList(c_no);
		return list;
	}

	@Override
	public int adminCampaignboardReplyInsert(AdminCampaignboardReplyVo cb_rvo) {
		int result = adminCampaignboardReplyDao.adminCampaignboardReplyInsert(cb_rvo);
		return result;
	}

	@Override
	public int adminCampaignboardReplyDelete(AdminCampaignboardReplyVo cb_rvo) {
		int result = adminCampaignboardReplyDao.adminCampaignboardReplyDelete(cb_rvo);
		return result;
	}

}
