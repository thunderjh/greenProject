package com.spring.client.question.serivce;

import java.io.IOException;
import java.util.List;

import com.spring.client.question.vo.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> questionList(QuestionVO qvo);
	public int questionListCnt(QuestionVO qvo);
	public QuestionVO questionDetail(QuestionVO qvo);
	public int questionInsert(QuestionVO qvo)throws Exception;
	public int replyCnt(int q_num);
	public int pwdConfirm(QuestionVO qvo);
	public QuestionVO updateForm(QuestionVO qvo);
	public int questionUpdate(QuestionVO qvo) throws IOException;
	public int questionDelete(QuestionVO qvo) throws IOException;

}
