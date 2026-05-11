package com.hiroma.model;

public class Category {
    private int    id;
    private String name;
    private String slug;
    private String description;
    private String imageUrl;
    private int    productCount;

    public Category() {}

    public int    getId()           { return id; }
    public String getName()         { return name; }
    public String getSlug()         { return slug; }
    public String getDescription()  { return description; }
    public String getImageUrl()     { return imageUrl; }
    public int    getProductCount() { return productCount; }

    public void setId(int id)                     { this.id = id; }
    public void setName(String name)              { this.name = name; }
    public void setSlug(String slug)              { this.slug = slug; }
    public void setDescription(String desc)       { this.description = desc; }
    public void setImageUrl(String imageUrl)      { this.imageUrl = imageUrl; }
    public void setProductCount(int productCount) { this.productCount = productCount; }
}