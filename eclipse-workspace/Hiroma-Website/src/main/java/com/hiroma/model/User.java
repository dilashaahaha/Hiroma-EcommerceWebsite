package com.hiroma.model;

/**
 * User model — maps exactly to the `user` table in hiroma_db.
 *
 * Columns: user_id, full_name, email, password_hash,
 *          phone, role, is_active, created_at
 */
public class User {

    private int     userId;
    private String  fullName;
    private String  email;
    private String  passwordHash;   // stored as password_hash in DB
    private String  phone;
    private String  role;           // "customer" or "admin"
    private boolean isActive;
    private String  createdAt;

    // ── Constructors ──────────────────────────────────────────────────────

    public User() {}

    public User(int userId, String fullName, String email,
                String passwordHash, String phone,
                String role, boolean isActive, String createdAt) {
        this.userId       = userId;
        this.fullName     = fullName;
        this.email        = email;
        this.passwordHash = passwordHash;
        this.phone        = phone;
        this.role         = role;
        this.isActive     = isActive;
        this.createdAt    = createdAt;
    }

    // ── Getters & Setters ─────────────────────────────────────────────────

    public int     getUserId()                  { return userId; }
    public void    setUserId(int userId)         { this.userId = userId; }

    public String  getFullName()                { return fullName; }
    public void    setFullName(String fullName)  { this.fullName = fullName; }

    public String  getEmail()                   { return email; }
    public void    setEmail(String email)        { this.email = email; }

    public String  getPasswordHash()            { return passwordHash; }
    public void    setPasswordHash(String p)     { this.passwordHash = p; }

    public String  getPhone()                   { return phone; }
    public void    setPhone(String phone)        { this.phone = phone; }

    public String  getRole()                    { return role; }
    public void    setRole(String role)          { this.role = role; }

    public boolean isActive()                   { return isActive; }
    public void    setActive(boolean isActive)   { this.isActive = isActive; }

    public String  getCreatedAt()               { return createdAt; }
    public void    setCreatedAt(String createdAt){ this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "User{userId=" + userId
             + ", fullName='" + fullName + "'"
             + ", email='"    + email    + "'"
             + ", role='"     + role     + "'"
             + ", isActive="  + isActive + "}";
    }
}
