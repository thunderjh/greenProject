package com.spring.admin.mission.service;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;
//관리자페이지포인트관리서비스인터페이스
public interface AdminMissionService {
	
	public List<MissionVO> missionList(MissionVO bvo);

	public int pointPlus(MissionVO bvo);

	public int pointCancle(MissionVO bvo);

	public int totalPoint(MissionVO bvo);
	
	public int missionAdminDelete(MissionVO bvo) throws Exception;

}
