package com.fcjava.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductReviewDTO {
	private int num;
	private String title;
	private String content;
	private String createdAt;
	private String updatedAt;
	private String user;
}
