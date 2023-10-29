package dto;

import java.util.Date;

public class User {

	private String id;
	private String pw;
	private String tel;
	private String email;
	private String gender;
	private String agree;
	private Date reg_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String id, String pw, String tel, String email, String gender, String agree) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.email = email;
		this.gender = gender;
		this.agree = agree;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", tel=" + tel + ", email=" + email + ", gender=" + gender + ", agree="
				+ agree + ", reg_date=" + reg_date + "]";
	}
	
}
