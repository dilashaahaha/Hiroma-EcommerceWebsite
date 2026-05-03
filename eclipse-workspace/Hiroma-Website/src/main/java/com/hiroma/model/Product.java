package com.hiroma.model;

public class Product {

    private int    id;
    private String productName;
    private String description;
    private int    categoryId;
    private int    brandId;
    private double price;
    private String weightGrams;
    private int    stockQuantity;
    private int    lowStockAlert;
    private String imageUrl;
    private String status;   
    private String categoryName;
    private String brandName;


    public Product() {}

    public Product(int id, String productName, String description,
                   int categoryId, int brandId, double price,
                   String weightGrams, int stockQuantity,
                   int lowStockAlert, String imageUrl, String status, String categoryName, String brandName ) {
        this.id            = id;
        this.productName   = productName;
        this.description   = description;
        this.categoryId    = categoryId;
        this.brandId       = brandId;
        this.price         = price;
        this.weightGrams   = weightGrams;
        this.stockQuantity = stockQuantity;
        this.lowStockAlert = lowStockAlert;
        this.imageUrl      = imageUrl;
        this.status        = status;
        this.categoryName = categoryName;
        this.brandName = brandName;
    }

    public int    getId() { return id; }
    public String getProductName() { return productName; }
    public String getDescription() { return description; }
    public int    getCategoryId() { return categoryId; }
    public int    getBrandId() { return brandId; }
    public double getPrice() { return price; }
    public String getWeightGrams() { return weightGrams; }
    public int    getStockQuantity(){ return stockQuantity; }
    public int    getLowStockAlert(){ return lowStockAlert; }
    public String getImageUrl(){ return imageUrl; }
    public String getStatus() { return status; }
    public String getCategoryName(){return categoryName;}
    public String getBrandNmae(){return brandName;}

    public void setId(int id) { this.id = id; }
    public void setProductName(String productName) { this.productName = productName; }
    public void setDescription(String description) { this.description = description; }
    public void setCategoryId(int categoryId)      { this.categoryId = categoryId; }
    public void setBrandId(int brandId)            { this.brandId = brandId; }
    public void setPrice(double price)             { this.price = price; }
    public void setWeightGrams(String weightGrams) { this.weightGrams = weightGrams; }
    public void setStockQuantity(int stockQuantity){ this.stockQuantity = stockQuantity; }
    public void setLowStockAlert(int lowStockAlert){ this.lowStockAlert = lowStockAlert; }
    public void setImageUrl(String imageUrl)       { this.imageUrl = imageUrl; }
    public void setStatus(String status)           { this.status = status; }
    public void setCategoryName(String categoryName) {this.categoryName = categoryName; }
    public void setBrandName(String brandName) {this.brandName =brandName;}
    } 
    
