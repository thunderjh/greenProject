package com.spring.client.missionReply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.client.missionReply.dao.MissionReplyDAO;
import com.spring.client.missionReply.vo.MissionReplyVO;

import lombok.AllArgsConstructor;
//미션댓글서비스구현클래스
@Service
@AllArgsConstructor
public class MissionReplyServiceImpl implements MissionReplyService {

	
	private MissionReplyDAO missionReplyDAO;

	@Override
	public List<MissionReplyVO> missionReplyList(Integer m_no) {
		List<MissionReplyVO> list = missionReplyDAO.missionReplyList(m_no);
		return list;
	}

	
	@Override
	public int missionReplyInsert(MissionReplyVO rvo) {
		int result =missionReplyDAO.missionReplyInsert(rvo);
		return result;
	}


	@Override
	public int missionReplyDelete(MissionReplyVO rvo) {
		int result = missionReplyDAO.missionReplyDelete(rvo);
		return result;
	}


	@Override
	public int missionReplyUpdate(MissionReplyVO rvo) {
		int result = missionReplyDAO.missionReplyUpdate(rvo);
		return result;
	}

}
