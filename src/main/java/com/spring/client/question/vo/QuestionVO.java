package com.spring.client.question.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QuestionVO extends CommonVO{
	private int q_num				=0;	//문의사항 번호
	private String id					="";	//아이디
	private String q_title			="";	//제목
	private String q_content	="";	//내용
	private String q_date			="";	//작성일자
	private String q_pwd			="";	//비밀번호
	
	private MultipartFile file;			//파일 업로드를 위한 피드
	private String q_file			="";	//첨부파일
	private int views					=0;	//조회수
	private int q_r_num			=0;	//댓글 번호
}
