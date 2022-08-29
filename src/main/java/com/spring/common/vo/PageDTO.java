package com.spring.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;	//화면에서 보여지는 페이지의 시작번호
	private int endPage;	//화면에서 보여지는 페이지의 끝번호
	private boolean prev, next;	//이전과 다음으로 이동한 링크의 표시 여부
	
	private int total;
	private CommonVO cvo;
	
	public PageDTO(CommonVO cvo, int total) {
		this.cvo = cvo;
		this.total = total;
		
		//페이징의 끝번호(endPage) 구하기
				//this.endPage = (int)(Math.ceil(페이지번호 / 5.0)) * 5;
		this.endPage = (int)(Math.ceil(cvo.getPageNum()/5.0))*5;
		this.startPage = this.endPage - 4;
		
		//페이징의 시작번호(startPage)구하기
		int realEnd = (int)(Math.ceil((total*1.0)/ cvo.getAmount()));
		
		//끝 페이지 구하기
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전 구하기
		this.prev = this.startPage > 1;
		
		//다음 구하기
		this.next = this.endPage < realEnd;
	}
}
