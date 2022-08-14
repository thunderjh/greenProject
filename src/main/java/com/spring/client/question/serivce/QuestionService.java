package com.spring.client.question.serivce;

import java.util.List;

import com.spring.client.question.vo.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> questionList(QuestionVO qvo);
	public int questionListCnt(QuestionVO qvo);
	public QuestionVO questionDetail(QuestionVO qvo);
	public int questionInsert(QuestionVO qvo)throws Exception;

}
