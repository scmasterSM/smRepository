package com.scmaster.gittest.vo;

public class Liked {
	
	private int LIKED_SQ; 
	private String USER_ID;
	private int SCD_SQ;
	public Liked() { 
	}
	public Liked(int lIKED_SQ, String uSER_ID, int sCD_SQ) {
		super();
		LIKED_SQ = lIKED_SQ;
		USER_ID = uSER_ID;
		SCD_SQ = sCD_SQ;
	}
	public int getLIKED_SQ() {
		return LIKED_SQ;
	}
	public void setLIKED_SQ(int lIKED_SQ) {
		LIKED_SQ = lIKED_SQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getSCD_SQ() {
		return SCD_SQ;
	}
	public void setSCD_SQ(int sCD_SQ) {
		SCD_SQ = sCD_SQ;
	}
	@Override
	public String toString() {
		return "Liked [LIKED_SQ=" + LIKED_SQ + ", USER_ID=" + USER_ID + ", SCD_SQ=" + SCD_SQ + "]";
	}
	
	
}
