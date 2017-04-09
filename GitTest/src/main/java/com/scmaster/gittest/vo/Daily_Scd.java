package com.scmaster.gittest.vo;

public class Daily_Scd {
	private int daily_sq;
	private int scd_sq;
	private int daily_ord;
	private String daily_ymd;
	private String area_code;
	private String sigungu_code;
	private int city_ord;
	private String city_nm;
	
	public Daily_Scd() {}

	public Daily_Scd(int daily_sq, int scd_sq, int daily_ord, String daily_ymd, String area_code, String sigungu_code, int city_ord, String city_nm) {
		super();
		this.daily_sq = daily_sq;
		this.scd_sq = scd_sq;
		this.daily_ord = daily_ord;
		this.daily_ymd = daily_ymd;
		this.area_code = area_code;
		this.sigungu_code = sigungu_code;
		this.city_ord = city_ord;
		this.city_nm = city_nm;
	}

	public int getDaily_sq() {
		return daily_sq;
	}

	public void setDaily_sq(int daily_sq) {
		this.daily_sq = daily_sq;
	}

	public int getScd_sq() {
		return scd_sq;
	}

	public void setScd_sq(int scd_sq) {
		this.scd_sq = scd_sq;
	}

	public int getDaily_ord() {
		return daily_ord;
	}

	public void setDaily_ord(int daily_ord) {
		this.daily_ord = daily_ord;
	}

	public String getDaily_ymd() {
		return daily_ymd;
	}

	public void setDaily_ymd(String daily_ymd) {
		this.daily_ymd = daily_ymd;
	}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	public String getSigungu_code() {
		return sigungu_code;
	}

	public void setSigungu_code(String sigungu_code) {
		this.sigungu_code = sigungu_code;
	}

	public int getCity_ord() {
		return city_ord;
	}

	public void setCity_ord(int city_ord) {
		this.city_ord = city_ord;
	}

	public String getCity_nm() {
		return city_nm;
	}

	public void setCity_nm(String city_nm) {
		this.city_nm = city_nm;
	}

	@Override
	public String toString() {
		return "Daily_Scd [daily_sq=" + daily_sq + ", scd_sq=" + scd_sq + ", daily_ord=" + daily_ord + ", daily_ymd="
				+ daily_ymd + ", area_code=" + area_code + ", sigungu_code=" + sigungu_code + ", city_ord=" + city_ord
				+ ", city_nm=" + city_nm + "]";
	}

	
}
