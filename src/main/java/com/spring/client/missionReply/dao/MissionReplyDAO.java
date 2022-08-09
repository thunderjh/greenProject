package com.spring.client.missionReply.dao;

import java.util.List;

import com.spring.client.missionReply.vo.MissionReplyVO;
//미션댓글DAO
public interface MissionReplyDAO {
	
	public List<MissionReplyVO> missionReplyList(Integer m_no);
	public int missionReplyInsert(MissionReplyVO rvo);
	public int missionReplyUpdate(MissionReplyVO rvo);
	public int missionReplyDelete(MissionReplyVO rvo);

	

}
