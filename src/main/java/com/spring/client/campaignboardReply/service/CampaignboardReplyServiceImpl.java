package com.spring.client.campaignboardReply.service;

import org.springframework.stereotype.Service;

import com.spring.client.campaignboardReply.dao.CampaignboardReplyDao;
import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CampaignboardReplyServiceImpl implements CampaignboardReplyService {
	
	private CampaignboardReplyDao campaignboardReplyDao;
	
	
	@Override
	public int campaignboardReplyInsert(CampaignboardReplyVo cb_rvo) {
		int result = campaignboardReplyDao.campaignboardReplyInsert(cb_rvo);
		return result;
	}

	//삭제
	@Override
	public int campaignboardReplyDelete(CampaignboardReplyVo cb_rvo) {
		int result = campaignboardReplyDao.campaignboardReplyDelete(cb_rvo);
		return result;
	}


}
