package com.mega.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int productno;
	private String title;
	private String price;
	private int likenum;
	private String productStatus;
	private String productDetail;
	private String paymethod;
	private String trademethod;
	private String sellstatus;
	private Date adddate;
	private Date editdate;
	private int viewcount;
	private int userno;
	private String image;
	private String tradelocation;
}
