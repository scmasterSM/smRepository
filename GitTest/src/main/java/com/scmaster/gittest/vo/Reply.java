package com.scmaster.gittest.vo;

import java.sql.Date;

public class Reply {

	private int REPLY_SQ;
	private int SCD_SQ;
	private String USER_ID;
	private String REPLY_TXT;
	private Date INP_YMD;
	private Date UPD_YMD;

	public Reply() {

	}

	public Reply(int rEPLY_SQ, int sCD_SQ, String uSER_ID, String rEPLY_TXT, Date iNP_YMD, Date uPD_YMD) {
		super();
		REPLY_SQ = rEPLY_SQ;
		SCD_SQ = sCD_SQ;
		USER_ID = uSER_ID;
		REPLY_TXT = rEPLY_TXT;
		INP_YMD = iNP_YMD;
		UPD_YMD = uPD_YMD;
	}

	public int getREPLY_SQ() {
		return REPLY_SQ;
	}

	public void setREPLY_SQ(int rEPLY_SQ) {
		REPLY_SQ = rEPLY_SQ;
	}

	public int getSCD_SQ() {
		return SCD_SQ;
	}

	public void setSCD_SQ(int sCD_SQ) {
		SCD_SQ = sCD_SQ;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getREPLY_TXT() {
		return REPLY_TXT;
	}

	public void setREPLY_TXT(String rEPLY_TXT) {
		REPLY_TXT = rEPLY_TXT;
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
		return "Reply [REPLY_SQ=" + REPLY_SQ + ", SCD_SQ=" + SCD_SQ + ", USER_ID=" + USER_ID + ", REPLY_TXT="
				+ REPLY_TXT + ", INP_YMD=" + INP_YMD + ", UPD_YMD=" + UPD_YMD + "]";
	}

}
