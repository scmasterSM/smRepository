package com.scmaster.gittest.vo;

public class Dtl_Scd {
	private int dtl_sq;
	private int scd_sq;
	private int daily_sq;
	private int dtl_ord;
	private String dtl_content_id;
	private String memo;
	private String place_nm;
	private String dtl_image;
	
	public Dtl_Scd(){}

	public Dtl_Scd(int dtl_sq, int scd_sq, int daily_sq, int dtl_ord, String dtl_content_id, String memo,
			String place_nm, String dtl_image) {
		super();
		this.dtl_sq = dtl_sq;
		this.scd_sq = scd_sq;
		this.daily_sq = daily_sq;
		this.dtl_ord = dtl_ord;
		this.dtl_content_id = dtl_content_id;
		this.memo = memo;
		this.place_nm = place_nm;
		this.dtl_image = dtl_image;
	}

	public int getDtl_sq() {
		return dtl_sq;
	}

	public void setDtl_sq(int dtl_sq) {
		this.dtl_sq = dtl_sq;
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

	public int getDtl_ord() {
		return dtl_ord;
	}

	public void setDtl_ord(int dtl_ord) {
		this.dtl_ord = dtl_ord;
	}

	public String getDtl_content_id() {
		return dtl_content_id;
	}

	public void setDtl_content_id(String dtl_content_id) {
		this.dtl_content_id = dtl_content_id;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPlace_nm() {
		return place_nm;
	}

	public void setPlace_nm(String place_nm) {
		this.place_nm = place_nm;
	}

	public String getDtl_image() {
		return dtl_image;
	}

	public void setDtl_image(String dtl_image) {
		this.dtl_image = dtl_image;
	}

	@Override
	public String toString() {
		return "Dtl_Scd [dtl_sq=" + dtl_sq + ", scd_sq=" + scd_sq + ", daily_sq=" + daily_sq + ", dtl_ord=" + dtl_ord
				+ ", dtl_content_id=" + dtl_content_id + ", memo=" + memo + ", city_nm=" + place_nm + ", dtl_image=" + dtl_image
				+ "]";
	}
	
}