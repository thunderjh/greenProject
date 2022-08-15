package com.spring.client.mission.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.client.mission.common.vo.MissionCommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
//미션게시판VO
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class MissionVO extends MissionCommonVO {
	
	private int m_no;
	private String id;
	private String a_id;
	private String m_title;
	private String m_content;
	private String m_date;
	private int m_views;
	private String m_c_name;

	private String m_p_approval;
	private int m_point;
//파일 업로드
	private MultipartFile file;
	private String m_thumb;
	private String m_file;

}
