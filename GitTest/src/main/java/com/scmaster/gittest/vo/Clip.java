package com.scmaster.gittest.vo;

import java.sql.Date;

public class Clip {

	private int CLIP_SQ;
	private String USER_ID;
	private String CONTENT_ID;
	private String CONTENT_TYPE_ID;
	private Date CLIP_YMD;
	public Clip() {
		super();
	}
	public Clip(int cLIP_SQ, String uSER_ID, String cONTENT_ID, String cONTENT_TYPE_ID, Date cLIP_YMD) {
		super();
		CLIP_SQ = cLIP_SQ;
		USER_ID = uSER_ID;
		CONTENT_ID = cONTENT_ID;
		CONTENT_TYPE_ID = cONTENT_TYPE_ID;
		CLIP_YMD = cLIP_YMD;
	}
	public int getCLIP_SQ() {
		return CLIP_SQ;
	}
	public void setCLIP_SQ(int cLIP_SQ) {
		CLIP_SQ = cLIP_SQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getCONTENT_ID() {
		return CONTENT_ID;
	}
	public void setCONTENT_ID(String cONTENT_ID) {
		CONTENT_ID = cONTENT_ID;
	}
	public String getCONTENT_TYPE_ID() {
		return CONTENT_TYPE_ID;
	}
	public void setCONTENT_TYPE_ID(String cONTENT_TYPE_ID) {
		CONTENT_TYPE_ID = cONTENT_TYPE_ID;
	}
	public Date getCLIP_YMD() {
		return CLIP_YMD;
	}
	public void setCLIP_YMD(Date cLIP_YMD) {
		CLIP_YMD = cLIP_YMD;
	}
	@Override
	public String toString() {
		return "Clip [CLIP_SQ=" + CLIP_SQ + ", USER_ID=" + USER_ID + ", CONTENT_ID=" + CONTENT_ID + ", CONTENT_TYPE_ID="
				+ CONTENT_TYPE_ID + ", CLIP_YMD=" + CLIP_YMD + "]";
	}


}
