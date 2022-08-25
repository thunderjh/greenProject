package com.spring.client.campaign.common.vo;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private CommonVO cvo;

	public PageDTO(CommonVO cvo,int total) {
		
		this.total = total;
		this.cvo = cvo;

		this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cvo.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
