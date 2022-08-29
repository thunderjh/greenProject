package com.spring.client.question.serivce;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.mission.common.vo.FileUploadUtil;
import com.spring.client.question.dao.QuestionDao;
import com.spring.client.question.vo.QuestionVO;
import com.spring.client.reply.dao.ReplyDao;

import lombok.Setter;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Setter(onMethod_=@Autowired)
	private QuestionDao questionDao;
	
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
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
		
		questionDao.readViewsUpdate(qvo);
		
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

	@Override
	public int replyCnt(int q_num) {
		int result =0;
		result = replyDao.replyCnt(q_num);
		return result;
	}

	//��й�ȣ Ȯ�� ����
	@Override
	public int pwdConfirm(QuestionVO qvo) {
		int detail = 0;
		detail =  questionDao.pwdConfirm(qvo);
		return detail;
	}

	//�ۼ��� ����
	@Override
	public QuestionVO updateForm(QuestionVO qvo) {
		QuestionVO detail = null;
		detail =  questionDao.questionDetail(qvo);
		return detail;
	}

	//�ۼ��� ����
	@Override
	public int questionUpdate(QuestionVO qvo) throws IOException {
		int result = 0;
		if(!qvo.getFile().isEmpty()) {
			if(!qvo.getQ_file().isEmpty()) {
				FileUploadUtil.fileDelete(qvo.getQ_file());
			}
			
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "question");
			qvo.setQ_file(fileName);
		}
		result = questionDao.questionUpdate(qvo);
		return result;
	}
	
	//�ۻ��� ����
	@Override
	public int questionDelete(QuestionVO qvo) throws IOException {
		int result = 0;
		if(!qvo.getQ_file().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQ_file());
		}
		result = questionDao.questionDelete(qvo.getQ_num());
		return result;
	}
}
