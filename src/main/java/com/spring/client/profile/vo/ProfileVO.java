package com.spring.client.profile.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProfileVO {
	private String id = "";			//���̵�
	private String email = "";		//�̸���
	private String name = "";		//�̸�
	private String passwd;			//��й�ȣ
	private String phone = "";		//����ȣ
	private int access_code = 0;	//�����ڵ�
	private String mmbwth = "";		//ȸ��Ż��

	
}