# Hiroma - Himalayan Aroma

**Organic Tea E-Commerce Platform | CS5054NI Advanced Programming and Technologies**

Hiroma is a full-stack Java web application developed as a group coursework project for CS5054NI at Islington College (affiliated with London Metropolitan University). The platform serves as a multi-vendor e-commerce marketplace exclusively for authentic and organic tea brands from Nepal, with a focus on teas sourced from the Ilam and Taplejung regions.

---

## Project Information

| Detail | Information |
|--------|-------------|
| Module | CS5054NI Advanced Programming and Technologies |
| Institution | Islington College, Kathmandu (London Metropolitan University) |
| Academic Year | 2025 / 2026 |
| Project Type | Group Coursework |
| Submission | Final Submission — May 2026 |

---

## Group Members

| Name | Student ID | Role |
|------|------------|------|
| Dilasha Vaidya | 24046749 | Team Leader — Database, DAO, Authentication, GitHub, UI/UX |
| Dibyani Basnet |24046744  | User-facing Pages, Login , Reviews, UI/UX |
| Prashansa Magar | 24046812 | Session, Cokie Cart, Orders, UI/UX |
| Brishika Thapa Magar | 24046737 | Admin CRUD — Products, Categories, UI/UX|
| Shraddha Moktan | 24046953|  Wireframes, Report |

---

## Technology Stack

| Layer | Technology |
|-------|------------|
| Frontend | JSP, CSS (Flexbox), JSTL, Expression Language |
| Backend | Java EE, Servlets, MVC Architecture |
| Database | MySQL (via XAMPP / phpMyAdmin) |
| Server | Apache Tomcat 10.1 |
| IDE | Eclipse IDE for Enterprise Java |
| Build Tool | Apache Maven |
| Version Control | Git and GitHub |
| Design Tool | Figma |

---

## Project Structure

```
Hiroma-Website/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/hiroma/
│       │       ├── controller/
│       │       │   ├── admin/          Admin servlets (Dashboard, Product, Brand, Category, User)
│       │       │   ├── auth/           Authentication servlets (Login, Register, Logout)
│       │       │   ├── cart/           Cart and Checkout servlets
│       │       │   ├── order/          Order servlet
│       │       │   ├── product/        Product and Review servlets
│       │       │   └── user/           Profile servlet
│       │       ├── dao/                Data Access Objects (UserDAO, ProductDAO, CartDAO, etc.)
│       │       ├── filter/             AuthFilter for session protection
│       │       ├── model/              Java model classes (User, Product, Cart, Order, etc.)
│       │       ├── service/            UserService (business logic)
│       │       └── util/               Utility classes (DBConfig, PasswordUtil, SessionUtil, etc.)
│       └── webapp/
│           ├── admin/                  Admin JSP pages
│           ├── css/                    All CSS stylesheets
│           ├── layout/                 Shared header and footer JSP
│           └── user/                   User-facing JSP pages
├── pom.xml
└── README.md
```

---

## Features

**User Panel**
- User registration and login with password hashing
- Session management and Remember Me cookie
- Product browsing with category and brand filters
- Product search by name
- Product detail page with reviews
- Add to cart and manage cart items
- Checkout with delivery address and payment method selection
- Order history
- User profile management
- Write and view product reviews

**Admin Panel**
- Secure admin dashboard with real-time statistics
- Product management — Create, Read, Update, Delete
- Category management — Add, edit, delete tea categories
- Brand management — Approve and reject brand registrations
- User management — View and manage all registered users

---

## Database

The application uses a MySQL relational database called `hiroma_db` with 10 tables designed in 3rd Normal Form (3NF).

**Tables:** `user`, `address`, `brand`, `category`, `product`, `cart`, `cart_item`, `order`, `order_item`, `review`

The SQL schema file is included in this repository and can be imported directly into phpMyAdmin.

---

## How to Run Locally

**Prerequisites**
- Java JDK 21
- Apache Tomcat 10.1
- XAMPP (for MySQL and phpMyAdmin)
- Eclipse IDE for Enterprise Java and Web Developers
- Maven

**Steps**

1. Clone this repository:
```
git clone https://github.com/dilashaahaha/Hiroma-EcommerceWebsite.git
```

2. Open XAMPP Control Panel and start Apache and MySQL.

3. Open phpMyAdmin at `http://localhost/phpmyadmin` and create a database called `hiroma_db`.

4. Import the SQL schema file from the repository into `hiroma_db`.

5. Open Eclipse and import the project:
   - File > Import > Existing Maven Projects > Browse to the cloned folder > Finish

6. Right-click the project > Maven > Update Project > OK

7. Right-click the project > Run As > Run on Server > Select Apache Tomcat 10.1

8. Open your browser and go to:
```
http://localhost:9090/Hiroma-Website/
```

---

## Default Access

| Role | URL | Credentials |
|------|-----|-------------|
| Customer | /login | Register a new account |
| Admin | /login | Set up an admin account directly in phpMyAdmin by setting role to 'admin' |

---

## Pages

| Page | URL Path |
|------|----------|
| Home | /user/home.jsp |
| Register | /register |
| Login | /login |
| Product Listing | /products |
| Product Detail | /product-details?id={id} |
| Cart | /cart |
| Checkout | /checkout |
| Orders | /orders |
| Profile | /profile |
| Review | /review |
| About Us | /user/about.jsp |
| Contact | /user/contact.jsp |
| Admin Dashboard | /admin/dashboard.jsp |

---

## Architecture

The application follows the MVC (Model-View-Controller) design pattern:

- **Model** — Java classes representing database entities (User, Product, Cart, Order, Brand, Category, Review)
- **View** — JSP pages with JSTL and Expression Language for dynamic content rendering
- **Controller** — Java Servlets handling HTTP requests, processing business logic, and delegating to DAO layer
- **DAO Layer** — Data Access Objects handling all database queries using JDBC and PreparedStatements
- **Filter** — AuthFilter intercepts requests to protected pages and redirects unauthenticated users to login

---

## Security

- Passwords are hashed using SHA-256 before being stored in the database
- Session management prevents unauthorized access to protected pages
- AuthFilter protects all admin and user-specific routes
- PreparedStatements are used throughout to prevent SQL injection

---

## Acknowledgements

Module Leader: Ms. Rabina Lama
Tutor: Mr. Nishan Poudel
Institution: Islington College, Kathmandu, Nepal
