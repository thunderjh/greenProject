package com.spring.client.mission.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.client.mission.common.vo.FileUploadUtil;
import com.spring.client.mission.dao.MissionDAO;
import com.spring.client.mission.vo.MissionVO;

import lombok.AllArgsConstructor;

//미션게시판서비스클래스
@Service
@AllArgsConstructor
public class MissionServiceImpl implements MissionService {

	
	private MissionDAO missionDAO;

	@Override
	public List<MissionVO> missionList(MissionVO bvo) {
		List<MissionVO> list = missionDAO.missionList(bvo);
		return list;
	}

	@Override
	public int missionInsert(MissionVO bvo) throws Exception {
		if (bvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "mission");
			bvo.setM_file(fileName);

			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setM_thumb(thumbName);
		}

		int result = missionDAO.missionInsert(bvo);
		return result;
	}

	@Override
	public MissionVO missionDetail(MissionVO bvo) {
		MissionVO detail = missionDAO.missionDetail(bvo);
		// 조회수 증가
		missionDAO.missionViewsUpdate(bvo);

		return detail;
	}

	@Override
	public MissionVO updateForm(MissionVO bvo) {
		MissionVO updateData = missionDAO.missionDetail(bvo);

		return updateData;
	}

	@Override
	public int missionDelete(MissionVO bvo) throws Exception {
		if (!bvo.getM_file().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getM_file());
			FileUploadUtil.fileDelete(bvo.getM_thumb());
		}

		int result = missionDAO.missionDelete(bvo.getM_no());
		return result;
	}

	@Override
	public int missionUpdate(MissionVO bvo) throws Exception {
		if (!bvo.getFile().isEmpty()) {
			if (!bvo.getM_file().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getM_file());
				FileUploadUtil.fileDelete(bvo.getM_thumb());
			}
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "mission");
			bvo.setM_file(fileName);
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setM_thumb(thumbName);
		}

		int result = missionDAO.missionUpdate(bvo);

		return result;
	}

}
