package com.spring.client.missionReply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.client.missionReply.dao.MissionReplyDAO;
import com.spring.client.missionReply.vo.MissionReplyVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MissionReplyServiceImpl implements MissionReplyService {

	private MissionReplyDAO missionReplyDAO;

	@Override
	public List<MissionReplyVO> MissionReplyList(Integer m_no) {
		List<MissionReplyVO> list = missionReplyDAO.MissionReplyList(m_no);
		return list;
	}

}
