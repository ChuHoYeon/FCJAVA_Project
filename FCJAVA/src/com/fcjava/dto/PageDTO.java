package com.fcjava.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {

	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;

}
