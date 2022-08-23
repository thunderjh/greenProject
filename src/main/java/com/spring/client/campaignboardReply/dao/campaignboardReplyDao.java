package com.spring.client.campaignboardReply.dao;

import java.util.List;

import com.spring.client.campaignboardReply.vo.campaignboardReplyVo;

public interface campaignboardReplyDao {

	public List<campaignboardReplyVo> campaignboardReplyList(Integer c_no);
	
	
}
