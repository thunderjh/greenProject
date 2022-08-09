package com.spring.client.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
//import lombok.EqualsAndHashCode;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends CommonVO{
	private int n_num				=0;	//글번호
	private String n_title			="";	//제목
	private String n_content	="";	//내용
	private String n_date			="";	//작성일
	private int views					=0;	//조회수
	
	private MultipartFile file;			//파일 업로드를 위한 필드
	private String n_img_file	="";	//실제 서버에 저장할 파일명
}
