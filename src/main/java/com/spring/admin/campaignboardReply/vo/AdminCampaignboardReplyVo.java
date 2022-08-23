package com.spring.admin.campaignboardReply.vo;

import lombok.Data;

@Data
public class AdminCampaignboardReplyVo {
	
	private int c_r_num=0; //댓글 순
	private int c_no=0; // 캠페인 게시글 번호
	private String a_id="";
	private String c_r_content="";
	private String c_r_date="";
}
