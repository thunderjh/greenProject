package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/replies")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	/*******************************************************************************
	 * ��� �۸�� �����ϱ�
	 * @return List<ReplyVO>
	 * ���� : @PathVariable�� URI�� ��ο��� ���ϴ� �����͸� �����ϴ� �뵵�� ������̼�.
	 * ���� ���� Ÿ���� xml�̳� json���� ��ȯ�� ���� produces �Ӽ��� ����Ѵ�.
	 * produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE }
	 * ���� ��û URL : http://localhost:8080/replies/all/�Խ��Ǳ۹�ȣ
	 * ���� ��û URL : http://localhost:8080/replies/replyList?b_num=�Խ��Ǳ۹�ȣ
	 * ResponseEntity�� �����ڰ� ���� ��� �����Ϳ� HTTP ���� �ڵ带 ���� ������ �� �ִ� Ŭ����.
	 * ******************************************************************************/
//	@GetMapping(value="/all/{b_num}", produces=MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num){
//		log.info("list ȣ�� ����");
//		
//		ResponseEntity<List<ReplyVO>> entity = null;
//		entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK);
//		return entity;
//	}
	
	@GetMapping(value="/all/{q_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("q_num") Integer q_num){
		log.info("list ȣ�� ����");
		
		List<ReplyVO> entity = null;
		entity = replyService.replyList(q_num);
		return entity;
	}
	
	/*******************************************************************************
	 * ��� �۾��� �����ϱ�
	 * @return String
	 * ���� : @RequestBody
	 * 			consumes �Ӽ��� �̿��ϸ� ����ڰ� Request Body�� ��� ������ �� ������
	 * 			��û�� ����� �ݵ��  application/json�� �����ؾ� �Ѵ�
	 * 			produces �Ӽ��� �߰��ϰ� dataType�� �����ϸ� �ش� ������ Ÿ�����θ�
	 * 			����ڿ��� �����ϰڴٴ� �ǹ̷� �ؼ��ϸ� �ȴ�.
	 * ���� ��û URL : http://localhost:8080/replies/replyInsert
	 * ******************************************************************************/
	@PostMapping(value="/replyInsert", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo) {
		log.info("replyInsert ȣ�� ����");
		log.info("ReplyVO : "+rvo);
		int result = 0;
		
		result = replyService.replyInsert(rvo);
		return (result==1) ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) :
										new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@PostMapping(value="/replyInsert", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
//	public String replyInsert(@RequestBody ReplyVO rvo) {
//		log.info("replyInsert ȣ�� ����");
//		log.info("ReplyVO : "+rvo);
//		int result = 0;
//		
//		result = replyService.replyInsert(rvo);
//		return (result==1) ? "SUCCESS" : "FAILURE";
//	}
	/*******************************************************************************
	 * ��� ���� �����ϱ�
	 * @return
	 * ���� : REST ��Ŀ��� UPDATE �۾��� PUT,PATCH����� �̿��ؼ� ó��
	 * 			  ��ü �����͸� �����ϴ� ����� PUT�� �̿��ϰ�,
	 * 			  �Ϻ��� �����͸� �����ϴ� ��쿡�� PATCH�� �̿�
	 * ���� ��û URL : http://localhost:8080/replies/��۹�ȣ
	 * ******************************************************************************/
//	@PutMapping(value="/{r_num}", consumes = "application/json", produces= MediaType.TEXT_PLAIN_VALUE)
//	public ResponseEntity<String> replyUpdate(@PathVariable("r_num") Integer r_num, @RequestBody ReplyVO rvo){
//		log.info("replyUpdate ȣ�� ����");
//		
//		rvo.setR_num(r_num);
//		int result = replyService.replyUpdate(rvo);
//		return result==1?
//				new ResponseEntity<String>("SUCCESS", HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	@PutMapping(value="/{q_r_num}", consumes = "application/json", produces= MediaType.TEXT_PLAIN_VALUE)
	public String replyUpdate(@PathVariable("q_r_num") Integer q_r_num, @RequestBody ReplyVO rvo){
		log.info("replyUpdate ȣ�� ����");
		
		rvo.setQ_r_num(q_r_num);
		int result = replyService.replyUpdate(rvo);
		return result==1? "SUCCESS": "FAILURE";
	}
	
	/*******************************************************************************
	 * ��� ���� �����ϱ�
	 * @return
	 * ���� : REST ��Ŀ��� DELETE �۾��� DELETE����� �̿��ؼ� ó��
	 * ���� ��û URL : http://localhost:8080/replies/��۹�ȣ
	 * ******************************************************************************/
	@DeleteMapping(value="/{q_r_num}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> replyDelete(@PathVariable("q_r_num") Integer q_r_num){
		log.info("replyDelete ȣ�� ����");
		log.info("q_r_num = " + q_r_num);
		
		int result = replyService.replyDelete(q_r_num);
		return result==1?
				new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

