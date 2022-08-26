package com.spring.client.campaignboardReply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.client.campaignboardReply.dao.CampaignboardReplyDao;
import com.spring.client.campaignboardReply.vo.CampaignboardReplyVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CampaignboardReplyServiceImpl implements CampaignboardReplyService {
	
	private CampaignboardReplyDao campaignboardReplyDao;
	
	@Override
	public List<CampaignboardReplyVo> campaignboardReplyList(Integer c_no) {
		List<CampaignboardReplyVo> list = null;
		list = campaignboardReplyDao.campaignboardReplyList(c_no);
		return list;
	}
	
	
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
