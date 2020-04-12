package com.example.book.entity;

public class BookBean {
	private Long id;
	private String code;
	private String name;
	private String description;
	private String imageUrl;
	private String author;
	private String publisher;
	private Long amount;

	private Long categoryId;
	private String categoryName;
	private String nameCode;
	private Long amountBorrow;
	private Long isValid;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
    
    public String getNameCode() {
        return nameCode;
    }
    
    public void setNameCode(String nameCode) {
        this.nameCode = nameCode;
    }
    
    public Long getAmountBorrow() {
        return amountBorrow;
    }
    
    public void setAmountBorrow(Long amountBorrow) {
        this.amountBorrow = amountBorrow;
    }
    
    public Long getIsValid() {
        return isValid;
    }
    
    public void setIsValid(Long isValid) {
        this.isValid = isValid;
    }
	
}
