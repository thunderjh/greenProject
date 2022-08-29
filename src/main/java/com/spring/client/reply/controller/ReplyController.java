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
	 * 댓글 글목록 구현하기
	 * @return List<ReplyVO>
	 * 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
	 * 응답 문서 타입을 xml이나 json으로 반환할 때는 produces 속성을 사용한다.
	 * produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE }
	 * 현재 요청 URL : http://localhost:8080/replies/all/게시판글번호
	 * 예전 요청 URL : http://localhost:8080/replies/replyList?b_num=게시판글번호
	 * ResponseEntity는 개발자가 직접 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스.
	 * ******************************************************************************/
//	@GetMapping(value="/all/{b_num}", produces=MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num){
//		log.info("list 호출 성공");
//		
//		ResponseEntity<List<ReplyVO>> entity = null;
//		entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK);
//		return entity;
//	}
	
	@GetMapping(value="/all/{q_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("q_num") Integer q_num){
		log.info("list 호출 성공");
		
		List<ReplyVO> entity = null;
		entity = replyService.replyList(q_num);
		return entity;
	}
	
	/*******************************************************************************
	 * 댓글 글쓰기 구현하기
	 * @return String
	 * 참고 : @RequestBody
	 * 			consumes 속성을 이용하면 사용자가 Request Body에 담는 제한할 수 있으며
	 * 			요청시 헤더에 반드시  application/json이 존재해야 한다
	 * 			produces 속성을 추가하고 dataType을 지정하면 해당 데이터 타입으로만
	 * 			사용자에게 응답하겠다는 의미로 해석하면 된다.
	 * 현재 요청 URL : http://localhost:8080/replies/replyInsert
	 * ******************************************************************************/
	@PostMapping(value="/replyInsert", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo) {
		log.info("replyInsert 호출 성공");
		log.info("ReplyVO : "+rvo);
		int result = 0;
		
		result = replyService.replyInsert(rvo);
		return (result==1) ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) :
										new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@PostMapping(value="/replyInsert", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
//	public String replyInsert(@RequestBody ReplyVO rvo) {
//		log.info("replyInsert 호출 성공");
//		log.info("ReplyVO : "+rvo);
//		int result = 0;
//		
//		result = replyService.replyInsert(rvo);
//		return (result==1) ? "SUCCESS" : "FAILURE";
//	}
	/*******************************************************************************
	 * 댓글 수정 구현하기
	 * @return
	 * 참고 : REST 방식에서 UPDATE 작업은 PUT,PATCH방식을 이용해서 처리
	 * 			  전체 데이터를 수정하는 경웨는 PUT을 이용하고,
	 * 			  일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 * 현재 요청 URL : http://localhost:8080/replies/댓글번호
	 * ******************************************************************************/
//	@PutMapping(value="/{r_num}", consumes = "application/json", produces= MediaType.TEXT_PLAIN_VALUE)
//	public ResponseEntity<String> replyUpdate(@PathVariable("r_num") Integer r_num, @RequestBody ReplyVO rvo){
//		log.info("replyUpdate 호출 성공");
//		
//		rvo.setR_num(r_num);
//		int result = replyService.replyUpdate(rvo);
//		return result==1?
//				new ResponseEntity<String>("SUCCESS", HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	@PutMapping(value="/{q_r_num}", consumes = "application/json", produces= MediaType.TEXT_PLAIN_VALUE)
	public String replyUpdate(@PathVariable("q_r_num") Integer q_r_num, @RequestBody ReplyVO rvo){
		log.info("replyUpdate 호출 성공");
		
		rvo.setQ_r_num(q_r_num);
		int result = replyService.replyUpdate(rvo);
		return result==1? "SUCCESS": "FAILURE";
	}
	
	/*******************************************************************************
	 * 댓글 삭제 구현하기
	 * @return
	 * 참고 : REST 방식에서 DELETE 작업은 DELETE방식을 이용해서 처리
	 * 현재 요청 URL : http://localhost:8080/replies/댓글번호
	 * ******************************************************************************/
	@DeleteMapping(value="/{q_r_num}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> replyDelete(@PathVariable("q_r_num") Integer q_r_num){
		log.info("replyDelete 호출 성공");
		log.info("q_r_num = " + q_r_num);
		
		int result = replyService.replyDelete(q_r_num);
		return result==1?
				new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

