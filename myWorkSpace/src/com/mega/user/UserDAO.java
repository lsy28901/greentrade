package com.mega.user;

import java.sql.SQLException;

import common.DBConnPool;

public class UserDAO extends DBConnPool {


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
		
		String query = "INSERT into address (addno, receivername, phone, address1, address2, postnum, userid)"
				+ " values (add_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
				//+ receivername = ?, phone = ?, address1 = ?, address2 = ?, postnum = ?"
				
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

		closeRsAndPsmt();

		return result;// 회원가입 성공유무

	}
	
	public JoinDTO dupliUserDTO(String uid) {
		JoinDTO dto = new JoinDTO();

		String sql = "select * from user_table_real where user_id=?";

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
	public UserDTO getUserDTO(int userno) {

		UserDTO dto = new UserDTO();

		String sql = "select * from user_table_real where userno=? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userno);
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
	
	public UserDTO findpasswordDTO(String uid) {

		UserDTO dto = new UserDTO();

		String sql = "select * from user_table_real where user_id=?";

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
	
	//배송지정보 가져오기
	public UserDTO getUserAdd(int userno) {

		UserDTO dto = new UserDTO();

		String sql = "select * from user_table_real where userno=? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userno);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setUserno(rs.getInt("userno"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_call(rs.getString("user_call"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setPostnum(rs.getString("postnum"));

			}

		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeRsAndPsmt();
		}
		
		return dto;

	}
	
	
	
	//판매자정보 페이지
			public UserDTO sellerInfo(int userno) {

				UserDTO dto = new UserDTO();

				String sql = "SELECT u.userno, u.nickname, u.imgurl, u.greenscore,"
					       + " COUNT(*) AS reviewCount FROM review r"
					       + " JOIN user_table_real u ON r.selleruserno = u.userno"
					       + " WHERE r.selleruserno IN (SELECT userno FROM user_table_real WHERE userno = ?)"
					       + " GROUP BY u.userno, u.nickname, u.imgurl, u.greenscore";

				try {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1, userno);
					rs = psmt.executeQuery();
					
					if (rs.next()) {
						dto.setUserno(rs.getInt("userno"));
						dto.setNickname(rs.getString("nickname"));
						dto.setGreenscore(rs.getInt("greenscore"));
						dto.setImgurl(rs.getString("imgurl"));
						dto.setReviewCount(rs.getInt("reviewCount"));
					}

				} catch (SQLException e) { // TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					System.out.println(dto.getNickname());
					System.out.println("판매자정보 조회");
					closeRsAndPsmt();
				}

				return dto;

			}
			
			//비밀번호 업데이트
			public UserDTO updatepasswordDTO(String uid, String upass) {

			    UserDTO dto = new UserDTO();

			    String updatesql = "UPDATE user_table_real SET user_password = ? WHERE user_id = ?";
			    String selectsql = "SELECT * FROM user_table_real WHERE user_id = ?";
			    
			    try {
			        // 비밀번호 업데이트
			        psmt = con.prepareStatement(updatesql);
			        psmt.setString(1, upass);
			        psmt.setString(2, uid);
			        psmt.executeUpdate();

			        // 업데이트된 정보를 가져옴
			        psmt = con.prepareStatement(selectsql);
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

			    } catch (SQLException e) {
			        e.printStackTrace();
			    } finally {
			        close();
			    }

			    return dto;
			}
			
			//회원가입시 address테이블에 데이터삽입
			public int insertAddress(JoinDTO add) {
				int result = 0;
				
				String query = "INSERT into address (addno, receivername, phone, address1, address2, postnum, userid)"
						+ " values (add_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
						
				try {
					psmt = con.prepareStatement(query);

					psmt.setString(1, add.getUser_name());
					psmt.setString(2, add.getUser_call());
					psmt.setString(3, add.getAddress1());
					psmt.setString(4, add.getAddress2());
					psmt.setString(5, add.getPostnum());
					psmt.setString(6, add.getUser_id());

					result = psmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
          e.printStackTrace();
        }
          close();
            
          return result;// 회원가입 성공유무
      }
  
			public UserDTO findUserIdDTO(String uemail, String ucall) {

				UserDTO dto = new UserDTO();

				String sql = "select * from user_table_real where email=? and user_call=?";

				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, uemail);
					psmt.setString(2, ucall);
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
