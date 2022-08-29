package com.spring.admin.notice.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.notice.dao.AdminNoticeDao;
import com.spring.client.mission.common.vo.FileUploadUtil;
import com.spring.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminNoticeServiceImpl implements AdminNoticeService{

	private AdminNoticeDao adminNoticeDao;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> list = adminNoticeDao.noticeList(nvo);
		return list;
	}

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		int total = adminNoticeDao.noticeListCnt(nvo);
		return total;
	}
	
	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		adminNoticeDao.readViewsUpdate(nvo);
		detail = adminNoticeDao.noticeDetail(nvo);
		if(detail != null)
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br/>"));
		return detail;
	}
	
	//글입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) throws Exception {
		int result=0;
		
		if(nvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(), "notice");
			nvo.setN_img_file(fileName);
		}
		result = adminNoticeDao.noticeInsert(nvo);
		return result;
	}

	@Override
	public NoticeVO updateForm(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = adminNoticeDao.noticeDetail(nvo);
		return detail;
	}

	//
	@Override
	public int noticeUpdate(NoticeVO nvo) throws IOException {
		int result = 0;
		if(!nvo.getFile().isEmpty()) {
			if(!nvo.getN_img_file().isEmpty()) {
				FileUploadUtil.fileDelete(nvo.getN_img_file());
			}
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(), "notice");
			nvo.setN_img_file(fileName);
		}
		result = adminNoticeDao.noticeUpdate(nvo);
		return result;
	}

	//글삭제 구현
	@Override
	public int noticeDelete(NoticeVO nvo) throws IOException {
		int result = 0;
		if(!nvo.getN_img_file().isEmpty()) {
			FileUploadUtil.fileDelete(nvo.getN_img_file());
		}
		result = adminNoticeDao.noticeDelete(nvo.getN_num());
		return result;
	}

}
