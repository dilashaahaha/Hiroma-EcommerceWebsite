<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In &mdash; Hiroma</title>
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
            --success:     #27613A;
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
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 48px;
        }
        .panel-bg {
            position: absolute; inset: 0;
            background:
                radial-gradient(ellipse 70% 70% at 30% 40%, rgba(74,124,95,0.4) 0%, transparent 70%),
                radial-gradient(ellipse 40% 50% at 80% 80%, rgba(200,137,58,0.15) 0%, transparent 60%);
        }
        .panel-deco {
            position: absolute; bottom: 0; right: 0;
            width: 280px; height: 280px;
            border-top-left-radius: 100%;
            border: 1px solid rgba(245,240,230,0.06);
        }
        .panel-deco2 {
            position: absolute; bottom: -40px; right: -40px;
            width: 360px; height: 360px;
            border-top-left-radius: 100%;
            border: 1px solid rgba(200,137,58,0.1);
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
            font-size: clamp(42px, 5vw, 64px);
            font-weight: 300; line-height: 1.0; color: var(--cream); margin-bottom: 24px;
        }
        .panel-heading em { font-style: italic; color: var(--amber-light); }

        .panel-body {
            font-size: 14px; line-height: 1.9;
            color: rgba(245,240,230,0.55); font-weight: 300; max-width: 360px;
        }

        .panel-bottom { position: relative; z-index: 2; }
        .panel-stats {
            display: grid; grid-template-columns: repeat(3, 1fr);
            border-top: 1px solid rgba(245,240,230,0.1); padding-top: 32px;
        }
        .stat-item { padding-right: 24px; border-right: 1px solid rgba(245,240,230,0.08); }
        .stat-item:last-child  { border-right: none; padding-left: 24px; padding-right: 0; }
        .stat-item:nth-child(2){ padding-left: 24px; }
        .stat-num {
            font-family: 'Cormorant Garamond', serif;
            font-size: 32px; font-weight: 300; color: var(--cream); line-height: 1;
        }
        .stat-label {
            font-size: 9px; letter-spacing: 0.18em; text-transform: uppercase;
            color: rgba(245,240,230,0.35); margin-top: 4px;
        }

        /* ── RIGHT PANEL ── */
        .right-panel {
            display: flex; flex-direction: column; justify-content: center;
            padding: 80px 64px; background: var(--cream);
        }
        .form-container { max-width: 400px; width: 100%; }

        .form-eyebrow {
            display: flex; align-items: center; gap: 10px;
            font-size: 10px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--green-soft); margin-bottom: 16px;
        }
        .form-eyebrow::before { content: ''; width: 20px; height: 1px; background: var(--green-soft); }

        .form-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 40px; font-weight: 400; color: var(--green-deep);
            line-height: 1.1; margin-bottom: 8px;
        }
        .form-subtitle {
            font-size: 14px; color: var(--text-light); font-weight: 300;
            margin-bottom: 40px; line-height: 1.6;
        }
        .form-subtitle a { color: var(--amber); border-bottom: 1px solid transparent; transition: border-color 0.2s; }
        .form-subtitle a:hover { border-bottom-color: var(--amber); }

        .form-group { display: flex; flex-direction: column; gap: 6px; margin-bottom: 20px; }
        .form-label {
            font-size: 10px; font-weight: 500; letter-spacing: 0.14em;
            text-transform: uppercase; color: var(--text-mid);
        }
        .form-input {
            padding: 14px 18px; border: 1px solid var(--border);
            background: var(--white); border-radius: 3px;
            font-size: 14px; color: var(--text-dark); font-family: 'DM Sans', sans-serif;
            outline: none; width: 100%; transition: border-color 0.2s, box-shadow 0.2s;
        }
        .form-input:focus {
            border-color: var(--green-soft);
            box-shadow: 0 0 0 3px rgba(74,124,95,0.08);
        }
        .form-input::placeholder { color: rgba(138,138,114,0.6); }

        .input-wrap { position: relative; }
        .input-icon {
            position: absolute; right: 16px; top: 50%; transform: translateY(-50%);
            cursor: pointer; font-size: 16px; color: var(--text-light);
        }

        .form-row-between {
            display: flex; align-items: center; justify-content: space-between;
            margin-bottom: 28px;
        }
        .form-check { display: flex; align-items: center; gap: 8px; cursor: pointer; font-size: 13px; color: var(--text-mid); }
        .form-check input { accent-color: var(--green-soft); }

        .forgot-link { font-size: 12px; color: var(--green-soft); letter-spacing: 0.04em; transition: color 0.2s; }
        .forgot-link:hover { color: var(--amber); }

        .btn-submit {
            width: 100%; padding: 16px;
            background: var(--green-deep); color: var(--cream);
            font-size: 11px; font-weight: 500; letter-spacing: 0.14em;
            text-transform: uppercase; border: none; border-radius: 3px;
            cursor: pointer; font-family: 'DM Sans', sans-serif;
            transition: background 0.25s, box-shadow 0.25s; margin-bottom: 20px;
        }
        .btn-submit:hover { background: var(--green-mid); box-shadow: 0 8px 24px rgba(26,51,40,0.2); }

        .divider-or {
            display: flex; align-items: center; gap: 16px; margin-bottom: 20px;
            font-size: 11px; letter-spacing: 0.1em; text-transform: uppercase; color: var(--text-light);
        }
        .divider-or::before, .divider-or::after { content: ''; flex: 1; height: 1px; background: var(--border); }

        .btn-google {
            width: 100%; padding: 14px; background: var(--white);
            border: 1px solid var(--border); border-radius: 3px;
            font-size: 13px; color: var(--text-dark); font-family: 'DM Sans', sans-serif;
            display: flex; align-items: center; justify-content: center; gap: 10px;
            cursor: pointer; transition: border-color 0.2s, box-shadow 0.2s;
        }
        .btn-google:hover { border-color: var(--green-soft); box-shadow: 0 2px 12px rgba(26,51,40,0.06); }

        .alert-error {
            padding: 12px 16px; background: #FDECEA;
            border: 1px solid #F09595; border-radius: 3px;
            font-size: 13px; color: var(--error);
            display: flex; align-items: center; gap: 8px; margin-bottom: 20px;
        }
        .alert-success {
            padding: 12px 16px; background: #EAF3DE;
            border: 1px solid #97C459; border-radius: 3px;
            font-size: 13px; color: var(--success);
            display: flex; align-items: center; gap: 8px; margin-bottom: 20px;
        }

        @media (max-width: 900px) {
            body { grid-template-columns: 1fr; }
            .left-panel { display: none; }
            .right-panel { padding: 60px 32px; }
        }
    </style>
</head>
<body>

<!-- ===== LEFT GREEN PANEL ===== -->
<div class="left-panel">
    <div class="panel-bg"></div>
    <div class="panel-deco"></div>
    <div class="panel-deco2"></div>

    <div class="panel-logo">H<span>i</span>roma</div>

    <div class="panel-center">
        <div class="panel-tag">Welcome back</div>
        <h1 class="panel-heading">
            Your cup<br>
            awaits<br>
            <em>you.</em>
        </h1>
        <p class="panel-body">
            Sign in to browse Nepal's finest organic teas, track your
            orders, and discover new arrivals from Himalayan gardens.
        </p>
    </div>

    <div class="panel-bottom">
        <div class="panel-stats">
            <div class="stat-item">
                <div class="stat-num">46+</div>
                <div class="stat-label">Tea varieties</div>
            </div>
            <div class="stat-item">
                <div class="stat-num">12</div>
                <div class="stat-label">Verified brands</div>
            </div>
            <div class="stat-item">
                <div class="stat-num">8</div>
                <div class="stat-label">Districts</div>
            </div>
        </div>
    </div>
</div>

<!-- ===== RIGHT FORM PANEL ===== -->
<div class="right-panel">
    <div class="form-container">

        <div class="form-eyebrow">Sign in</div>
        <h2 class="form-title">Good to see<br>you again</h2>
        <p class="form-subtitle">
            New to Hiroma?
            <a href="register.jsp">Create a free account</a>
        </p>

        <!-- Show these when you wire up Java later -->
        <!-- <div class="alert-error">&#9888; Invalid email or password.</div> -->
        <!-- <div class="alert-success">&#10003; Account created! Please sign in.</div> -->

        <form action="/Hiroma-Website/LoginServlet" method="post">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label class="form-label" for="email">Email address</label>
                <input class="form-input" type="email" id="email" name="email"
                       placeholder="you@email.com" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Password</label>
                <div class="input-wrap">
                    <input class="form-input" type="password" id="password" name="password"
                           placeholder="Your password" style="padding-right:48px;" required>
                    <span class="input-icon" onclick="togglePwd()">&#128065;</span>
                </div>
            </div>

            <div class="form-row-between">
                <label class="form-check">
                    <input type="checkbox" name="remember"> Remember me
                </label>
                <a class="forgot-link" href="#">Forgot password?</a>
            </div>

            <button class="btn-submit" type="submit">Sign in to Hiroma</button>
        </form>

        <div class="divider-or">or continue with</div>

        <button class="btn-google">
            <span>G</span> Continue with Google
        </button>

    </div>
</div>

<script>
    function togglePwd() {
        var f = document.getElementById("password");
        f.type = (f.type === "password") ? "text" : "password";
    }
</script>
</body>
</html>