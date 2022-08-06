package com.spring.client.missionReply.dao;

import java.util.List;

import com.spring.client.missionReply.vo.MissionReplyVO;

public interface MissionReplyDAO {
	public List<MissionReplyVO> MissionReplyList(Integer m_no);

}
