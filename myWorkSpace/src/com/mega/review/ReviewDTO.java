package com.mega.review;

import java.sql.Date;

import lombok.Data;
@Data
public class ReviewDTO {
	private int reviewno;
	private String reviewcontent;
	private int reviewscore;
	private Date reviewdate;
	private int reviewuserno;
	private int selleruserno;
	private String sellername;
	private String paymethod;
}
