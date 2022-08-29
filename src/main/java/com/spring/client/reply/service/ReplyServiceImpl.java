package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDao;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;


@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyDao replyDao;
	
	//�۸�� ����
	@Override
	public List<ReplyVO> replyList(Integer q_num) {
		List<ReplyVO> list = null;
		list = replyDao.replyList(q_num);
		return list;
	}
	
	//���Է� ����
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result =0;
		result = replyDao.replyInsert(rvo);
		return result;
	}

	//�ۼ��� ����
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result=0;
		result = replyDao.replyUpdate(rvo);
		return result;
	}

	//�ۻ��� ����
	@Override
	public int replyDelete(Integer q_r_num) {
		int result = 0;
		result = replyDao.replyDelete(q_r_num);
		return result;
	}

}
