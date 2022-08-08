package com.spring.client.question.vo;

import lombok.Data;

@Data
public class QuestionVO {
	private int q_num				=0;	//���ǻ��� ��ȣ
	private String id					="";	//���̵�
	private String q_title			="";	//����
	private String q_content	="";	//����
	private String q_date			="";	//�ۼ�����
	private int views					=0;	//��ȸ��
	private int q_r_num			=0;	//��� ��ȣ
}
