package com.hiroma.model;

public class Brand {
    private int    id;
    private String name;
    private String location;
    private String province;
    private String ownerName;
    private String description;
    private String imageUrl;
    private String status;

    public Brand() {}

    public int    getId()          { return id; }
    public String getName()        { return name; }
    public String getLocation()    { return location; }
    public String getProvince()    { return province; }
    public String getOwnerName()   { return ownerName; }
    public String getDescription() { return description; }
    public String getImageUrl()    { return imageUrl; }
    public String getStatus()      { return status; }

    public void setId(int id)                { this.id = id; }
    public void setName(String name)         { this.name = name; }
    public void setLocation(String location) { this.location = location; }
    public void setProvince(String province) { this.province = province; }
    public void setOwnerName(String owner)   { this.ownerName = owner; }
    public void setDescription(String desc)  { this.description = desc; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public void setStatus(String status)     { this.status = status; }
}