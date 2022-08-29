package com.spring.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum = 0;
	private int amount = 0;
	
	//조건검색시 사용할 필드(검색대상, 검색 단어)
	private String search = "";
	private String keyword = "";
	
	//날짜 검색시 사용할 필드(시작일, 종료일)
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1,5);
	}
	
	public CommonVO(int pageNum, int  amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
