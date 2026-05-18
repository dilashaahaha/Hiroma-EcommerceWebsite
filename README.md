<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroma Organic Tea E-commerce Platform - README</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #f7f7f7;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            padding: 2rem 1rem;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            border: 1px solid #e0e0e0;
            overflow: hidden;
        }
        .header {
            background: #2d6a4f;
            padding: 2rem;
            color: white;
        }
        .header h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .header .subtitle {
            font-size: 1rem;
            opacity: 0.9;
            margin-bottom: 1rem;
        }
        .header .repo {
            background: rgba(255,255,255,0.2);
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 30px;
            font-family: monospace;
            font-size: 0.85rem;
        }
        .header .repo a {
            color: white;
            text-decoration: none;
        }
        .content {
            padding: 2rem;
        }
        h2 {
            font-size: 1.5rem;
            margin: 1.5rem 0 1rem 0;
            color: #2d6a4f;
            border-left: 4px solid #d4a373;
            padding-left: 0.8rem;
        }
        h2:first-of-type {
            margin-top: 0;
        }
        h3 {
            font-size: 1.2rem;
            margin: 1rem 0 0.5rem 0;
            color: #40916c;
        }
        p {
            margin-bottom: 0.8rem;
        }
        ul, ol {
            margin: 0.8rem 0 0.8rem 1.8rem;
        }
        li {
            margin: 0.3rem 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
            font-size: 0.9rem;
        }
        th {
            background: #e9f5ef;
            text-align: left;
            padding: 10px 12px;
            border-bottom: 2px solid #cfe3d9;
        }
        td {
            padding: 8px 12px;
            border-bottom: 1px solid #e0e0e0;
        }
        code {
            background: #f4f4f4;
            padding: 0.2rem 0.4rem;
            border-radius: 5px;
            font-family: 'Courier New', monospace;
            font-size: 0.85rem;
        }
        pre {
            background: #1e2a2b;
            color: #e2dccd;
            padding: 1rem;
            border-radius: 10px;
            overflow-x: auto;
            font-size: 0.8rem;
            margin: 1rem 0;
        }
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1rem;
            margin: 1rem 0;
        }
        .feature-card {
            background: #fefaf5;
            padding: 0.8rem 1rem;
            border-radius: 10px;
            border: 1px solid #e8e0d4;
        }
        .feature-card strong {
            color: #2d6a4f;
        }
        .tech-badge {
            background: #e9f5ef;
            color: #2d6a4f;
            padding: 0.2rem 0.7rem;
            border-radius: 20px;
            font-size: 0.75rem;
            display: inline-block;
            margin-right: 6px;
            margin-bottom: 6px;
        }
        .note-box {
            background: #f0f7f4;
            padding: 0.8rem 1.2rem;
            border-radius: 10px;
            margin: 1rem 0;
            border-left: 3px solid #d4a373;
            font-size: 0.9rem;
        }
        hr {
            margin: 1.5rem 0;
            border: none;
            height: 1px;
            background: #e0d6ca;
        }
        .footer {
            background: #faf7f2;
            padding: 1rem 2rem;
            text-align: center;
            font-size: 0.8rem;
            color: #6b705c;
            border-top: 1px solid #e0d6ca;
        }
        @media (max-width: 600px) {
            .content {
                padding: 1.2rem;
            }
            .header h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Hiroma Organic Tea E-commerce Platform</h1>
        <div class="subtitle">CS5054NI - Advanced Programming and Technologies | Spring Semester 2026</div>
        <div class="repo">
            GitHub: <a href="https://github.com/your-group/Hiroma-EcommerceWebsite" target="_blank">https://github.com/your-group/Hiroma-EcommerceWebsite</a>
        </div>
    </div>

    <div class="content">
        <!-- Project Overview -->
        <h2>1. Project Overview</h2>
        <p><strong>Title:</strong> Hiroma Organic Tea Marketplace</p>
        <p><strong>Purpose:</strong> A web-based e-commerce platform where Nepali tea brands can sell organic teas. Users can log in as either a seller or a buyer. The system provides role-based access, product management, ordering, and administrative controls.</p>
        <p><strong>Audience:</strong> Tea sellers (brands, farmers) and tea buyers (individuals, wholesalers).</p>

        <h3>Aims and Objectives</h3>
        <ul>
            <li>Implement secure authentication and role-based authorization (Buyer, Seller, Admin).</li>
            <li>Provide full CRUD operations for products via seller dashboard.</li>
            <li>Enable buyers to browse, search, add to cart, place orders, and manage wishlists.</li>
            <li>Follow MVC architecture using JSP, Servlets, and MySQL.</li>
            <li>Ensure responsive frontend with pure CSS (no frameworks like Bootstrap).</li>
        </ul>

        <h3>Key Features</h3>
        <div class="feature-grid">
            <div class="feature-card"><strong>Authentication & Authorization</strong><br>Login/register with role selection (buyer/seller/admin). Session management and filters.</div>
            <div class="feature-card"><strong>Seller Dashboard</strong><br>Add, edit, delete, and view tea products. Stock and price management.</div>
            <div class="feature-card"><strong>Buyer Portal</strong><br>Browse teas, search by name/origin, add to cart, and checkout.</div>
            <div class="feature-card"><strong>Admin Dashboard</strong><br>Approve seller registrations, manage categories, generate sales reports.</div>
            <div class="feature-card"><strong>Wishlist & Apply Feature</strong><br>Buyers can wishlist items and request restock alerts.</div>
            <div class="feature-card"><strong>Search Functionality</strong><br>Search teas by name, origin, category, or brand.</div>
            <div class="feature-card"><strong>Order History</strong><br>Track orders, view issued items, and return due dates.</div>
            <div class="feature-card"><strong>Validation & Error Handling</strong><br>Unique email/product codes, custom error pages, proper exception handling.</div>
        </div>

        <hr>

        <!-- Wireframes -->
        <h2>2. Wireframes</h2>
        <p>The application includes the following major screens: Login/Registration page, Buyer Home (product catalog), Seller Dashboard (product management), Cart & Checkout page, Admin Panel (user approvals & reports). All layouts follow responsive design using CSS media queries and flexbox.</p>
        <div class="note-box">
            <strong>Wireframe Reference:</strong> Full wireframe designs including login, dashboard, product listing, and order summary are documented in the coursework report (PDF) with prototype sketches and final UI screenshots.
        </div>

        <hr>

        <!-- Java Classes MVC -->
        <h2>3. Java Classes (MVC Architecture)</h2>
        <p>The system follows the Model-View-Controller pattern with clear separation of concerns.</p>
        <pre>
Class Diagram (Simplified):

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
        </table>
            <thead>
                <tr><th>Class</th><th>Key Methods</th><th>Responsibility</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td><code>LoginController</code></td>
                    <td>doPost(), authenticateUser()</td>
                    <td>Validates credentials, starts session, redirects based on role.</td>
                </tr>
                <tr>
                    <td><code>ProductController</code></td>
                    <td>addProduct(), updateProduct(), deleteProduct(), searchProducts()</td>
                    <td>Manages all product CRUD operations for sellers.</td>
                </tr>
                <tr>
                    <td><code>CartController</code></td>
                    <td>addToCart(), removeItem(), checkout()</td>
                    <td>Handles shopping cart and order placement.</td>
                </tr>
                <tr>
                    <td><code>AdminController</code></td>
                    <td>approveSeller(), generateReport(), manageCategories()</td>
                    <td>Admin functions: user approvals and analytics.</td>
                </tr>
                <tr>
                    <td><code>DBConnection</code></td>
                    <td>getConnection(), closeResources()</td>
                    <td>JDBC connection pooling and exception handling.</td>
                </tr>
            </tbody>
        </table>

        <hr>

        <!-- Test Cases -->
        <h2>4. Test Cases</h2>
        <p>Comprehensive testing was performed to ensure functionality and robustness.</p>
        <table>
            <thead>
                <tr><th>Test ID</th><th>Feature</th><th>Expected Result</th><th>Status</th></tr>
            </thead>
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
        <div class="note-box">All validation cases (empty fields, invalid data types, duplicate entries) display appropriate error messages. Custom error pages (404, 500) are implemented.</div>

        <hr>

        <!-- Development Process and Tools -->
        <h2>5. Development Process and Tools</h2>
        <p><strong>Tools Used:</strong></p>
        <div>
            <span class="tech-badge">Eclipse IDE (Java EE)</span>
            <span class="tech-badge">MySQL 8.0</span>
            <span class="tech-badge">Apache Tomcat 10</span>
            <span class="tech-badge">XAMPP / phpMyAdmin</span>
            <span class="tech-badge">Git & GitHub</span>
            <span class="tech-badge">Draw.io (ER Diagram)</span>
            <span class="tech-badge">Maven</span>
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
        <p><strong>Lessons Learned:</strong> Importance of early milestone submissions (wireframes, DB schema, login module) to streamline final integration. Team collaboration using Git branches and regular code reviews ensured stability.</p>
        <p><strong>Future Improvements:</strong> Payment gateway integration, email notifications for order status, and a recommendation engine based on purchase history.</p>

        <div class="note-box">
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
        <div class="note-box" style="text-align: center; background: #e9f5ef;">
            <strong>Technology Compliance:</strong> Java 17 | Java EE (Servlets + JSP) | MySQL | JDBC | Tomcat 10 | Pure CSS (media queries, flexbox) | No Bootstrap frameworks used. Validation, exception handling, and role-based filters fully implemented.
        </div>

        <p style="font-size: 0.85rem; text-align: center; margin-top: 1.5rem;">Full report (16,000 words) submitted via MST portal includes detailed class diagrams, test logs, screenshots, and ER diagrams.</p>
    </div>

    <div class="footer">
        CS5054NI Group Coursework | Contributors: dilash, diby | London Metropolitan University & Islington College<br>
        Public GitHub repository with full source code and SQL schema.
    </div>
</div>
</body>
</html>
