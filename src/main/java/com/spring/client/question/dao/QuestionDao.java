package com.spring.client.question.dao;

import java.util.List;

import com.spring.client.question.vo.QuestionVO;

public interface QuestionDao {
	public List<QuestionVO> questionList(QuestionVO qvo);
	public int questionListCnt(QuestionVO qvo);
	public QuestionVO questionDetail(QuestionVO qvo);
	public int questionInsert(QuestionVO qvo);
}
