package com.hiroma.model;

public class Product {
    private int productId;
    private int brandId;
    private int categoryId;
    private String name;
    private String description;
    private double price;
    private int stock;
    private String weight;
    private String imageFile;
    private String origin;
    private String brand;
    private String category;
    private int isAvailable;

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getBrandId() { return brandId; }
    public void setBrandId(int brandId) { this.brandId = brandId; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public String getWeight() { return weight; }
    public void setWeight(String weight) { this.weight = weight; }

    public String getImageFile() { return imageFile; }
    public void setImageFile(String imageFile) { this.imageFile = imageFile; }

    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public int getIsAvailable() { return isAvailable; }
    public void setIsAvailable(int isAvailable) { this.isAvailable = isAvailable; }
}