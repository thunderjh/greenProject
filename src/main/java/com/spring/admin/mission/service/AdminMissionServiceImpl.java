package com.spring.admin.mission.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.mission.dao.AdminMissionDAO;
import com.spring.client.mission.vo.MissionVO;

import lombok.AllArgsConstructor;
//관리자페이지포인트관리서비스클래스
@Service
@AllArgsConstructor
public class AdminMissionServiceImpl implements AdminMissionService {

	
	private AdminMissionDAO adminMissionDAO;

	@Override
	public List<MissionVO> missionList(MissionVO bvo) {
		List<MissionVO> list = adminMissionDAO.missionList(bvo);
		return list;
	}

	@Override
	public int pointPlus(MissionVO bvo) {
		int result = adminMissionDAO.pointPlus(bvo);
		return result;
	}

	@Override
	public int pointCancle(MissionVO bvo) {
		int result = adminMissionDAO.pointCancle(bvo);
		return result;
	}

	@Override
	public int totalPoint(MissionVO bvo) {
		int result = adminMissionDAO.totalPoint(bvo);
		return result;
	}

}
