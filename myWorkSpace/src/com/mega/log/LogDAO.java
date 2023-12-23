package com.mega.log;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.product.ProductDTO;

import common.DBConnPool;

public class LogDAO extends DBConnPool {

	public List<LogDTO> getSellLogList(int userno) {
		List<LogDTO> selllogList = new ArrayList<LogDTO>();

		String query = "select logs.tradestatus, p.title,p.price,logs.tradestartdate, p.paymethod, p.trademethod, p.productno"
				+ " from product p join logs on p.productno = logs.productno "
				+ " where logs.selluserno=? and logs.tradetype='판매' and p.sellstatus = '판매중'"
				+ " order by logs.tradestartdate desc";

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
				System.out.println(logdto);
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
		try {
			// 트랜잭션 시작
			con.setAutoCommit(false);
			// product 테이블에서 해당 상품의 판매 등록 데이터 삭제
			psmt = con.prepareStatement(deleteProductQuery);
			psmt.setInt(1, productno);
			psmt.setInt(2, userno);
			result = psmt.executeUpdate();
			
			if(result>0) {
				// logs 테이블에서 해당 상품의 거래중인 상태인 데이터 삭제
				psmt = con.prepareStatement(deleteLogsQuery);
				psmt.setInt(1, productno);
				psmt.setInt(2, userno);
				psmt.executeUpdate();

			}
			
			// 트랜잭션 커밋
			con.commit();
		} catch (SQLException e) {
			// 롤백
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 트랜잭션 종료 후 자원 해제
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			close();
		}
	}
}
