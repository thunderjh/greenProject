package com.spring.client.mission.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MissionCommonVO {

	// 검색
	private String search = "";
	private String keyword = "";

	// 페이징처리
	private int pageNum = 0;
	private int amount = 0;

	public MissionCommonVO() {
		this(1, 10);
	}

	public MissionCommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
