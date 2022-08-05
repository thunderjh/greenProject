package com.spring.client.profile.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProfileVO {
	private String id = "";			//아이디
	private String email = "";		//이메일
	private String name = "";		//이름
	private String passwd;			//비밀번호
	private String phone = "";		//폰번호
	private int access_code = 0;	//접근코드
	private String mmbwth = "";		//회원탈퇴

	
}