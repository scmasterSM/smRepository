package com.scmaster.gittest.vo;

public class Schedule {
	private int scd_sq;
	private String user_id;
	private String scd_title;
	private String scd_desc;
	private String scd_season;
	private String scd_theme;
	private String public_fl;
	private String start_ymd;
	private String day_cnt;
	
	public Schedule(){}

	public Schedule(int scd_sq, String user_id, String scd_title, String scd_desc, String scd_season, String scd_theme,
			String public_fl, String start_ymd, String day_cnt) {
		super();
		this.scd_sq = scd_sq;
		this.user_id = user_id;
		this.scd_title = scd_title;
		this.scd_desc = scd_desc;
		this.scd_season = scd_season;
		this.scd_theme = scd_theme;
		this.public_fl = public_fl;
		this.start_ymd = start_ymd;
		this.day_cnt = day_cnt;
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

	public String getScd_title() {
		return scd_title;
	}

	public void setScd_title(String scd_title) {
		this.scd_title = scd_title;
	}

	public String getScd_desc() {
		return scd_desc;
	}

	public void setScd_desc(String scd_desc) {
		this.scd_desc = scd_desc;
	}

	public String getScd_season() {
		return scd_season;
	}

	public void setScd_season(String scd_season) {
		this.scd_season = scd_season;
	}

	public String getScd_theme() {
		return scd_theme;
	}

	public void setScd_theme(String scd_theme) {
		this.scd_theme = scd_theme;
	}

	public String getPublic_fl() {
		return public_fl;
	}

	public void setPublic_fl(String public_fl) {
		this.public_fl = public_fl;
	}

	public String getStart_ymd() {
		return start_ymd;
	}

	public void setStart_ymd(String start_ymd) {
		this.start_ymd = start_ymd;
	}

	public String getDay_cnt() {
		return day_cnt;
	}

	public void setDay_cnt(String day_cnt) {
		this.day_cnt = day_cnt;
	}

	@Override
	public String toString() {
		return "Schedule [scd_sq=" + scd_sq + ", user_id=" + user_id + ", scd_title=" + scd_title + ", scd_desc="
				+ scd_desc + ", scd_season=" + scd_season + ", scd_theme=" + scd_theme + ", public_fl=" + public_fl
				+ ", start_ymd=" + start_ymd + ", day_cnt=" + day_cnt + "]";
	};
	
	
	
	
}
