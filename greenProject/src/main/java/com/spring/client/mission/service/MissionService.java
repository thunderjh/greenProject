package com.spring.client.mission.service;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;

public interface MissionService {
	public List<MissionVO> missionList(MissionVO bvo);

	public int missionInsert(MissionVO bvo) throws Exception;

	public MissionVO missionDetail(MissionVO bvo);

	public MissionVO updateForm(MissionVO bvo);

	public int missionUpdate(MissionVO bvo) throws Exception;

	public int missionDelete(MissionVO bvo) throws Exception;
}
