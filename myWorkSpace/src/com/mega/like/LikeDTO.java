package com.mega.like;

import java.sql.Date;

import lombok.Data;
@Data
public class LikeDTO {
	private int likeno;
	private Date likedate;
	private int likestat;
	private int userno;
	private int productno;
	private String title;
	private String price;
	private String image;
	private String user_name;
	private String productstatus;
}
