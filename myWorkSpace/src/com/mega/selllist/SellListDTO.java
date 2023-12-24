package com.mega.selllist;

import java.sql.Date;

import lombok.Data;
@Data
public class SellListDTO {
	private int selllistno;
	private Date selllistdate;
	private int productno;
	private int buyuserno;
	private int selluserno;
	private String title;
	private String image;
	private String price;
	private String paymethod;
	private String user_name;
	
}
