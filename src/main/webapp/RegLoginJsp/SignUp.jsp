<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Foodie Hub</title>
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

        /* Simplified background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E🍴%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E❤️%3C/text%3E%3C/svg%3E");
            background-position: 150px 100px, 400px 300px, 100px 400px, 500px 150px;
            background-repeat: no-repeat;
            background-size: 30px 30px;
            opacity: 0.08;
            z-index: -1;
        }

        /* Compact header */
        .header {
            background: #1a1a1a;
            color: white;
            padding: 0.8rem 0;
            border-bottom: 1px solid #333;
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
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo::after {
            content: "🍴";
            margin-left: 8px;
            font-size: 1.3rem;
        }

        /* Main content with perfect centering */
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem 0;
            min-height: calc(100vh - 100px);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            width: 100%;
        }

        /* Compact auth container */
        .auth-container {
            background: rgba(42, 42, 42, 0.9);
            border-radius: 15px;
            padding: 1.8rem;
            width: 100%;
            max-width: 480px;
            margin: 0 auto;
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
            border: 1px solid #333;
            animation: fadeIn 0.5s ease-out;
            backdrop-filter: blur(10px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .auth-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .auth-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ff6b47;
            margin-bottom: 0.3rem;
            background: linear-gradient(45deg, #ff6b47, #fd79a8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .auth-subtitle {
            color: #ccc;
            font-size: 0.9rem;
        }

        /* Message styles */
        .message {
            padding: 0.8rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 600;
            display: none;
            font-size: 0.9rem;
        }

        .success-message {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid #4CAF50;
            color: #4CAF50;
        }

        .error-message {
            background: rgba(244, 67, 54, 0.2);
            border: 1px solid #F44336;
            color: #F44336;
        }

        .message:not(:empty) {
            display: block;
        }

        /* Compact form styling */
        .form-group {
            margin-bottom: 1rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.8rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.4rem;
            font-weight: 500;
            color: #fff;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 0.7rem;
            border: 2px solid #444;
            border-radius: 8px;
            background: #333;
            color: #fff;
            transition: all 0.3s;
            font-size: 0.95rem;
        }

        .form-control:focus {
            outline: none;
            border-color: #ff6b47;
            box-shadow: 0 0 8px rgba(255, 107, 71, 0.3);
            background: #3a3a3a;
        }

        .form-control::placeholder {
            color: #999;
            font-size: 0.9rem;
        }

        /* Compact button */
        .btn {
            width: 100%;
            padding: 0.9rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, #ff6b47, #e55a3a);
            color: white;
        }

        .btn-primary:hover:not(:disabled) {
            background: linear-gradient(45deg, #e55a3a, #d14836);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 107, 71, 0.4);
        }

        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        /* Compact footer */
        .auth-footer {
            text-align: center;
            margin-top: 1.2rem;
            color: #ccc;
            font-size: 0.9rem;
        }

        .auth-link {
            color: #ff6b47;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .auth-link:hover {
            color: #e55a3a;
            text-decoration: underline;
        }

        /* Compact footer */
        .footer {
            background: #1a1a1a;
            border-top: 1px solid #333;
            padding: 0.8rem 0;
            text-align: center;
            color: #ccc;
            font-size: 0.85rem;
        }

        /* Loading animation */
        .loading {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
                gap: 0.6rem;
            }
            
            .main-content {
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
    </style>
</head>
<body>
    <!-- Compact Header -->
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
                    <h1 class="auth-title">Join Foodie Hub</h1>
                    <p class="auth-subtitle">Create your account to start ordering</p>
                </div>

                <!-- Message Container (for your Java messages) -->
                <div class="message success-message" id="successMessage"></div>
                <div class="message error-message" id="errorMessage"></div>

                <!-- Sign Up Form -->
                <form action="<%= request.getContextPath() + "/Reg" %>" method="get" id="signupForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstName" class="form-control" 
                                   placeholder="First name" required>
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastName" class="form-control" 
                                   placeholder="Last name" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" 
                               placeholder="Enter your email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" class="form-control" 
                               placeholder="Enter phone number" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Address</label>
                        <input type="text" id="add" name="addr" class="form-control" 
                               placeholder="Enter Address" required>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control" 
                                   placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" 
                                   placeholder="Confirm" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">
                        Create Account
                    </button>
                </form>

                <div class="auth-footer">
                    <p>Already have an account? <a href="signin.html" class="auth-link">Sign In</a></p>
                </div>
            </div>
        </div>
    </main>

    <!-- Compact Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Foodie Hub. All rights reserved.</p>
        </div>
    </footer>

    <!-- Minimal JavaScript for UI feedback only -->
    <script>
        // Simple form submission feedback
        document.getElementById('signupForm').addEventListener('submit', function() {
            const submitBtn = this.querySelector('.btn-primary');
            submitBtn.innerHTML = 'Creating Account...';
            submitBtn.disabled = true;
        });

        // Visual password confirmation feedback (UI only)
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (confirmPassword && password !== confirmPassword) {
                this.style.borderColor = '#e74c3c';
            } else if (confirmPassword && password === confirmPassword) {
                this.style.borderColor = '#4CAF50';
            } else {
                this.style.borderColor = '#444';
            }
        });

        // Visual email validation feedback (UI only)
        document.getElementById('email').addEventListener('blur', function() {
            const email = this.value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (email && !emailRegex.test(email)) {
                this.style.borderColor = '#e74c3c';
            } else if (email) {
                this.style.borderColor = '#4CAF50';
            } else {
                this.style.borderColor = '#444';
            }
        });
    </script>
</body>
</html>