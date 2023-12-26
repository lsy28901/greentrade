package com.mega.heart;

import java.sql.Date;

import lombok.Data;

@Data
public class HeartDTO {
	private int likenum;
	private Date likedate;
	private int likestat;
	private int userno;
	private int productno;
}
