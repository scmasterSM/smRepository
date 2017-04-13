package com.scmaster.gittest.vo;

public class Budget {
	private int bgt_sq;
	private int scd_sq;
	private int daily_sq;
	private int dtl_sq;
	private String dtl_budget;
	private String dtl_memo;
	
	public Budget() {}

	public Budget(int bgt_sq, int scd_sq, int daily_sq, int dtl_sq, String dtl_budget, String dtl_memo) {
		super();
		this.bgt_sq = bgt_sq;
		this.scd_sq = scd_sq;
		this.daily_sq = daily_sq;
		this.dtl_sq = dtl_sq;
		this.dtl_budget = dtl_budget;
		this.dtl_memo = dtl_memo;
	}

	public int getBgt_sq() {
		return bgt_sq;
	}

	public void setBgt_sq(int bgt_sq) {
		this.bgt_sq = bgt_sq;
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

	public int getDtl_sq() {
		return dtl_sq;
	}

	public void setDtl_sq(int dtl_sq) {
		this.dtl_sq = dtl_sq;
	}

	public String getDtl_budget() {
		return dtl_budget;
	}

	public void setDtl_budget(String dtl_budget) {
		this.dtl_budget = dtl_budget;
	}

	public String getDtl_memo() {
		return dtl_memo;
	}

	public void setDtl_memo(String dtl_memo) {
		this.dtl_memo = dtl_memo;
	}

	@Override
	public String toString() {
		return "Budget [bgt_sq=" + bgt_sq + ", scd_sq=" + scd_sq + ", daily_sq=" + daily_sq + ", dtl_sq=" + dtl_sq
				+ ", dtl_budget=" + dtl_budget + ", dtl_memo=" + dtl_memo + "]";
	}
	
	
}
