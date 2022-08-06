package com.spring.admin.mission.dao;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;
//관리자페이지포인트관리DAO
public interface AdminMissionDAO {
	
	public List<MissionVO> missionList(MissionVO bvo);

	public int pointPlus(MissionVO bvo);

	public int pointCancle(MissionVO bvo);
	
	public int totalPoint(MissionVO bvo);

}
