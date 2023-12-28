package com.mega.log;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.product.ProductDTO;

import common.DBConnPool;

public class LogDAO extends DBConnPool {

	public List<LogDTO> getSellLogList(int userno) {
		List<LogDTO> selllogList = new ArrayList<LogDTO>();

		String query = "select logs.tradestatus, p.title,p.price,logs.tradestartdate, p.paymethod, p.trademethod, p.productno, logs.buyuserno"
				+ " from product p join logs on p.productno = logs.productno "
				+ " where logs.selluserno=? and logs.tradetype='판매' " + " order by logs.tradestartdate desc";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs = psmt.executeQuery();

			while (rs.next()) {
				LogDTO logdto = new LogDTO();
				logdto.setProductno(rs.getInt("productno"));
				logdto.setTradestatus(rs.getString("tradestatus"));
				logdto.setTitle(rs.getString("title"));
				logdto.setPrice(rs.getString("price"));
				logdto.setTradestartdate(rs.getDate("tradestartdate"));
				logdto.setPaymethod(rs.getString("paymethod"));
				logdto.setTrademethod(rs.getString("trademethod"));
				logdto.setBuyuserno(rs.getInt("buyuserno"));
				selllogList.add(logdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return selllogList;
	}

	public void deleteSellItem(int productno, int userno) {
		String deleteLogsQuery = "DELETE FROM logs WHERE productno=? and selluserno=?";
		String deleteProductQuery = "DELETE FROM product WHERE productno=? and userno=?";
		int result = 0;
		 // 1. 먼저 heart 테이블에서 관련된 레코드 삭제
        String deleteHeartQuery = "DELETE FROM heart WHERE productno = ?";
        

			// product 테이블에서 해당 상품의 판매 등록 데이터 삭제
			try {
				String deleteChatroomQuery = "DELETE FROM chatroom WHERE sellproduct = ?";
		        psmt = con.prepareStatement(deleteChatroomQuery);
		        psmt.setInt(1, productno);
		        psmt.executeUpdate();
				
				
				
				psmt = con.prepareStatement(deleteHeartQuery);
		        psmt.setInt(1, productno);
		        psmt.executeUpdate();
				
				
				psmt = con.prepareStatement(deleteProductQuery);
				psmt.setInt(1, productno);
				psmt.setInt(2, userno);
				result = psmt.executeUpdate();
				if (result > 0) {
					// logs 테이블에서 해당 상품의 거래중인 상태인 데이터 삭제
					psmt = con.prepareStatement(deleteLogsQuery);
					psmt.setInt(1, productno);
					psmt.setInt(2, userno);
					psmt.executeUpdate();

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
				

	}

	public List<LogDTO> getBuyLogList(int userno) {
		List<LogDTO> buylogList = new ArrayList<LogDTO>();

		String query = "select logs.tradestatus, p.title,p.price,logs.tradesuccessdate, p.paymethod, p.trademethod, logs.buyuserno, p.productno "
				+ " from product p join logs on p.productno = logs.productno"
				+ " where logs.buyuserno=? and logs.tradetype='구매' and p.sellstatus = '판매완료'"
				+ " order by logs.tradestartdate desc ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, userno);

			rs = psmt.executeQuery();

			while (rs.next()) {
				LogDTO logdto = new LogDTO();
				logdto.setProductno(rs.getInt("productno"));
				logdto.setTradestatus(rs.getString("tradestatus"));
				logdto.setTitle(rs.getString("title"));
				logdto.setPrice(rs.getString("price"));
				logdto.setTradesuccessdate(rs.getDate("tradesuccessdate"));
				logdto.setPaymethod(rs.getString("paymethod"));
				logdto.setTrademethod(rs.getString("trademethod"));
				logdto.setBuyuserno(rs.getInt("buyuserno"));
				buylogList.add(logdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return buylogList;
	}

	public void deleteLogs(int productno) {
		String query = "delete from logs where productno = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, productno);
			psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public int updateLogs(ProductDTO pdto, int userno) {
		int productresult = 0;
		String updateLogQuery = "UPDATE logs " + "SET tradestatus='거래완료', tradesuccessdate=SYSDATE, buyuserno = ? "
				+ "WHERE productno=? AND tradetype='판매' ";

		String insertLogQuery = "INSERT INTO logs "
				+ "VALUES(seq_tradeno.nextval, SYSDATE, SYSDATE, '구매', '택배거래', '거래완료', ?, ?, ?)";

		String updateProductQuery = "UPDATE product SET sellstatus='판매완료' WHERE productno=? ";

		try {
			// 트랜잭션 시작
			con.setAutoCommit(false);

			// 첫 번째 쿼리 수행
			psmt = con.prepareStatement(updateLogQuery);
			psmt.setInt(1, userno);
			psmt.setInt(2, pdto.getProductno());
			int updateresult = psmt.executeUpdate();
			System.out.println("updateresult : "+updateresult);
			if (updateresult > 0) {
				// 두 번째 쿼리 수행
				psmt = con.prepareStatement(insertLogQuery);
				psmt.setInt(1, pdto.getProductno());
				psmt.setInt(2, userno);
				psmt.setInt(3, pdto.getUserno());
				int insertresult = psmt.executeUpdate();
				System.out.println("insertresult : "+insertresult);
				if (insertresult > 0) {
					// 세 번째 쿼리 수행
					psmt = con.prepareStatement(updateProductQuery);
					psmt.setInt(1, pdto.getProductno());
					productresult = psmt.executeUpdate();
					System.out.println("productresult : "+productresult);
					// 모든 작업이 성공하면 커밋
					if (productresult > 0) {
						con.commit();
					} else {
						// 실패 시 롤백
						con.rollback();
					}
				} else {
					// 실패 시 롤백
					con.rollback();
				}
			} else {
				// 실패 시 롤백
				con.rollback();
			}
		} catch (SQLException e) {
			try {
				// 예외 발생 시 롤백
				con.rollback();
			} catch (SQLException rollbackException) {
				rollbackException.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				// 트랜잭션 종료
				con.setAutoCommit(true);
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return productresult;
	}

}
