package com.spring.admin.notice.dao;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;

public interface AdminNoticeDao {
	List<NoticeVO> noticeList(NoticeVO nvo);
	int noticeListCnt(NoticeVO nvo);
	NoticeVO noticeDetail(NoticeVO nvo);
	int noticeInsert(NoticeVO nvo);
	int noticeUpdate(NoticeVO nvo);
	int noticeDelete(int n_num);
	void readViewsUpdate(NoticeVO nvo);
}
