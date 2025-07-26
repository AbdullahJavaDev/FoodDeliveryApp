<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Foodie Hub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.4;
            color: #ffffff;
            background: #1a1a1a;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
        }

        /* Enhanced animated background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E🍴%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E❤️%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23444'%3E🍕%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E🍔%3C/text%3E%3C/svg%3E");
            background-position: 150px 100px, 400px 300px, 100px 400px, 500px 150px;
            background-repeat: no-repeat;
            background-size: 30px 30px;
            opacity: 0.08;
            z-index: -1;
            animation: floatingBackground 20s ease-in-out infinite;
        }

        @keyframes floatingBackground {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            25% { transform: translateY(-10px) rotate(1deg); }
            50% { transform: translateY(-5px) rotate(-1deg); }
            75% { transform: translateY(-15px) rotate(0.5deg); }
        }

        /* Floating particles */
        .floating-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .particle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: #ff6b47;
            border-radius: 50%;
            opacity: 0.3;
            animation: float 15s infinite linear;
        }

        .particle:nth-child(1) { left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { left: 20%; animation-delay: 2s; }
        .particle:nth-child(3) { left: 30%; animation-delay: 4s; }
        .particle:nth-child(4) { left: 40%; animation-delay: 6s; }
        .particle:nth-child(5) { left: 50%; animation-delay: 8s; }
        .particle:nth-child(6) { left: 60%; animation-delay: 10s; }
        .particle:nth-child(7) { left: 70%; animation-delay: 12s; }
        .particle:nth-child(8) { left: 80%; animation-delay: 14s; }

        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 0.3;
            }
            90% {
                opacity: 0.3;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        /* Animated header */
        .header {
            background: #1a1a1a;
            color: white;
            padding: 0.8rem 0;
            border-bottom: 1px solid #333;
            animation: slideDown 0.8s ease-out;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #ff6b47;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .logo:hover {
            transform: scale(1.1) rotate(5deg);
            text-shadow: 0 0 20px rgba(255, 107, 71, 0.5);
        }

        .logo::after {
            content: "🍴";
            margin-left: 8px;
            font-size: 1.3rem;
            animation: rotate 3s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Main content with enhanced centering */
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem 0;
            min-height: calc(100vh - 100px);
            animation: fadeInUp 1s ease-out 0.3s both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            width: 100%;
        }

        /* Enhanced auth container with animations */
        .auth-container {
            background: rgba(42, 42, 42, 0.95);
            border-radius: 20px;
            padding: 2rem;
            width: 100%;
            max-width: 420px;
            margin: 0 auto;
            box-shadow: 
                0 20px 40px rgba(0,0,0,0.4),
                0 0 0 1px rgba(255, 107, 71, 0.1);
            border: 1px solid #333;
            animation: slideInScale 0.8s ease-out 0.5s both;
            backdrop-filter: blur(15px);
            position: relative;
            overflow: hidden;
        }

        .auth-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 107, 71, 0.03), transparent);
            animation: shimmer 3s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        @keyframes slideInScale {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .auth-header {
            text-align: center;
            margin-bottom: 1.5rem;
            animation: fadeIn 1s ease-out 0.8s both;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .auth-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ff6b47;
            margin-bottom: 0.3rem;
            background: linear-gradient(45deg, #ff6b47, #fd79a8, #ff6b47);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: gradientShift 3s ease-in-out infinite;
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .auth-subtitle {
            color: #ccc;
            font-size: 0.9rem;
            animation: fadeInUp 1s ease-out 1s both;
        }

        /* Enhanced message styles */
        .message {
            padding: 0.8rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 600;
            font-size: 0.9rem;
            display: none;
            animation: slideInMessage 0.5s ease-out;
        }

        @keyframes slideInMessage {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-message {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid #4CAF50;
            color: #4CAF50;
            box-shadow: 0 0 20px rgba(76, 175, 80, 0.2);
        }

        .error-message {
            background: rgba(244, 67, 54, 0.2);
            border: 1px solid #F44336;
            color: #F44336;
            box-shadow: 0 0 20px rgba(244, 67, 54, 0.2);
        }

        .info-message {
            background: rgba(255, 107, 71, 0.2);
            border: 1px solid #ff6b47;
            color: #ff6b47;
            box-shadow: 0 0 20px rgba(255, 107, 71, 0.2);
        }

        .message:not(:empty) {
            display: block;
        }

        /* Enhanced form styling with animations */
        .form-group {
            margin-bottom: 1rem;
            animation: fadeInUp 0.6s ease-out calc(1.2s + var(--delay, 0s)) both;
        }

        .form-group:nth-child(1) { --delay: 0s; }
        .form-group:nth-child(2) { --delay: 0.1s; }
        .form-group:nth-child(3) { --delay: 0.2s; }

        .form-group label {
            display: block;
            margin-bottom: 0.4rem;
            font-weight: 500;
            color: #fff;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .form-control {
            width: 100%;
            padding: 0.7rem;
            border: 2px solid #444;
            border-radius: 8px;
            background: #333;
            color: #fff;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            position: relative;
        }

        .form-control:focus {
            outline: none;
            border-color: #ff6b47;
            box-shadow: 
                0 0 0 3px rgba(255, 107, 71, 0.1),
                0 0 20px rgba(255, 107, 71, 0.2);
            background: #3a3a3a;
            transform: translateY(-2px);
        }

        .form-control:focus + label {
            color: #ff6b47;
        }

        .form-control::placeholder {
            color: #999;
            font-size: 0.9rem;
        }

        /* Enhanced form check */
        .form-check {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
            font-size: 0.85rem;
            animation: fadeInUp 0.6s ease-out 1.5s both;
        }

        .form-check-left {
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .form-check-input {
            width: 16px;
            height: 16px;
            accent-color: #ff6b47;
            transition: transform 0.2s ease;
        }

        .form-check-input:checked {
            transform: scale(1.1);
        }

        .form-check-label {
            color: #ccc;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }

        .form-check-input:checked + .form-check-label {
            color: #ff6b47;
        }

        .forgot-password {
            color: #ff6b47;
            text-decoration: none;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .forgot-password::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: #ff6b47;
            transition: width 0.3s ease;
        }

        .forgot-password:hover::after {
            width: 100%;
        }

        .forgot-password:hover {
            color: #e55a3a;
            transform: translateY(-1px);
        }

        /* Enhanced button with animations */
        .btn {
            width: 100%;
            padding: 0.9rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
            position: relative;
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out 1.6s both;
        }

        .btn-primary {
            background: linear-gradient(45deg, #ff6b47, #e55a3a);
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 71, 0.3);
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover:not(:disabled) {
            background: linear-gradient(45deg, #e55a3a, #d14836);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 107, 71, 0.4);
        }

        .btn-primary:active {
            transform: translateY(-1px);
        }

        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        /* Enhanced demo button */
        .demo-btn {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            background: transparent;
            border: 1px solid #666;
            color: #ccc;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.85rem;
            position: relative;
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out 1.4s both;
        }

        .demo-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 107, 71, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .demo-btn:hover::before {
            left: 100%;
        }

        .demo-btn:hover {
            border-color: #ff6b47;
            color: #ff6b47;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 71, 0.2);
        }

        /* Enhanced footer */
        .auth-footer {
            text-align: center;
            margin-top: 1.2rem;
            color: #ccc;
            font-size: 0.9rem;
            animation: fadeIn 1s ease-out 1.8s both;
        }

        .auth-link {
            color: #ff6b47;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        .auth-link::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: #ff6b47;
            transition: width 0.3s ease;
        }

        .auth-link:hover::after {
            width: 100%;
        }

        .auth-link:hover {
            color: #e55a3a;
            transform: translateY(-1px);
        }

        /* Animated footer */
        .footer {
            background: #1a1a1a;
            border-top: 1px solid #333;
            padding: 0.8rem 0;
            text-align: center;
            color: #ccc;
            font-size: 0.85rem;
            animation: slideUp 0.8s ease-out 2s both;
        }

        @keyframes slideUp {
            from {
                transform: translateY(100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Loading animation */
        .loading-spinner {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
            margin-left: 8px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .main-content {
                min-height: calc(100vh - 120px);
                padding: 0.5rem 0;
            }
            
            .auth-container {
                padding: 1.5rem;
                margin: 0.5rem;
                max-width: calc(100% - 1rem);
            }
        }

        @media (max-width: 480px) {
            .auth-title {
                font-size: 1.6rem;
            }
            
            .form-control {
                padding: 0.6rem;
            }
            
            .btn {
                padding: 0.8rem;
            }
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: #1a1a1a;
        }

        ::-webkit-scrollbar-thumb {
            background: #ff6b47;
            border-radius: 3px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #e55a3a;
        }

        /* Glow effect for focused elements */
        .glow {
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from {
                box-shadow: 0 0 5px rgba(255, 107, 71, 0.2);
            }
            to {
                box-shadow: 0 0 20px rgba(255, 107, 71, 0.4);
            }
        }
    </style>
</head>
<body>
    <!-- Floating Particles -->
    <div class="floating-particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Animated Header -->
    <header class="header">
        <div class="header-content">
            <a href="index.html" class="logo">Foodie Hub</a>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <div class="auth-container">
                <div class="auth-header">
                    <h1 class="auth-title">Welcome Back</h1>
                    <p class="auth-subtitle">Sign in to your account to continue ordering</p>
                </div>

                <!-- Message Container -->
                <div class="message success-message" id="successMessage"></div>
                <div class="message error-message" id="errorMessage"></div>

                <!-- Demo Button -->
                <button class="demo-btn" onclick="fillDemoData()">✨ Use Demo Account</button>

                <!-- Sign In Form -->
                <form action="<%= request.getContextPath() + "/Login" %>" method="get" id="signinForm">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control"
                               placeholder="Enter your email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control"
                               placeholder="Enter your password" required>
                    </div>
                    
                    <div class="form-check">
                        <div class="form-check-left">
                            <input type="checkbox" id="rememberMe" name="rememberMe" class="form-check-input" value="true">
                            <label for="rememberMe" class="form-check-label">Remember me</label>
                        </div>
                        <a href="#" class="forgot-password" onclick="handleForgotPassword()">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-primary" id="submitBtn">
                        <span id="btnText">🚀 Sign In</span>
                        <span id="loadingSpinner" class="loading-spinner" style="display: none;"></span>
                    </button>
                </form>

                <div class="auth-footer">
                    <p>Don't have an account? <a href="signup.html" class="auth-link">Sign Up</a></p>
                </div>
            </div>
        </div>
    </main>

    <!-- Animated Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Foodie Hub. All rights reserved. ✨</p>
        </div>
    </footer>

    <!-- Enhanced JavaScript -->
    <script>
        // Fill demo data with animation
        function fillDemoData() {
            const emailField = document.getElementById('email');
            const passwordField = document.getElementById('password');
            
            // Add glow effect
            emailField.classList.add('glow');
            passwordField.classList.add('glow');
            
            // Animate typing effect
            typeText(emailField, 'demo@foodiehub.com', 50);
            setTimeout(() => {
                typeText(passwordField, 'demo123', 50);
            }, 1000);
            
            // Remove glow after animation
            setTimeout(() => {
                emailField.classList.remove('glow');
                passwordField.classList.remove('glow');
            }, 3000);
        }

        // Typing animation function
        function typeText(element, text, speed) {
            element.value = '';
            let i = 0;
            const timer = setInterval(() => {
                if (i < text.length) {
                    element.value += text.charAt(i);
                    i++;
                } else {
                    clearInterval(timer);
                }
            }, speed);
        }

        // Enhanced forgot password with animation
        function handleForgotPassword() {
            const email = document.getElementById('email').value.trim();
            
            if (email) {
                showAnimatedMessage('Password reset functionality will be handled by your Java backend', 'info');
            } else {
                showAnimatedMessage('Please enter your email address first', 'error');
                document.getElementById('email').focus();
                document.getElementById('email').classList.add('glow');
                setTimeout(() => {
                    document.getElementById('email').classList.remove('glow');
                }, 2000);
            }
        }

        // Animated message function
        function showAnimatedMessage(text, type) {
            const messageDiv = document.getElementById(type === 'error' ? 'errorMessage' : 'successMessage');
            messageDiv.textContent = text;
            messageDiv.style.display = 'block';
            messageDiv.style.animation = 'slideInMessage 0.5s ease-out';
            
            setTimeout(() => {
                messageDiv.style.animation = 'slideInMessage 0.5s ease-out reverse';
                setTimeout(() => {
                    messageDiv.style.display = 'none';
                    messageDiv.textContent = '';
                }, 500);
            }, 3000);
        }

        // Enhanced form submission with loading animation
        document.getElementById('signinForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            const btnText = document.getElementById('btnText');
            const loadingSpinner = document.getElementById('loadingSpinner');
            
            // Show loading state
            btnText.style.display = 'none';
            loadingSpinner.style.display = 'inline-block';
            submitBtn.disabled = true;
            submitBtn.style.transform = 'scale(0.98)';
            
            // Add some visual feedback
            submitBtn.innerHTML = '🔄 Signing In...';
        });

        // Add focus animations to form fields
        document.querySelectorAll('.form-control').forEach(field => {
            field.addEventListener('focus', function() {
                this.parentElement.querySelector('label').style.color = '#ff6b47';
                this.parentElement.style.transform = 'translateY(-2px)';
            });
            
            field.addEventListener('blur', function() {
                this.parentElement.querySelector('label').style.color = '#fff';
                this.parentElement.style.transform = 'translateY(0)';
            });
        });

        // Add entrance animation trigger
        window.addEventListener('load', function() {
            document.body.style.opacity = '1';
        });

        // Add particle interaction
        document.addEventListener('mousemove', function(e) {
            const particles = document.querySelectorAll('.particle');
            particles.forEach((particle, index) => {
                const speed = (index + 1) * 0.01;
                const x = (e.clientX * speed) % window.innerWidth;
                const y = (e.clientY * speed) % window.innerHeight;
                particle.style.transform = `translate(${x * 0.1}px, ${y * 0.1}px)`;
            });
        });
    </script>
</body>
</html>