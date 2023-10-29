package dao;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import dto.User;
import util.JDBConnect;

public class UserDao extends JDBConnect {

	public UserDao(ServletContext application) {
		super(application);
	}

	public int insertUser(User user) {
		int res = 0;
		
		try {
			String query = "INSERT INTO user (id, password, tel, email, gender, agree) VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getTel());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getAgree());
			
			res = pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
}
