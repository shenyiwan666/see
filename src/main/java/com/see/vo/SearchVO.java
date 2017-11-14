package com.see.vo;

public class SearchVO {
	
	private String q;
	
	private int offset;
	
	private int size;
	
	

	public SearchVO() {	}

	public SearchVO(String q, int offset, int size) {
		this.q = q;
		this.offset = offset;
		this.size = size;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
	
	

}
