package com.hayagou.domain;

public class UserVO {
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_hashcode;
	private int user_avaliable;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_hashcode() {
		return user_hashcode;
	}
	public void setUser_hashcode(String user_hashcode) {
		this.user_hashcode = user_hashcode;
	}

	public int getUser_avaliable() {
		return user_avaliable;
	}
	public void setUser_avaliable(int user_avaliable) {
		this.user_avaliable = user_avaliable;
	}
	
	@Override
	public String toString() {
		return "MemberVO [user_email=" + user_email + ", user_password=" + user_password + ", user_name=" + user_name + ", user_hashcode=" + user_hashcode + "]";
	}
}
