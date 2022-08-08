package com.spring.client.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
//import lombok.EqualsAndHashCode;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends CommonVO{
	private int n_num				=0;	//�۹�ȣ
	private String n_title			="";	//����
	private String n_content	="";	//����
	private String n_date			="";	//�ۼ���
	private int views					=0;	//��ȸ��
	
	private MultipartFile file;			//���� ���ε带 ���� �ʵ�
	private String n_img_file	="";	//���� ������ ������ ���ϸ�
}
