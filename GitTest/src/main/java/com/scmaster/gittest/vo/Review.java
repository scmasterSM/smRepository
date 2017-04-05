package com.scmaster.gittest.vo;

import java.sql.Date;

public class Review {
	
	private int REV_SQ;
	private String USER_ID;
	private String PLACE_NM;
	private String REV_TXT;
	private Date INP_YMD;
	private Date UPD_YMD;
	public Review() {
		
	}
	public Review(int rEV_SQ, String uSER_ID, String pLACE_NM, String rEV_TXT, Date iNP_YMD, Date uPD_YMD) {
		super();
		REV_SQ = rEV_SQ;
		USER_ID = uSER_ID;
		PLACE_NM = pLACE_NM;
		REV_TXT = rEV_TXT;
		INP_YMD = iNP_YMD;
		UPD_YMD = uPD_YMD;
	}
	public int getREV_SQ() {
		return REV_SQ;
	}
	public void setREV_SQ(int rEV_SQ) {
		REV_SQ = rEV_SQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPLACE_NM() {
		return PLACE_NM;
	}
	public void setPLACE_NM(String pLACE_NM) {
		PLACE_NM = pLACE_NM;
	}
	public String getREV_TXT() {
		return REV_TXT;
	}
	public void setREV_TXT(String rEV_TXT) {
		REV_TXT = rEV_TXT;
	}
	public Date getINP_YMD() {
		return INP_YMD;
	}
	public void setINP_YMD(Date iNP_YMD) {
		INP_YMD = iNP_YMD;
	}
	public Date getUPD_YMD() {
		return UPD_YMD;
	}
	public void setUPD_YMD(Date uPD_YMD) {
		UPD_YMD = uPD_YMD;
	}
	@Override
	public String toString() {
		return "review [REV_SQ=" + REV_SQ + ", USER_ID=" + USER_ID + ", PLACE_NM=" + PLACE_NM + ", REV_TXT=" + REV_TXT
				+ ", INP_YMD=" + INP_YMD + ", UPD_YMD=" + UPD_YMD + "]";
	}
	
	
	
	
}
