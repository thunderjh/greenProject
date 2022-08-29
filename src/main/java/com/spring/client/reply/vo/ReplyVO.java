package com.spring.client.reply.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int q_r_num				=0;	//댓글번호
	private String q_r_content		="";	//댓글 내용
	private String q_r_date			="";	//댓글 작성일
	private String q_r_passwd		="";	//댓글 비밀번호
	private int q_num					=0;	//문의사항 번호
	private String q_name			="";	//작성자
}

