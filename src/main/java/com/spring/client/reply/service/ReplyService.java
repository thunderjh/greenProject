package com.spring.client.reply.service;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Integer q_num);
	public int replyInsert(ReplyVO rvo);
	public int replyDelete(Integer q_r_num);
	public int replyUpdate(ReplyVO rvo);
}
