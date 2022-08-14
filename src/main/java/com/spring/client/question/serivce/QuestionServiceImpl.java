package com.spring.client.question.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.mission.common.vo.FileUploadUtil;
import com.spring.client.question.dao.QuestionDao;
import com.spring.client.question.vo.QuestionVO;

import lombok.Setter;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Setter(onMethod_=@Autowired)
	private QuestionDao questionDao;
	
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> list = null;
		list = questionDao.questionList(qvo);
		return list;
	}

	@Override
	public int questionListCnt(QuestionVO qvo) {
		int total = questionDao.questionListCnt(qvo);
		return total;
	}

	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDao.questionDetail(qvo);
		if(detail != null)
			detail.setQ_content(detail.getQ_content().toString().replace("\n", "<br/>"));
		return detail;
	}

	@Override
	public int questionInsert(QuestionVO qvo)throws Exception {
		int result=0;
		
		if(qvo.getFile().getSize()> 0) {
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "question");
			qvo.setQ_file(fileName);
		}
		result = questionDao.questionInsert(qvo);
		return result;
	}

}
