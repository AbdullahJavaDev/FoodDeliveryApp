<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Foodie Hub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #ffffff;
            background: #1a1a1a;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        /* Background decorative icons */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E😊%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E🍴%3C/text%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 60 60'%3E%3Ctext x='30' y='35' text-anchor='middle' font-size='20' fill='%23333'%3E❤️%3C/text%3E%3C/svg%3E");
            background-position: 
                100px 150px, 300px 80px, 500px 200px, 150px 350px,
                400px 300px, 50px 500px, 600px 400px, 250px 600px;
            background-repeat: no-repeat;
            background-size: 40px 40px;
            opacity: 0.1;
            z-index: -1;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 1;
        }

        /* Header Styles */
        .header {
            background: #1a1a1a;
            color: white;
            padding: 1rem 0;
            border-bottom: 1px solid #333;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .auth-btn {
            background: #ff6b47;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .auth-btn:hover {
            background: #e55a3a;
            transform: translateY(-2px);
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 2rem;
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
            content: "🍴🥄";
            margin-left: 10px;
            font-size: 1.5rem;
        }

        /* Main Content */
        .main {
            padding: 2rem 0;
            min-height: calc(100vh - 120px);
        }

        /* Animation Container */
        .animation-container {
            position: relative;
            height: 300px;
            margin: 2rem 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
        }

        /* Road Animation */
        .road {
            position: absolute;
            bottom: 80px;
            left: 0;
            right: 0;
            height: 60px;
            background: #333;
            border-top: 3px solid #666;
            border-bottom: 3px solid #666;
        }

        .road::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 4px;
            background: repeating-linear-gradient(
                90deg,
                #fff 0px,
                #fff 30px,
                transparent 30px,
                transparent 60px
            );
            animation: roadLines 2s linear infinite;
        }

        @keyframes roadLines {
            0% { transform: translateX(0); }
            100% { transform: translateX(-60px); }
        }

        /* Scooty Animation */
        .scooty-container {
            position: absolute;
            bottom: 90px;
            left: -150px;
            animation: scootyMove 8s ease-in-out infinite;
        }

        @keyframes scootyMove {
            0% { 
                left: -150px; 
                transform: scale(1);
            }
            25% { 
                left: 20%;
                transform: scale(1.1);
            }
            50% { 
                left: 50%;
                transform: scale(1.2);
            }
            75% { 
                left: 80%;
                transform: scale(1.1);
            }
            100% { 
                left: calc(100% + 50px);
                transform: scale(1);
            }
        }

        .scooty {
            font-size: 4rem;
            position: relative;
            animation: scootyBounce 0.5s ease-in-out infinite alternate;
        }

        @keyframes scootyBounce {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-5px); }
        }

        .delivery-man {
            position: absolute;
            top: -20px;
            left: -10px;
            font-size: 2rem;
            animation: manWave 2s ease-in-out infinite;
        }

        @keyframes manWave {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(10deg); }
        }

        .food-box {
            position: absolute;
            top: -15px;
            right: -20px;
            font-size: 1.5rem;
            animation: boxShake 1s ease-in-out infinite;
        }

        @keyframes boxShake {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }

        /* Buildings Background */
        .buildings {
            position: absolute;
            bottom: 140px;
            left: 0;
            right: 0;
            height: 120px;
            background: linear-gradient(to right, 
                #2c3e50 0%, #2c3e50 15%,
                #34495e 15%, #34495e 30%,
                #2c3e50 30%, #2c3e50 45%,
                #34495e 45%, #34495e 60%,
                #2c3e50 60%, #2c3e50 75%,
                #34495e 75%, #34495e 90%,
                #2c3e50 90%, #2c3e50 100%
            );
            opacity: 0.7;
        }

        .buildings::before {
            content: '🏢🏬🏪🏢🏬🏪🏢🏬';
            position: absolute;
            top: -20px;
            left: 0;
            right: 0;
            font-size: 2rem;
            text-align: center;
            letter-spacing: 2rem;
            opacity: 0.5;
        }

        /* Chart Animation */
        .chart-container {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: chartSlideIn 2s ease-out 3s both;
        }

        @keyframes chartSlideIn {
            0% {
                opacity: 0;
                transform: translateX(100px) scale(0.8);
            }
            100% {
                opacity: 1;
                transform: translateX(0) scale(1);
            }
        }

        .chart-man {
            font-size: 3rem;
            margin-bottom: 0.5rem;
            animation: chartManPoint 2s ease-in-out infinite;
        }

        @keyframes chartManPoint {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(-10deg); }
        }

        .chart-content {
            color: #333;
            font-weight: 600;
            text-align: center;
            font-size: 0.9rem;
        }

        .chart-title {
            color: #4CAF50;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        /* Confirmation Container */
        .confirmation-container {
            background: rgba(42, 42, 42, 0.9);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
            border: 1px solid #333;
            max-width: 800px;
            margin: 2rem auto;
            animation: containerSlideUp 1s ease-out;
            backdrop-filter: blur(15px);
        }

        @keyframes containerSlideUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .confirmation-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .success-icon {
            font-size: 5rem;
            color: #4CAF50;
            margin-bottom: 1rem;
            animation: successPulse 2s ease-in-out infinite;
        }

        @keyframes successPulse {
            0%, 100% { 
                transform: scale(1);
                filter: drop-shadow(0 0 10px rgba(76, 175, 80, 0.5));
            }
            50% { 
                transform: scale(1.1);
                filter: drop-shadow(0 0 20px rgba(76, 175, 80, 0.8));
            }
        }

        .confirmation-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 0.5rem;
            background: linear-gradient(45deg, #4CAF50, #45a049);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .confirmation-subtitle {
            color: #ccc;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        .order-number {
            background: linear-gradient(45deg, #4CAF50, #45a049);
            color: white;
            padding: 1rem 2rem;
            border-radius: 15px;
            font-weight: bold;
            margin: 1.5rem auto;
            display: inline-block;
            font-size: 1.3rem;
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
            animation: orderNumberGlow 3s ease-in-out infinite;
        }

        @keyframes orderNumberGlow {
            0%, 100% { 
                box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
            }
            50% { 
                box-shadow: 0 8px 35px rgba(76, 175, 80, 0.6);
            }
        }

        /* Order Details */
        .order-details {
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #ff6b47;
            margin-bottom: 1rem;
            border-bottom: 3px solid #ff6b47;
            padding-bottom: 0.5rem;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 50px;
            height: 3px;
            background: #4CAF50;
            animation: titleUnderline 2s ease-in-out infinite;
        }

        @keyframes titleUnderline {
            0%, 100% { width: 50px; }
            50% { width: 100px; }
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding: 0.8rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            border-left: 4px solid #ff6b47;
            transition: all 0.3s ease;
        }

        .detail-row:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .detail-label {
            font-weight: 500;
            color: #ccc;
        }

        .detail-value {
            font-weight: 600;
            color: #fff;
        }

        /* Delivery Tracking Enhanced */
        .tracking-container {
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 1.5rem;
        }

        .tracking-steps {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin: 2rem 0;
        }

        .tracking-steps::before {
            content: '';
            position: absolute;
            top: 25px;
            left: 25px;
            right: 25px;
            height: 4px;
            background: #333;
            border-radius: 2px;
            z-index: 1;
        }

        .tracking-steps::after {
            content: '';
            position: absolute;
            top: 25px;
            left: 25px;
            width: 25%;
            height: 4px;
            background: linear-gradient(90deg, #4CAF50, #45a049);
            border-radius: 2px;
            z-index: 2;
            animation: trackingProgress 10s ease-in-out infinite;
        }

        @keyframes trackingProgress {
            0% { width: 25%; }
            25% { width: 50%; }
            50% { width: 75%; }
            75% { width: 100%; }
            100% { width: 100%; }
        }

        .step {
            position: relative;
            z-index: 3;
            text-align: center;
            width: 60px;
        }

        .step-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin: 0 auto 0.5rem;
            transition: all 0.5s ease;
            border: 3px solid transparent;
        }

        .step.active .step-icon {
            background: linear-gradient(45deg, #4CAF50, #45a049);
            border-color: #4CAF50;
            box-shadow: 0 0 20px rgba(76, 175, 80, 0.6);
            animation: stepPulse 2s ease-in-out infinite;
        }

        @keyframes stepPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .step.completed .step-icon {
            background: #4CAF50;
            border-color: #4CAF50;
        }

        .step-label {
            font-size: 0.9rem;
            color: #ccc;
            white-space: nowrap;
            font-weight: 500;
        }

        .step.active .step-label {
            color: #4CAF50;
            font-weight: 600;
        }

        /* Action Buttons Enhanced */
        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 15px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: linear-gradient(45deg, #ff6b47, #e55a3a);
            color: white;
            box-shadow: 0 8px 25px rgba(255, 107, 71, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(255, 107, 71, 0.6);
        }

        .btn-secondary {
            background: transparent;
            color: #ff6b47;
            border: 2px solid #ff6b47;
        }

        .btn-secondary:hover {
            background: rgba(255, 107, 71, 0.1);
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(255, 107, 71, 0.3);
        }

        /* Floating Elements */
        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            pointer-events: none;
            overflow: hidden;
        }

        .floating-emoji {
            position: absolute;
            font-size: 2rem;
            animation: floatingEmoji 8s ease-in-out infinite;
            opacity: 0.6;
        }

        .floating-emoji:nth-child(1) { left: 10%; animation-delay: 0s; }
        .floating-emoji:nth-child(2) { left: 30%; animation-delay: 2s; }
        .floating-emoji:nth-child(3) { left: 50%; animation-delay: 4s; }
        .floating-emoji:nth-child(4) { left: 70%; animation-delay: 6s; }
        .floating-emoji:nth-child(5) { left: 90%; animation-delay: 1s; }

        @keyframes floatingEmoji {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 0.6;
            }
            90% {
                opacity: 0.6;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .animation-container {
                height: 250px;
            }
            
            .scooty {
                font-size: 3rem;
            }
            
            .chart-container {
                position: static;
                margin: 1rem auto;
                max-width: 200px;
            }
            
            .confirmation-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .confirmation-title {
                font-size: 2rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .tracking-steps {
                flex-direction: column;
                align-items: center;
                gap: 1.5rem;
            }
            
            .tracking-steps::before,
            .tracking-steps::after {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Floating Elements -->
    <div class="floating-elements">
        <div class="floating-emoji">🎉</div>
        <div class="floating-emoji">🍕</div>
        <div class="floating-emoji">✨</div>
        <div class="floating-emoji">🎊</div>
        <div class="floating-emoji">🥳</div>
    </div>

    <!-- Header Section -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="auth-buttons" id="authButtons">
                    <button disabled class="auth-btn">Sign In</a></button>
                    <button disabled class="auth-btn">Sign Up</a></button>
                </div>
                <a href="index.html" class="logo">Foodie Hub</a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main">
        <div class="container">
            <!-- Animation Section -->
            <div class="animation-container">
                <!-- Buildings Background -->
                <div class="buildings"></div>
                
                <!-- Road -->
                <div class="road"></div>
                
                <!-- Scooty Animation -->
                <div class="scooty-container">
                    <div class="delivery-man">👨‍🍳</div>
                    <div class="scooty">🛵</div>
                    <div class="food-box">📦</div>
                </div>
                
                <!-- Chart with Man -->
                <div class="chart-container">
                    <div class="chart-man">👨‍💼</div>
                    <div class="chart-content">
                        <div class="chart-title">Order Confirmed!</div>
                        <div>Status: ✅ Success</div>
                        <div>ETA: 30 mins</div>
                    </div>
                </div>
            </div>

            <!-- Confirmation Container -->
            <div class="confirmation-container">
                <div class="confirmation-header">
                    <div class="success-icon">🎉</div>
                    <h1 class="confirmation-title">Order Placed Successfully!</h1>
                    <p class="confirmation-subtitle">Your delicious food is on its way! Our delivery partner is getting ready to bring your order.</p>
                    
                </div>


                <div class="tracking-container">
                    <h2 class="section-title">🚚 Live Tracking</h2>
                    <div class="tracking-steps" id="trackingSteps">
                        <div class="step completed">
                            <div class="step-icon">✅</div>
                            <div class="step-label">Order Placed</div>
                        </div>
                        <div class="step active">
                            <div class="step-icon">👨‍🍳</div>
                            <div class="step-label">Preparing</div>
                        </div>
                        <div class="step">
                            <div class="step-icon">🛵</div>
                            <div class="step-label">On the Way</div>
                        </div>
                        <div class="step">
                            <div class="step-icon">🏠</div>
                            <div class="step-label">Delivered</div>
                        </div>
                    </div>
                    <div class="tracking-info" style="text-align: center; margin-top: 1rem;">
                        <div style="font-size: 1.2rem; font-weight: 600; color: #4CAF50; margin-bottom: 0.5rem;">
                            🍳 Your food is being prepared with love!
                        </div>
                        <div style="color: #ccc;">
                            Estimated delivery time: 25-35 minutes
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <a href="#" class="btn btn-primary" onclick="trackOrder()">📱 Track Live</a>
                    <a href="<%=request.getContextPath()+"/home"%>" class="btn btn-secondary">🏠 Order More</a>
                </div>
            </div>
        </div>
    </main>

    <script>
        // Initialize animations
        document.addEventListener('DOMContentLoaded', function() {
            // Start tracking simulation
            setTimeout(() => {
                updateTrackingStep(2); // On the way
            }, 8000);
            
            setTimeout(() => {
                updateTrackingStep(3); // Delivered
            }, 16000);
        });

        // Update tracking step
        function updateTrackingStep(stepIndex) {
            const steps = document.querySelectorAll('.step');
            
            // Remove active from all steps
            steps.forEach(step => step.classList.remove('active'));
            
            // Add completed to previous steps and active to current
            steps.forEach((step, index) => {
                if (index < stepIndex) {
                    step.classList.add('completed');
                } else if (index === stepIndex) {
                    step.classList.add('active');
                }
            });
            
            // Update status messages
            const messages = [
                '✅ Order confirmed and received!',
                '👨‍🍳 Your food is being prepared with love!',
                '🛵 Your order is on the way!',
                '🎉 Order delivered successfully!'
            ];
            
            const trackingInfo = document.querySelector('.tracking-info div');
            if (trackingInfo && messages[stepIndex]) {
                trackingInfo.textContent = messages[stepIndex];
            }
        }

        // Track order function
        function trackOrder() {
            alert('🚀 Opening live tracking... You can see your delivery partner\'s location in real-time!');
        }

        // Add some interactive effects
        document.addEventListener('click', function(e) {
            // Create ripple effect
            const ripple = document.createElement('div');
            ripple.style.cssText = `
                position: fixed;
                border-radius: 50%;
                background: rgba(255, 107, 71, 0.6);
                transform: scale(0);
                animation: ripple 0.6s linear;
                pointer-events: none;
                z-index: 9999;
            `;
            
            const size = 60;
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = (e.clientX - size / 2) + 'px';
            ripple.style.top = (e.clientY - size / 2) + 'px';
            
            document.body.appendChild(ripple);
            
            setTimeout(() => {
                document.body.removeChild(ripple);
            }, 600);
        });

        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>