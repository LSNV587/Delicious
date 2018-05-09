package com.delicious.model;

public class Seller {
	private int sellerId;
	private String shopName;
	private String shopKepper;
	private String tel;
	private String logo;
	private int distance;
	private String slogan;
	private String updateTime;
	public Seller(){}  //默认构造函数
	
	public Seller(String shopName, String shopKepper, String tel, String logo,  //重载
			int distance, String slogan, String updateTime) {
		super();
		this.shopName = shopName;
		this.shopKepper = shopKepper;
		this.tel = tel;
		this.logo = logo;
		this.distance = distance;
		this.slogan = slogan;
		this.updateTime = updateTime;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopKepper() {
		return shopKepper;
	}
	public void setShopKepper(String shopKepper) {
		this.shopKepper = shopKepper;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getSlogan() {
		return slogan;
	}
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}
