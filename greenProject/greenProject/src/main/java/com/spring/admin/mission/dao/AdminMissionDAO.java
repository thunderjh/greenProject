package com.spring.admin.mission.dao;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;

public interface AdminMissionDAO {
	public List<MissionVO> missionList(MissionVO bvo);

	public int pointPlus(MissionVO bvo);

	public int pointCancle(MissionVO bvo);
}
