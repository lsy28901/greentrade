package com.mega.log;

import java.sql.Date;

import lombok.Data;
@Data
public class LogDTO {
	private int tradeno;
	private String title;
	private String price;
	private String paymethod;
	private Date tradestartdate;
	private Date tradesuccessdate;
	private String tadetype;
	private String trademethod;
	private String tradestatus;
	private int productno;
	private int buyuserno;
	private int selluserno;
}
