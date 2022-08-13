package com.spring.client.profile.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false) 
public class ProfileVO {
	private String id = "";			//아이디
	private String email = "";		//이메일
	private String name = "";		//이름
	private String passwd = "";			//비밀번호
	private String phone = "";		//폰번호
	private String mmbwth = "";		//회원탈퇴
	private String approval_status = "";	//이메일 인증여부
	private String approval_key = "";	//이메일에 발송할 key
	
}