package com.mega.user;

import java.sql.SQLException;

import common.DBConnPool;

public class UserDAO extends DBConnPool {

	public UserDAO() {
		super();
	}

	public UserDTO getUserDTO(String uid, String upass) {

		UserDTO dto = new UserDTO();

		String sql = "select * from user_table_real where user_id=? and user_password=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setUserno(rs.getInt("userno"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_call(rs.getString("user_call"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_password(rs.getString("user_password"));
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setGreenscore(rs.getInt("greenscore"));
				dto.setSellcount(rs.getInt("sellcount"));
				dto.setStaff(rs.getString("staff"));
				dto.setPostnum(rs.getString("postnum"));
				dto.setImgurl(rs.getString("imgurl"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		close();

		return dto;

	}

	public int insertJoinDTO(JoinDTO add) {
		int result = 0;
		String sql = "INSERT INTO user_table_real(userno,user_name, user_call, user_id, user_password, email, nickname, imgurl, staff, address1, address2, postnum)"
				+ " VALUES(user_no_add.nextval,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

//		"INSERT INTO report (reportid, reporterid, targetid, reportdate, reportimgurl, reportcontent, reporttitle) " +
//        "VALUES (report_seq.NEXTVAL, (SELECT userno FROM user_table WHERE nickname = '테스터1'), (SELECT userno FROM user_table WHERE nickname = ?),sysdate, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, add.getUser_name());
			psmt.setString(2, add.getUser_call());
			psmt.setString(3, add.getUser_id());
			psmt.setString(4, add.getUser_password());
			psmt.setString(5, add.getEmail());
			psmt.setString(6, add.getNickname());
			psmt.setString(7, add.getImgurl());
			psmt.setString(8, add.getStaff());
			psmt.setString(9, add.getAddress1());
			psmt.setString(10, add.getAddress2());
			psmt.setString(11, add.getPostnum());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close();

		return result;// 회원가입 성공유무

	}

	public UserDTO getUserDTO(String uid) {

		UserDTO dto = new UserDTO();

		String sql = "select * from user_table_real where user_id=? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setUserno(rs.getInt("userno"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_call(rs.getString("user_call"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_password(rs.getString("user_password"));
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setGreenscore(rs.getInt("greenscore"));
				dto.setSellcount(rs.getInt("sellcount"));
				dto.setStaff(rs.getString("staff"));
				dto.setPostnum(rs.getString("postnum"));
				dto.setImgurl(rs.getString("imgurl"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		close();

		return dto;

	}

}
