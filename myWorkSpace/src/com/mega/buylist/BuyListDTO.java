package com.mega.buylist;

import java.sql.Date;

import lombok.Data;
@Data
public class BuyListDTO {
	private int buylistno;
	private Date buylistdate;
	private String isreview;
	private int productno;
	private int buyuserno;
	private int selluserno;
	private String title;
	private String image;
	private String price;
	private String paymethod;
	private String user_name;
}
