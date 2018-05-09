package com.delicious.model;

public class Food {
	
	private int id;
	private String foodName;
	private int sellerId;
	private int foodKind;
	private int foodTaste;
	private int foodStyle;
	private String foodPicture;
	private double foodPrice;
	private String remark;
	private String updateTime;
	public Food(){}
	public Food(int sellerId,String foodName,int foodTaste, int foodKind, int foodStyle,
			String foodPicture, double foodPrice, String remark,
			String updateTime) {
		super();
		this.sellerId=sellerId;
		this.foodName = foodName;
		this.foodTaste=foodTaste;
		this.foodKind = foodKind;
		this.foodStyle = foodStyle;
		this.foodPicture = foodPicture;
		this.foodPrice = foodPrice;
		this.remark = remark;
		this.updateTime = updateTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodKind() {
		return foodKind;
	}
	public void setFoodKind(int foodKind) {
		this.foodKind = foodKind;
	}
	public int getFoodStyle() {
		return foodStyle;
	}
	public void setFoodStyle(int foodStyle) {
		this.foodStyle = foodStyle;
	}
	public String getFoodPicture() {
		return foodPicture;
	}
	public void setFoodPicture(String foodPicture) {
		this.foodPicture = foodPicture;
	}
	public double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getFoodTaste() {
		return foodTaste;
	}
	public void setFoodTaste(int foodTaste) {
		this.foodTaste = foodTaste;
	}


}
