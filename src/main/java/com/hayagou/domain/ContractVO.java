package com.hayagou.domain;

import java.util.Date;

public class ContractVO {
	   
    private int id_smartcontract;
    private String seller;
    private String buyer;
    private String url;
    private Date regdate;
    private String ethereum;
    
	public int getId_smartcontract() {
		return id_smartcontract;
	}
	public void setId_smartcontract(int id_smartcontract) {
		this.id_smartcontract = id_smartcontract;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getEthereum() {
		return ethereum;
	}
	public void setEthereum(String ethereum) {
		this.ethereum = ethereum;
	}
	
	@Override
	public String toString() {
		return "ContractVO [id_smartcontract=" + id_smartcontract + ", seller=" + seller + ", buyer=" + buyer + ", url="
				+ url + ", regdate=" + regdate + "]";
	}
}
