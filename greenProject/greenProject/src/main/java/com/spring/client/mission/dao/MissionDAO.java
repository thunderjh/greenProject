package com.spring.client.mission.dao;

import java.util.List;

import com.spring.client.mission.vo.MissionVO;

public interface MissionDAO {
	public List<MissionVO> missionList(MissionVO bvo);
	
	public int missionViewsUpdate(MissionVO bvo);

	public int missionInsert(MissionVO bvo);

	public MissionVO missionDetail(MissionVO bvo);

	public MissionVO updateForm(MissionVO bvo);

	public int missionUpdate(MissionVO bvo);

	public int missionDelete(int m_no);


}
