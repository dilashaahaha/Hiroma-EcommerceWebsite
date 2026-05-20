package com.hiroma.model;

import java.sql.Timestamp;

public class BrandModel {
    private int brandId;
    private String brandName;
    private String originDistrict;
    private String description;
    private String logoUrl;
    private int isApproved; // 0 = Pending, 1 = Approved, 2 = Rejected
    private int createdBy;
    private Timestamp createdAt;

    // Getters and Setters
    public int getBrandId() { return brandId; }
    public void setBrandId(int brandId) { this.brandId = brandId; }

    public String getBrandName() { return brandName; }
    public void setBrandName(String brandName) { this.brandName = brandName; }

    public String getOriginDistrict() { return originDistrict; }
    public void setOriginDistrict(String originDistrict) { this.originDistrict = originDistrict; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getLogoUrl() { return logoUrl; }
    public void setLogoUrl(String logoUrl) { this.logoUrl = logoUrl; }

    public int getIsApproved() { return isApproved; }
    public void setIsApproved(int isApproved) { this.isApproved = isApproved; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}