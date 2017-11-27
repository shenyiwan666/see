package com.see.vo;

public class FindVO {
	
	private int id;
	
	private int offset;
	
	private int size;
	
	public FindVO() {	}

	public FindVO(int id,int offset, int size) {
		this.id=id;
		this.offset = offset;
		this.size = size;
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
