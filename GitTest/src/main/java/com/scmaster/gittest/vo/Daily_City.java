package com.scmaster.gittest.vo;

public class Daily_City {
	private int dcl_sq;
	private int scd_sq;
	private int daily_sq;
	private int city_ord;
	private String area_code;
	private String sigungu_code;
	
	public Daily_City(){}
	
	public Daily_City(int dcl_sq, int scd_sq, int daily_sq, int city_ord, String area_code, String sigungu_code) {
		super();
		this.dcl_sq = dcl_sq;
		this.scd_sq = scd_sq;
		this.daily_sq = daily_sq;
		this.city_ord = city_ord;
		this.area_code = area_code;
		this.sigungu_code = sigungu_code;
	}

	public int getDcl_sq() {
		return dcl_sq;
	}

	public void setDcl_sq(int dcl_sq) {
		this.dcl_sq = dcl_sq;
	}

	public int getScd_sq() {
		return scd_sq;
	}

	public void setScd_sq(int scd_sq) {
		this.scd_sq = scd_sq;
	}

	public int getDaily_sq() {
		return daily_sq;
	}

	public void setDaily_sq(int daily_sq) {
		this.daily_sq = daily_sq;
	}

	public int getCity_ord() {
		return city_ord;
	}

	public void setCity_ord(int city_ord) {
		this.city_ord = city_ord;
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

	@Override
	public String toString() {
		return "Daily_City [dcl_sq=" + dcl_sq + ", scd_sq=" + scd_sq + ", daily_sq=" + daily_sq + ", city_ord="
				+ city_ord + ", area_code=" + area_code + ", sigungu_code=" + sigungu_code + "]";
	}
	
	
}
