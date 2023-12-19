package com.mega.report;

import lombok.Data;

@Data
public class ReportDTO {
	private int reportid;
    private int reporterid;
    private int targetid;
    private java.sql.Date reportdate;
    private String reportimgurl;
    private String reportcontent;
    private String reporttitle;
    private String reporterNickname;
    private String targetNickname;
}
