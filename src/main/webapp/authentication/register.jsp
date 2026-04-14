<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account &mdash; Hiroma</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --green-deep:  #1A3328;
            --green-mid:   #2A4F3C;
            --green-soft:  #4A7C5F;
            --cream:       #F5F0E6;
            --cream-warm:  #EDE6D6;
            --amber:       #C8893A;
            --amber-light: #E8B86D;
            --text-dark:   #1A1A14;
            --text-mid:    #4A4A3A;
            --text-light:  #8A8A72;
            --border:      rgba(26,51,40,0.12);
            --error:       #C0392B;
            --white:       #ffffff;
        }

        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--cream);
            min-height: 100vh;
            display: grid;
            grid-template-columns: 1fr 1fr;
            -webkit-font-smoothing: antialiased;
        }

        a { text-decoration: none; color: inherit; }

        /* ── LEFT PANEL ── */
        .left-panel {
            background: var(--green-deep);
            position: relative; overflow: hidden;
            display: flex; flex-direction: column;
            justify-content: space-between; padding: 48px;
        }
        .panel-bg {
            position: absolute; inset: 0;
            background:
                radial-gradient(ellipse 60% 80% at 70% 30%, rgba(74,124,95,0.35) 0%, transparent 70%),
                radial-gradient(ellipse 40% 40% at 20% 80%, rgba(200,137,58,0.15) 0%, transparent 60%);
        }
        .panel-deco {
            position: absolute; top: -80px; right: -80px;
            width: 320px; height: 320px; border-radius: 50%;
            border: 1px solid rgba(245,240,230,0.04);
        }
        .panel-logo {
            position: relative; z-index: 2;
            font-family: 'Cormorant Garamond', serif;
            font-size: 26px; font-weight: 600;
            letter-spacing: 0.14em; text-transform: uppercase; color: var(--cream);
        }
        .panel-logo span { color: var(--amber); font-style: italic; }

        .panel-center {
            position: relative; z-index: 2;
            flex: 1; display: flex; flex-direction: column; justify-content: center;
        }
        .panel-tag {
            display: inline-flex; align-items: center; gap: 8px;
            font-size: 10px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--amber-light); margin-bottom: 24px;
        }
        .panel-tag::before { content: ''; width: 28px; height: 1px; background: var(--amber); }

        .panel-heading {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(38px, 4.5vw, 58px);
            font-weight: 300; line-height: 1.05; color: var(--cream); margin-bottom: 24px;
        }
        .panel-heading em { font-style: italic; color: var(--amber-light); }

        .panel-body {
            font-size: 14px; line-height: 1.9;
            color: rgba(245,240,230,0.55); font-weight: 300; max-width: 340px;
        }

        /* Steps at the bottom of left panel */
        .panel-steps {
            position: relative; z-index: 2;
            padding-top: 32px; border-top: 1px solid rgba(245,240,230,0.1);
        }
        .step-item {
            display: flex; align-items: flex-start; gap: 16px; margin-bottom: 20px;
        }
        .step-item:last-child { margin-bottom: 0; }
        .step-num {
            width: 28px; height: 28px; border-radius: 50%;
            background: rgba(245,240,230,0.08);
            border: 1px solid rgba(245,240,230,0.15);
            display: flex; align-items: center; justify-content: center;
            font-size: 11px; color: var(--amber-light); flex-shrink: 0; margin-top: 1px;
        }
        .step-text strong {
            display: block; font-size: 13px; color: var(--cream);
            font-weight: 400; margin-bottom: 2px;
        }
        .step-text span { font-size: 11px; color: rgba(245,240,230,0.4); }

        /* ── RIGHT PANEL ── */
        .right-panel {
            display: flex; flex-direction: column; justify-content: center;
            padding: 48px 64px; background: var(--cream); overflow-y: auto;
        }
        .form-container { max-width: 440px; width: 100%; }

        .form-eyebrow {
            display: flex; align-items: center; gap: 10px;
            font-size: 10px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--green-soft); margin-bottom: 16px;
        }
        .form-eyebrow::before { content: ''; width: 20px; height: 1px; background: var(--green-soft); }

        .form-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 38px; font-weight: 400; color: var(--green-deep);
            line-height: 1.1; margin-bottom: 6px;
        }
        .form-subtitle {
            font-size: 14px; color: var(--text-light); font-weight: 300;
            margin-bottom: 32px; line-height: 1.6;
        }
        .form-subtitle a { color: var(--amber); border-bottom: 1px solid transparent; transition: border-color 0.2s; }
        .form-subtitle a:hover { border-bottom-color: var(--amber); }

        /* Two-column row for first / last name */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .form-group { display: flex; flex-direction: column; gap: 6px; margin-bottom: 16px; }
        .form-label {
            font-size: 10px; font-weight: 500; letter-spacing: 0.14em;
            text-transform: uppercase; color: var(--text-mid);
        }
        .form-input {
            padding: 13px 16px; border: 1px solid var(--border);
            background: var(--white); border-radius: 3px;
            font-size: 14px; color: var(--text-dark); font-family: 'DM Sans', sans-serif;
            outline: none; width: 100%; transition: border-color 0.2s, box-shadow 0.2s;
        }
        .form-input:focus {
            border-color: var(--green-soft);
            box-shadow: 0 0 0 3px rgba(74,124,95,0.08);
        }
        .form-input::placeholder { color: rgba(138,138,114,0.5); }
        .form-input.input-error { border-color: var(--error); }

        /* Inline field error message */
        .field-error {
            font-size: 11px; color: var(--error); margin-top: 3px;
            display: flex; align-items: center; gap: 4px;
        }

        /* "I want to" divider */
        .section-divider {
            display: flex; align-items: center; gap: 14px;
            font-size: 10px; letter-spacing: 0.16em; text-transform: uppercase;
            color: var(--text-light); margin: 18px 0 14px;
        }
        .section-divider::before,
        .section-divider::after {
            content: ''; flex: 1; height: 1px; background: var(--border);
        }

        /* Role selection cards */
        .role-cards {
            display: grid; grid-template-columns: 1fr 1fr;
            gap: 12px; margin-bottom: 18px;
        }
        .role-card {
            padding: 16px; border: 1.5px solid var(--border);
            border-radius: 4px; cursor: pointer; transition: all 0.2s;
            background: var(--white);
        }
        .role-card:hover { border-color: var(--green-soft); background: var(--cream); }
        .role-card.selected {
            border-color: var(--green-deep);
            background: rgba(26,51,40,0.04);
        }
        .role-card-icon { font-size: 22px; margin-bottom: 8px; }
        .role-card-title { font-size: 13px; font-weight: 500; color: var(--green-deep); margin-bottom: 3px; }
        .role-card-desc { font-size: 11px; color: var(--text-light); line-height: 1.4; }

        /* Terms checkbox row */
        .form-check-row {
            display: flex; align-items: flex-start; gap: 10px;
            margin-bottom: 22px;
        }
        .form-check-row input {
            accent-color: var(--green-soft); margin-top: 2px; flex-shrink: 0;
        }
        .form-check-row span { font-size: 12px; color: var(--text-mid); line-height: 1.6; }
        .form-check-row a { color: var(--amber); }

        /* General error box */
        .alert-error {
            padding: 12px 16px; background: #FDECEA;
            border: 1px solid #F09595; border-radius: 3px;
            font-size: 13px; color: var(--error);
            display: flex; align-items: center; gap: 8px; margin-bottom: 20px;
        }

        /* Submit button */
        .btn-submit {
            width: 100%; padding: 16px;
            background: var(--green-deep); color: var(--cream);
            font-size: 11px; font-weight: 500; letter-spacing: 0.14em;
            text-transform: uppercase; border: none; border-radius: 3px;
            cursor: pointer; font-family: 'DM Sans', sans-serif;
            transition: background 0.25s, box-shadow 0.25s;
        }
        .btn-submit:hover { background: var(--green-mid); box-shadow: 0 8px 24px rgba(26,51,40,0.2); }

        @media (max-width: 900px) {
            body { grid-template-columns: 1fr; }
            .left-panel { display: none; }
            .right-panel { padding: 48px 28px; }
            .form-row { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<!-- ===== LEFT GREEN PANEL ===== -->
<div class="left-panel">
    <div class="panel-bg"></div>
    <div class="panel-deco"></div>

    <div class="panel-logo">H<span>i</span>roma</div>

    <div class="panel-center">
        <div class="panel-tag">Join Hiroma</div>
        <h1 class="panel-heading">
            Nepal's teas,<br>
            at your<br>
            <em>fingertips.</em>
        </h1>
        <p class="panel-body">
            Create your account and start exploring authentic organic teas
            directly from Nepal's most prized gardens.
        </p>
    </div>

    <div class="panel-steps">
        <div class="step-item">
            <div class="step-num">1</div>
            <div class="step-text">
                <strong>Create your account</strong>
                <span>Fill in your details below</span>
            </div>
        </div>
        <div class="step-item">
            <div class="step-num">2</div>
            <div class="step-text">
                <strong>Browse the collection</strong>
                <span>46+ Himalayan tea varieties</span>
            </div>
        </div>
        <div class="step-item">
            <div class="step-num">3</div>
            <div class="step-text">
                <strong>Order &amp; enjoy</strong>
                <span>Delivered across Nepal</span>
            </div>
        </div>
    </div>
</div>

<!-- ===== RIGHT FORM PANEL ===== -->
<div class="right-panel">
    <div class="form-container">

        <div class="form-eyebrow">Create account</div>
        <h2 class="form-title">Start your journey</h2>
        <p class="form-subtitle">
            Already have an account?
            <a href="login.jsp">Sign in instead</a>
        </p>

        <!-- Show this when you wire up Java later -->
        <!-- <div class="alert-error">&#9888; Something went wrong. Please try again.</div> -->

        <form action="#" method="post">

            <!-- First name + Last name side by side -->
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="firstName">First name</label>
                    <input class="form-input" type="text" id="firstName" name="firstName"
                           placeholder="Ram" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="lastName">Last name</label>
                    <input class="form-input" type="text" id="lastName" name="lastName"
                           placeholder="Sharma" required>
                </div>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label class="form-label" for="email">Email address</label>
                <input class="form-input" type="email" id="email" name="email"
                       placeholder="you@email.com" required>
            </div>

            <!-- Phone -->
            <div class="form-group">
                <label class="form-label" for="phone">Phone number</label>
                <input class="form-input" type="tel" id="phone" name="phone"
                       placeholder="98XXXXXXXX">
            </div>

            <!-- Role selection -->
            <div class="section-divider">I want to</div>

            <div class="role-cards">
                <div class="role-card selected" id="card-customer" onclick="selectRole('customer')">
                    <div class="role-card-icon">&#128722;</div>
                    <div class="role-card-title">Shop teas</div>
                    <div class="role-card-desc">Browse, buy and review Himalayan teas</div>
                </div>
                <div class="role-card" id="card-vendor" onclick="selectRole('vendor')">
                    <div class="role-card-icon">&#127956;</div>
                    <div class="role-card-title">Sell my teas</div>
                    <div class="role-card-desc">List my brand's products on Hiroma</div>
                </div>
            </div>
            <input type="hidden" id="roleInput" name="role" value="customer">

            <!-- Password -->
            <div class="form-group">
                <label class="form-label" for="password">Password</label>
                <input class="form-input" type="password" id="password" name="password"
                       placeholder="Minimum 8 characters" required>
            </div>

            <!-- Confirm password -->
            <div class="form-group">
                <label class="form-label" for="confirmPassword">Confirm password</label>
                <input class="form-input" type="password" id="confirmPassword" name="confirmPassword"
                       placeholder="Repeat your password" required>
            </div>

            <!-- Terms -->
            <div class="form-check-row">
                <input type="checkbox" id="terms" required>
                <span>
                    I agree to Hiroma's <a href="#">Terms of Service</a> and
                    <a href="#">Privacy Policy</a>
                </span>
            </div>

            <button class="btn-submit" type="submit">Create my account</button>

        </form>
    </div>
</div>

<script>
    function selectRole(role) {
        document.getElementById("roleInput").value = role;
        document.getElementById("card-customer").classList.remove("selected");
        document.getElementById("card-vendor").classList.remove("selected");
        document.getElementById("card-" + role).classList.add("selected");
    }
</script>
</body>
</html>
