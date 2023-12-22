package com.mega.user;

import lombok.Data;

@Data
public class UserDTO {
	private int userno;//회원번호
	private String user_name;//이름
	private String user_call;//전화번호
	private String user_id;//아이디
	private String user_password;//비밀번호
	private String email;//이메일
	private String nickname;//닉네임
	private String imgurl;//프로필이미지
	private int greenscore;//그린스코어
	private int sellcount;//판매횟수
	private String staff;//역할
	private String address1;//주소
	private String address2;//상세주소
	private String postnum;//우편번호
}

