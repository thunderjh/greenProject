package com.spring.client.campaign.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum = 0;
	private int amount = 0;
	
	
	private String search = "";
	private String keyword = "";
	
	
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1,9);
	}
	
	public CommonVO(int pageNum, int  amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
