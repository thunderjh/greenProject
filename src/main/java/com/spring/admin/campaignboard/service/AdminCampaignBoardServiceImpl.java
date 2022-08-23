package com.spring.admin.campaignboard.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.spring.admin.campaignboard.dao.AdminCampaignBoardDao;
import com.spring.client.campaignboard.vo.CampaignBoardVo;
import com.spring.client.mission.common.vo.FileUploadUtil;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class AdminCampaignBoardServiceImpl implements AdminCampaignBoardService{
	

	private AdminCampaignBoardDao adminCampaignBoardDao;
	
	@Override
	public List<CampaignBoardVo> campaignBoardList(CampaignBoardVo cbvo) {
		List<CampaignBoardVo> list = adminCampaignBoardDao.campaignBoardList(cbvo);
		return list;
	}
	//글입력 실제구현
	@Override
	public int campaignBoardInsert(CampaignBoardVo cbvo) throws Exception {
		int result = 0;
		
		/**예외 발생 코드
		bvo.setB_num(0);
		if(bvo.getB_num()==0) {
			throw new IllegalArgumentException("0번 글은 등록 불가능");
		}
		**/		
		
		if(cbvo.getFile().getSize()>0) {
			String fileName = FileUploadUtil.fileUpload(cbvo.getFile(), "campaign");
			cbvo.setC_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			cbvo.setC_thumb(thumbName);
			
		}
		
		result = adminCampaignBoardDao.campaignBoardInsert(cbvo);
		return result;
	}
	
	/*관리자 디테일*/
	@Override
	public CampaignBoardVo campaignBoardDetail(CampaignBoardVo cbvo) {
		CampaignBoardVo campaignBoardDetail = null;
		campaignBoardDetail = adminCampaignBoardDao.campaignBoardDetail(cbvo);
		if(campaignBoardDetail != null)
		{
			campaignBoardDetail.setC_content(campaignBoardDetail.getC_content().toString().replace("\n", "<br/>"));
			return campaignBoardDetail;
		}
		return campaignBoardDetail;
	}
	
	
	/*글 수정하기 - 맵핑*/
	@Override
		public CampaignBoardVo updateDataForm(CampaignBoardVo cbvo) {
			CampaignBoardVo updateData = adminCampaignBoardDao.campaignBoardDetail(cbvo);
			return updateData;
		}
	@Override
	public int campaignBoardUpdate(CampaignBoardVo cbvo) throws Exception {
		if (!cbvo.getFile().isEmpty()) {
			if (!cbvo.getC_file().isEmpty()) {
				FileUploadUtil.fileDelete(cbvo.getC_file());
				FileUploadUtil.fileDelete(cbvo.getC_thumb());
			}
			String fileName = FileUploadUtil.fileUpload(cbvo.getFile(), "campaign");
			cbvo.setC_file(fileName);
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			cbvo.setC_thumb(thumbName);
		}

		int result = adminCampaignBoardDao.campaignBoardUpdate(cbvo);

		return result;
	}
	/*글 삭제하기*/

	@Override
	public int campaignBoardDelete(CampaignBoardVo cbvo) throws Exception {
		int result = 0;
		if (!cbvo.getC_file().isEmpty()) {
			FileUploadUtil.fileDelete(cbvo.getC_file());
			FileUploadUtil.fileDelete(cbvo.getC_thumb());
		}
		
		result = adminCampaignBoardDao.campaignBoardDelete(cbvo.getC_no());
		return result;
	}



}




