package com.scmaster.gittest.vo;

public class Shared_Scd {
	private int shared_sq;
	private int scd_sq;
	private String user_id;
	
	public Shared_Scd() {}

	public Shared_Scd(int shared_sq, int scd_sq, String user_id) {
		super();
		this.shared_sq = shared_sq;
		this.scd_sq = scd_sq;
		this.user_id = user_id;
	}

	public int getShared_sq() {
		return shared_sq;
	}

	public void setShared_sq(int shared_sq) {
		this.shared_sq = shared_sq;
	}

	public int getScd_sq() {
		return scd_sq;
	}

	public void setScd_sq(int scd_sq) {
		this.scd_sq = scd_sq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Shared_Scd [shared_sq=" + shared_sq + ", scd_sq=" + scd_sq + ", user_id=" + user_id + "]";
	}

}
