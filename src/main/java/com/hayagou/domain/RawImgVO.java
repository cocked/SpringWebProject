package com.hayagou.domain;

import java.util.Date;

public class RawImgVO{
	private String raw_image_path;
	private Date regdate;
	private int price;
	private boolean admin_accept;
	
	public String getRaw_image_path() {
		return raw_image_path;
	}

	public void setRaw_image_path(String raw_image_path) {
		this.raw_image_path = raw_image_path;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public boolean isAdmin_accept() {
		return admin_accept;
	}

	public void setAdmin_accept(boolean admin_accept) {
		this.admin_accept = admin_accept;
	}

	@Override
	public String toString() {
		return "MemberVO [raw_image_path=" + raw_image_path + ", price=" + price + ", regdate=" + regdate + ", admin_accept=" + admin_accept + "]";
	}
}
