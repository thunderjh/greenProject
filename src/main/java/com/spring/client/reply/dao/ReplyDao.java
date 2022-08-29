package com.spring.client.reply.dao;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyDao {
	public List<ReplyVO> replyList(Integer q_num);
	public int replyInsert(ReplyVO rvo);
	public int replyDelete(Integer r_num);
	public int replyUpdate(ReplyVO rvo);
	public int replyCnt(int q_num);
}
