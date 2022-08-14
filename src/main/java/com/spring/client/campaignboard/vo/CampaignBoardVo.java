package com.spring.client.campaignboard.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class CampaignBoardVo {
	
	private int c_no = 0; //게시판 번호
 	private String c_title= ""; // 게시판 리스트 타이틀
	private String c_content =""; //게시판 리스트 소개
	private String c_file = ""; //게시판 리스트 이미지
	private String c_thumb = ""; //썸네일 파일명
	private int c_views =0; // 조회수
	private String c_date; // 작성일
	private String cat_title=""; //카테고리 종류
	private String a_id = ""; // 관리자 아이디
	private String c_detail_title = ""; // 디테일 제목
	private String c_detail_content = ""; // 디테일 내용
	private String c_detail_videoid = ""; // 디테일 유튜브 링크
	
	
	private MultipartFile file; // 파일 업로드를 위한 필드 input에서 name명과 일치시켜야 한다.
}
