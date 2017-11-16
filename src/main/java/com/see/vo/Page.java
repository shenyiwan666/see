package com.see.vo;

import java.util.List;

public class Page {
	
	private int size = 5;
	private int cur = 1;
	private int offset;
	
	private int count;
	private int total;
	
	private List<?> list;
	

	public Page() {}

	public Page(int cur) {
		this.cur = cur;
		this.offset = (cur - 1) * size;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getCur() {
		return cur;
	}

	public void setCur(int cur) {
		this.cur = cur;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		this.total = (count / size) + ((count % size) > 0 ? 1 : 0);
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Page [size=" + size + ", cur=" + cur + ", offset=" + offset + ", count=" + count + ", total=" + total
				+ ", list=" + list + "]";
	}
	
	
}
