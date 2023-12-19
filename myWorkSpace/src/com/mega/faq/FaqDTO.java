package com.mega.faq;

import lombok.Data;

@Data
public class FaqDTO {
	private int faqno;
	private String faqtitle;
	private String faqcontent;
	private java.sql.Date faqdate;
	private String faqcate;
}
