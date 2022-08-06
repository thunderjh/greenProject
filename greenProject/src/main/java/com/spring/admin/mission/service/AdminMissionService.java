package com.spring.admin.mission.service;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;

public interface AdminMissionService {
	public List<MissionVO> missionList(MissionVO bvo);

	public int pointPlus(MissionVO bvo);

	public int pointCancle(MissionVO bvo);

	public int totalPoint(MissionVO bvo);
}
