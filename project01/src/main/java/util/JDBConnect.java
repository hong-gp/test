package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MySqlDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("MySqlUrl");
			String id = application.getInitParameter("MySqlId");
			String pw = application.getInitParameter("MySqlPw");
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
