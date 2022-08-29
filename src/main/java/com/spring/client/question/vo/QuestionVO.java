package com.spring.client.question.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QuestionVO extends CommonVO{
	private int q_num				=0;	//���ǻ��� ��ȣ
	private String q_name			="";	//���̵�
	private String q_title			="";	//����
	private String q_content		="";	//����
	private String q_date			="";	//�ۼ�����
	private String q_pwd			="";	//��й�ȣ
	
	private MultipartFile file;			//���� ���ε带 ���� �ǵ�
	private String q_file			="";	//÷������
	private int views				=0;	//��ȸ��
	private int q_r_num				=0;	//��� ��ȣ
}
