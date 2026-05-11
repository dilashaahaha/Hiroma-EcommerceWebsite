package com.hiroma.model;

public class User {

    private int    id;
    private String fullName;
    private String email;
    private String phone;
    private String role;     
    private String status;  
    private String joinedDate;
    private int    orderCount;
    private String password;

    public User() {}

    public User(int id, String fullName, String email, String phone,
                String role, String status, String joinedDate,
                int orderCount, String password) {
        this.id         = id;
        this.fullName   = fullName;
        this.email      = email;
        this.phone      = phone;
        this.role       = role;
        this.status     = status;
        this.joinedDate = joinedDate;
        this.orderCount = orderCount;
        this.password   = password;
    }

    public int    getId()         { return id; }
    public String getFullName()   { return fullName; }
    public String getEmail()      { return email; }
    public String getPhone()      { return phone; }
    public String getRole()       { return role; }
    public String getStatus()     { return status; }
    public String getJoinedDate() { return joinedDate; }
    public int    getOrderCount() { return orderCount; }
    public String getPassword()   { return password; }

    public void setId(int id)                   { this.id = id; }
    public void setFullName(String fullName)     { this.fullName = fullName; }
    public void setEmail(String email)           { this.email = email; }
    public void setPhone(String phone)           { this.phone = phone; }
    public void setRole(String role)             { this.role = role; }
    public void setStatus(String status)         { this.status = status; }
    public void setJoinedDate(String joinedDate) { this.joinedDate = joinedDate; }
    public void setOrderCount(int orderCount)    { this.orderCount = orderCount; }
    public void setPassword(String password)     { this.password = password; }
}
