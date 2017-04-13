package com.scmaster.gittest.vo;

public class User {
	private String user_id;
	private String password;
	private String email;
	private String user_sex;
	private String reg_ymd;
	private String upd_ymd;
	
	public User(){}

	public User(String user_id, String password, String email, String user_sex, String reg_ymd, String upd_ymd) {
		this.user_id = user_id;
		this.password = password;
		this.email = email;
		this.user_sex = user_sex;
		this.reg_ymd = reg_ymd;
		this.upd_ymd = upd_ymd;
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

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getReg_ymd() {
		return reg_ymd;
	}

	public void setReg_ymd(String reg_ymd) {
		this.reg_ymd = reg_ymd;
	}

	public String getUpd_ymd() {
		return upd_ymd;
	}

	public void setUpd_ymd(String upd_ymd) {
		this.upd_ymd = upd_ymd;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", password=" + password + ", email=" + email + ", user_sex=" + user_sex
				+ ", reg_ymd=" + reg_ymd + ", upd_ymd=" + upd_ymd + "]";
	};
	
	
}	
