package com.spring.client.question.vo;

import lombok.Data;

@Data
public class QuestionVO {
	private int q_num				=0;	//문의사항 번호
	private String id					="";	//아이디
	private String q_title			="";	//제목
	private String q_content	="";	//내용
	private String q_date			="";	//작성일자
	private int views					=0;	//조회수
	private int q_r_num			=0;	//댓글 번호
}
