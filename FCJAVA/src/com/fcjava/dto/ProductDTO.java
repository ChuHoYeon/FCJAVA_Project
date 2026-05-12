package com.fcjava.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
	private int productNo;
	private String category;
	private String name;
	private String price;
	private String image;
	private String memo;
	private String brand;
}
