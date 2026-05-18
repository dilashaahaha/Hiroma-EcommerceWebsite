<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroma Ecommerce Website - README</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #f5f5f5;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            line-height: 1.5;
            color: #1e2a2b;
            padding: 2rem 1rem;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border: 1px solid #e0e0e0;
            overflow: hidden;
        }
        .header {
            background: #2c5a48;
            padding: 1.8rem 2rem;
            color: white;
            border-bottom: 3px solid #c9a87b;
        }
        .header h1 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .header p {
            opacity: 0.9;
            font-size: 0.9rem;
        }
        .repo-link {
            margin-top: 1rem;
            font-family: monospace;
            font-size: 0.8rem;
            background: rgba(255,255,255,0.15);
            display: inline-block;
            padding: 0.3rem 1rem;
            border-radius: 30px;
        }
        .repo-link a {
            color: #ffdfb3;
            text-decoration: none;
        }
        .content {
            padding: 2rem;
        }
        h2 {
            font-size: 1.4rem;
            margin: 1.5rem 0 0.8rem 0;
            color: #2c5a48;
            border-left: 4px solid #c9a87b;
            padding-left: 0.8rem;
        }
        h2:first-of-type {
            margin-top: 0;
        }
        h3 {
            font-size: 1.1rem;
            margin: 1rem 0 0.5rem 0;
            color: #3d6b58;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
            font-size: 0.85rem;
        }
        th {
            background: #eef3ef;
            text-align: left;
            padding: 8px 12px;
            border-bottom: 1px solid #ddd;
        }
        td {
            padding: 8px 12px;
            border-bottom: 1px solid #eee;
        }
        code {
            background: #f0ede8;
            padding: 0.2rem 0.4rem;
            border-radius: 6px;
            font-family: monospace;
            font-size: 0.8rem;
        }
        pre {
            background: #1e2a2b;
            color: #e2dccd;
            padding: 1rem;
            border-radius: 12px;
            overflow-x: auto;
            font-size: 0.75rem;
            margin: 1rem 0;
        }
        .feature-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 0.8rem;
            margin: 1rem 0;
        }
        .feature-item {
            background: #faf8f4;
            padding: 0.6rem 1rem;
            border-radius: 12px;
            border: 1px solid #e8e0d4;
            font-size: 0.85rem;
        }
        .badge {
            background: #e8e2d6;
            color: #2c5a48;
            padding: 0.2rem 0.7rem;
            border-radius: 20px;
            font-size: 0.7rem;
            display: inline-block;
            margin-right: 6px;
            margin-bottom: 6px;
        }
        .note {
            background: #f3efe8;
            padding: 0.8rem 1.2rem;
            border-radius: 16px;
            margin: 1rem 0;
            font-size: 0.85rem;
            border-left: 3px solid #c9a87b;
        }
        hr {
            margin: 1.5rem 0;
            border: none;
            height: 1px;
            background: #e0d6ca;
        }
        .footer {
            background: #faf7f2;
            padding: 1.2rem 2rem;
            text-align: center;
            font-size: 0.75rem;
            color: #6b7b6e;
            border-top: 1px solid #e0d6ca;
        }
        @media (max-width: 600px) {
            .content {
                padding: 1.2rem;
            }
            .header h1 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Hiroma Organic Tea E-commerce Platform</h1>
        <p>CS5054NI - Advanced Programming and Technologies | Spring Semester 2026</p>
        <div class="repo-link">
            GitHub: <a href="https://github.com/your-group/Hiroma-EcommerceWebsite" target="_blank">https://github.com/your-group/Hiroma-EcommerceWebsite</a>
        </div>
    </div>

    <div class="content">
        <!-- Introduction -->
        <h2>1. Project Overview</h2>
        <p><strong>Title:</strong> Hiroma Organic Tea Marketplace</p>
        <p><strong>Purpose:</strong> A web-based e-commerce platform where Nepali tea brands can sell organic teas, and users can log in as either a seller or a buyer. The system provides role-based access, product management, ordering, and administrative controls.</p>
        <p><strong>Audience:</strong> Tea sellers (brands/farmers) and tea buyers (individuals or wholesalers).</p>
        
        <h3>Aims and Objectives</h3>
        <ul>
            <li>Implement secure authentication and role-based authorization (Buyer / Seller / Admin).</li>
            <li>Provide full CRUD operations for products via seller dashboard.</li>
            <li>Enable buyers to browse, search, add to cart, place orders, and manage wishlists.</li>
            <li>Follow MVC architecture using JSP, Servlets, and MySQL.</li>
            <li>Ensure responsive frontend with pure CSS (no frameworks).</li>
        </ul>

        <h3>Key Features</h3>
        <div class="feature-list">
            <div class="feature-item"><strong>Authentication</strong> - Login/register with role selection (buyer/seller).</div>
            <div class="feature-item"><strong>Seller Dashboard</strong> - Add, edit, delete, view tea products.</div>
            <div class="feature-item"><strong>Buyer Portal</strong> - Browse teas, search, add to cart, checkout.</div>
            <div class="feature-item"><strong>Admin Dashboard</strong> - Approve seller registrations, generate sales reports.</div>
            <div class="feature-item"><strong>Wishlist & Apply</strong> - Buyers can wishlist items and request restock alerts.</div>
            <div class="feature-item"><strong>Search Feature</strong> - Search teas by name, origin, or category.</div>
            <div class="feature-item"><strong>Order History</strong> - Track orders, view issued items and due dates.</div>
            <div class="feature-item"><strong>Validation & Error Handling</strong> - Unique email/product codes, custom error pages.</div>
        </div>
        <hr>

        <!-- Wireframes -->
        <h2>2. Wireframes</h2>
        <p>The application includes the following major screens: Login/Registration page, Buyer Home (product catalog), Seller Dashboard (product management), Cart & Checkout, Admin Panel (user approvals & reports). All layouts follow responsive design using CSS media queries and flexbox.</p>
        <div class="note">
            <strong>Wireframe references:</strong> Full wireframe designs (login, dashboard, product listing, order summary) are documented in the coursework report (PDF) with prototype sketches and final UI screenshots.
        </div>
        <hr>

        <!-- Java Classes -->
        <h2>3. Java Classes (MVC Architecture)</h2>
        <p>The system follows Model-View-Controller pattern with clear separation of concerns.</p>
        <pre>
Class Diagram (simplified):

+----------------+      +------------------+      +----------------+
|     User       |      |   TeaProduct     |      |     Order      |
+----------------+      +------------------+      +----------------+
| userId         |      | productId        |      | orderId        |
| fullName       |&lt;----&gt;| sellerId (FK)    |      | buyerId (FK)   |
| email (unique) |      | teaName          |      | orderDate      |
| role           |      | origin, price    |      | totalAmount    |
| passwordHash   |      | stock, category  |      | status         |
+----------------+      +------------------+      +----------------+
        |                         |                         |
        v                         v                         v
+----------------+      +------------------+      +----------------+
|  UserService   |      | ProductService   |      |  OrderService  |
+----------------+      +------------------+      +----------------+
        |                         |                         |
        +-------------------------+-------------------------+
                                  v
                    +-----------------------------+
                    |   DAO Layer / DBUtils       |
                    |   (MySQL, JDBC)             |
                    +-----------------------------+
        </pre>

        <h3>Key Classes and Methods</h3>
        <table>
            <thead><tr><th>Class</th><th>Key Methods</th><th>Responsibility</th></tr></thead>
            <tbody>
                <tr><td><code>LoginController</code></td><td>doPost(), authenticateUser()</td><td>Validates credentials, starts session, redirects based on role.</td></tr>
                <tr><td><code>ProductController</code></td><td>addProduct(), updateProduct(), deleteProduct(), searchProducts()</td><td>Manages all product CRUD operations for sellers.</td></tr>
                <tr><td><code>CartController</code></td><td>addToCart(), removeItem(), checkout()</td><td>Handles shopping cart and order placement.</td></tr>
                <tr><td><code>AdminController</code></td><td>approveSeller(), generateReport(), manageCategories()</td><td>Admin functions: user approvals and analytics.</td></tr>
                <tr><td><code>DBConnection</code></td><td>getConnection(), closeResources()</td><td>JDBC connection pooling and exception handling.</td></tr>
            </tbody>
        </table>
        <hr>

        <!-- Test Cases -->
        <h2>4. Test Cases</h2>
        <p>Comprehensive testing was performed to ensure functionality and robustness.</p>
        <table>
            <thead><tr><th>Test ID</th><th>Feature</th><th>Expected Result</th><th>Status</th></tr></thead>
            <tbody>
                <tr><td>TC-01</td><td>Register with existing email</td><td>Error message: "Email already registered"</td><td>Pass</td></tr>
                <tr><td>TC-02</td><td>Seller login redirect</td><td>Redirects to seller dashboard</td><td>Pass</td></tr>
                <tr><td>TC-03</td><td>Add new product (seller)</td><td>Product appears in inventory list</td><td>Pass</td></tr>
                <tr><td>TC-04</td><td>Buyer add to cart and order</td><td>Order created, stock decreases</td><td>Pass</td></tr>
                <tr><td>TC-05</td><td>Wishlist apply feature</td><td>Restock request saved in database</td><td>Pass</td></tr>
                <tr><td>TC-06</td><td>Unauthorized URL access</td><td>Redirected to login or access denied page</td><td>Pass</td></tr>
                <tr><td>TC-07</td><td>Admin approves seller</td><td>User role changes to SELLER, login enabled</td><td>Pass</td></tr>
            </tbody>
        </table>
        <div class="note">All validation cases (empty fields, invalid data types, duplicate entries) display appropriate error messages. Custom error pages (404, 500) are implemented.</div>
        <hr>

        <!-- Development Process and Tools -->
        <h2>5. Development Process and Tools</h2>
        <p><strong>Tools Used:</strong></p>
        <div>
            <span class="badge">Eclipse IDE (Java EE)</span>
            <span class="badge">MySQL 8.0</span>
            <span class="badge">Apache Tomcat 10</span>
            <span class="badge">XAMPP / phpMyAdmin</span>
            <span class="badge">Git & GitHub</span>
            <span class="badge">Draw.io (ER Diagram)</span>
            <span class="badge">Maven</span>
        </div>

        <h3>Database Design</h3>
        <p>The database includes normalized tables: <code>users</code>, <code>products</code>, <code>categories</code>, <code>cart_items</code>, <code>orders</code>, <code>order_items</code>, <code>wishlist</code>. Foreign keys enforce integrity, and indexes are applied on frequently searched columns (email, product name).</p>
        <p><strong>ER Diagram:</strong> Created using MySQL Workbench and Draw.io, showing relationships between users (buyer/seller), products, orders, and wishlist. Full ER diagram available in the coursework report.</p>
        <p><strong>Evidence:</strong> SQL schema scripts, phpMyAdmin screenshots, and Git commit history are included in the final PDF report.</p>

        <h3>Critical Analysis</h3>
        <ul>
            <li><strong>Challenge:</strong> Session management for dual roles (buyer/seller). <strong>Solution:</strong> Implemented custom filter to check user role before granting access to protected URLs.</li>
            <li><strong>Challenge:</strong> Ensuring stock consistency during concurrent orders. <strong>Solution:</strong> Used synchronized database transactions with proper isolation levels.</li>
            <li><strong>Evaluation:</strong> The system performs efficiently, loads product lists quickly, and provides a smooth user experience on both desktop and mobile. All mandatory coursework requirements are met including MVC, role-based access, responsive CSS, CRUD operations, and exception handling.</li>
        </ul>
        <hr>

        <!-- Conclusion -->
        <h2>6. Conclusion</h2>
        <p>Hiroma Organic Tea E-commerce Platform successfully delivers a complete web application built with Java, JSP, Servlets, and MySQL. The project fulfills all coursework specifications: authentication, authorization, admin dashboard, user portal, CRUD operations, search, wishlist with apply feature, and responsive frontend without external frameworks.</p>
        <p><strong>Lessons learned:</strong> Importance of early milestone submissions (wireframes, DB schema, login module) to streamline final integration. Team collaboration using Git branches and regular code reviews ensured stability.</p>
        <p><strong>Future improvements:</strong> Payment gateway integration, email notifications for order status, and a recommendation engine based on purchase history.</p>
        <div class="note">
            <strong>Milestone 1 (May 4, 2026):</strong> Wireframes, database normalization, ERD, user registration/login with encryption, session filters, partial admin CRUD.<br>
            <strong>Final Submission (May 21, 2026):</strong> Full features, report (PDF), public GitHub repository with source code and SQL schema.
        </div>
        <hr>

        <!-- References -->
        <h2>7. References</h2>
        <ul>
            <li>Oracle. (2024). Java EE 8 Documentation - Servlets, JSP, JDBC.</li>
            <li>MySQL Documentation. (2025). InnoDB Transaction Handling.</li>
            <li>Lama, R. (2026). CS5054NI Coursework Brief. London Metropolitan University.</li>
            <li>Freeman, E. (2021). Head First Design Patterns. O'Reilly.</li>
            <li>MDN Web Docs. (2025). CSS Flexbox and Grid Layout.</li>
        </ul>
        <hr>

        <!-- Technology Compliance -->
        <div class="note" style="text-align: center;">
            <strong>Technology Compliance:</strong> Java 17 | Java EE (Servlets + JSP) | MySQL | JDBC | Tomcat 10 | Pure CSS (media queries, flexbox) | No Bootstrap frameworks used. Validation, exception handling, and role-based filters fully implemented.
        </div>
        <p style="font-size: 0.8rem; text-align: center; margin-top: 1rem;">Full report (16,000 words) submitted via MST portal includes detailed class diagrams, test logs, screenshots, and ER diagrams.</p>
    </div>

    <div class="footer">
        CS5054NI Group Coursework | Contributors: dilash, diby | London Metropolitan University & Islington College<br>
        Public GitHub repository with full source code and SQL schema.
    </div>
</div>
</body>
</html>
