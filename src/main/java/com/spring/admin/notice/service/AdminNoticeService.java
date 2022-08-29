package com.spring.admin.notice.service;

import java.io.IOException;
import java.util.List;

import com.spring.client.notice.vo.NoticeVO;

public interface AdminNoticeService {
	List<NoticeVO> noticeList(NoticeVO nvo);
	int noticeListCnt(NoticeVO nvo);
	NoticeVO noticeDetail(NoticeVO nvo);
	int noticeInsert(NoticeVO nvo) throws Exception;
	NoticeVO updateForm(NoticeVO nvo);
	int noticeUpdate(NoticeVO nvo) throws IOException;
	int noticeDelete(NoticeVO nvo) throws IOException;
}
