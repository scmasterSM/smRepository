package com.scmaster.gittest.vo;

public class User {
	private String user_id;
	private String password;
	private String email;
	private String user_sex;
	private String reg_ymd;
	private String upd_ymd;
	
	public User(){};
	
	public User(String user_id, String password, String email, String sex, String reg_date, String upd_date) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.email = email;
		this.user_sex = sex;
		this.reg_ymd = reg_date;
		this.upd_ymd = upd_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return user_sex;
	}

	public void setSex(String sex) {
		this.user_sex = sex;
	}

	public String getReg_date() {
		return reg_ymd;
	}

	public void setReg_date(String reg_date) {
		this.reg_ymd = reg_date;
	}

	public String getUpd_date() {
		return upd_ymd;
	}

	public void setUpd_date(String upd_date) {
		this.upd_ymd = upd_date;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", password=" + password + ", email=" + email + ", sex=" + user_sex
				+ ", reg_date=" + reg_ymd + ", upd_date=" + upd_ymd + "]";
	}
	
	
}	
