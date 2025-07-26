<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

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
        
        html, body {
            height: 100vh;
            overflow: hidden;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            color: #ffffff;
            background: #1a1a1a;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        
        /* Food Delivery App Background */
        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -3;
            background: linear-gradient(135deg, #ff6b47 0%, #fd79a8 30%, #fdcb6e 60%, #1a1a1a 100%);
        }
        
        .background-slideshow {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0.3;
        }
        
        .bg-slide {
            position: absolute;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0;
            transition: opacity 3s ease-in-out;
            animation: backgroundMove 25s ease-in-out infinite;
        }
        
        .bg-slide.active {
            opacity: 1;
        }
        
        .bg-slide:nth-child(1) {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="1080" viewBox="0 0 1920 1080"><rect width="1920" height="1080" fill="%23ff6b47"/><text x="960" y="540" font-family="Arial" font-size="72" fill="white" text-anchor="middle" dominant-baseline="middle">🍕📱 Welcome Back to Foodie Hub</text></svg>');
            animation-delay: 0s;
        }
        
        .bg-slide:nth-child(2) {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="1080" viewBox="0 0 1920 1080"><rect width="1920" height="1080" fill="%23fd79a8"/><text x="960" y="540" font-family="Arial" font-size="72" fill="white" text-anchor="middle" dominant-baseline="middle">🛵📲 Fast Delivery Awaits</text></svg>');
            animation-delay: 6s;
        }
        
        .bg-slide:nth-child(3) {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="1080" viewBox="0 0 1920 1080"><rect width="1920" height="1080" fill="%23fdcb6e"/><text x="960" y="540" font-family="Arial" font-size="72" fill="white" text-anchor="middle" dominant-baseline="middle">🍔💻 Sign In to Order</text></svg>');
            animation-delay: 12s;
        }
        
        .bg-slide:nth-child(4) {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="1080" viewBox="0 0 1920 1080"><rect width="1920" height="1080" fill="%23ff6b47"/><text x="960" y="540" font-family="Arial" font-size="72" fill="white" text-anchor="middle" dominant-baseline="middle">🥡📱 Your Food Journey Continues</text></svg>');
            animation-delay: 18s;
        }
        
        @keyframes backgroundMove {
            0%, 100% { transform: scale(1) rotate(0deg); }
            25% { transform: scale(1.1) rotate(1deg); }
            50% { transform: scale(1.05) rotate(-0.5deg); }
            75% { transform: scale(1.08) rotate(0.5deg); }
        }
        
        /* Interactive Delivery Animations */
        .delivery-animations {
            position: fixed;
            width: 100vw;
            height: 100vh;
            pointer-events: none;
            z-index: -2;
        }
        
        .delivery-element {
            position: absolute;
            font-size: clamp(1.5rem, 4vw, 2.5rem);
            opacity: 0.2;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .delivery-bike {
            bottom: 15%;
            left: -8%;
            animation: bikeDelivery 20s linear infinite;
        }
        
        .delivery-scooter {
            top: 25%;
            right: -8%;
            animation: scooterDelivery 25s linear infinite reverse;
        }
        
        .delivery-car {
            bottom: 35%;
            left: -10%;
            animation: carDelivery 30s linear infinite;
        }
        
        .floating-pizza {
            top: 10%;
            left: 15%;
            animation: pizzaFloat 12s ease-in-out infinite;
        }
        
        .floating-burger {
            top: 20%;
            right: 20%;
            animation: burgerBounce 10s ease-in-out infinite;
        }
        
        .floating-noodles {
            bottom: 20%;
            right: 15%;
            animation: noodlesSwirl 14s ease-in-out infinite;
        }
        
        .floating-taco {
            top: 60%;
            left: 10%;
            animation: tacoWiggle 8s ease-in-out infinite;
        }
        
        @keyframes bikeDelivery {
            0% { left: -8%; transform: translateY(0px) rotate(0deg); }
            25% { left: 25%; transform: translateY(-30px) rotate(5deg); }
            50% { left: 50%; transform: translateY(-15px) rotate(-3deg); }
            75% { left: 75%; transform: translateY(-25px) rotate(2deg); }
            100% { left: 108%; transform: translateY(0px) rotate(0deg); }
        }
        
        @keyframes scooterDelivery {
            0% { right: -8%; transform: translateY(0px) rotate(0deg); }
            30% { right: 30%; transform: translateY(-20px) rotate(-5deg); }
            60% { right: 60%; transform: translateY(-10px) rotate(3deg); }
            100% { right: 108%; transform: translateY(0px) rotate(0deg); }
        }
        
        @keyframes carDelivery {
            0% { left: -10%; transform: translateY(0px) scale(1); }
            20% { left: 20%; transform: translateY(-15px) scale(1.1); }
            40% { left: 40%; transform: translateY(-25px) scale(1.05); }
            60% { left: 60%; transform: translateY(-10px) scale(1.08); }
            80% { left: 80%; transform: translateY(-20px) scale(1.02); }
            100% { left: 110%; transform: translateY(0px) scale(1); }
        }
        
        @keyframes pizzaFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg) scale(1); }
            25% { transform: translateY(-40px) rotate(90deg) scale(1.1); }
            50% { transform: translateY(-20px) rotate(180deg) scale(1.05); }
            75% { transform: translateY(-35px) rotate(270deg) scale(1.08); }
        }
        
        @keyframes burgerBounce {
            0%, 100% { transform: translateY(0px) scale(1) rotate(0deg); }
            25% { transform: translateY(-30px) scale(1.15) rotate(5deg); }
            50% { transform: translateY(-45px) scale(1.1) rotate(-3deg); }
            75% { transform: translateY(-25px) scale(1.12) rotate(2deg); }
        }
        
        @keyframes noodlesSwirl {
            0%, 100% { transform: rotate(0deg) scale(1) translateY(0px); }
            25% { transform: rotate(90deg) scale(1.1) translateY(-20px); }
            50% { transform: rotate(180deg) scale(1.05) translateY(-35px); }
            75% { transform: rotate(270deg) scale(1.08) translateY(-15px); }
        }
        
        @keyframes tacoWiggle {
            0%, 100% { transform: rotate(0deg) translateX(0px) scale(1); }
            25% { transform: rotate(10deg) translateX(15px) scale(1.1); }
            50% { transform: rotate(-8deg) translateX(-10px) scale(1.05); }
            75% { transform: rotate(5deg) translateX(8px) scale(1.08); }
        }
        
        /* Overlay */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        
        /* Header */
        .header {
            background: rgba(26, 26, 26, 0.95);
            backdrop-filter: blur(15px);
            padding: clamp(0.5rem, 2vw, 0.75rem) 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            animation: slideDown 0.8s ease-out;
            flex-shrink: 0;
            width: 100%;
        }
        
        @keyframes slideDown {
            from { transform: translateY(-100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 clamp(0.5rem, 3vw, 1rem);
            width: 100%;
        }
        
        .logo {
            font-size: clamp(1.2rem, 4vw, 1.6rem);
            font-weight: bold;
            color: #ff6b47;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            animation: logoGlow 3s ease-in-out infinite alternate;
        }
        
        @keyframes logoGlow {
            from { filter: drop-shadow(0 0 5px rgba(255, 107, 71, 0.5)); }
            to { filter: drop-shadow(0 0 15px rgba(255, 107, 71, 0.8)); }
        }
        
        .logo:hover {
            transform: scale(1.05);
        }
        
        .back-btn {
            background: rgba(255, 107, 71, 0.2);
            color: #ff6b47;
            border: 1px solid #ff6b47;
            padding: clamp(0.4rem, 2vw, 0.5rem) clamp(0.8rem, 3vw, 1rem);
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            font-size: clamp(0.7rem, 2.5vw, 0.85rem);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .back-btn:hover {
            background: #ff6b47;
            color: white;
            transform: translateY(-2px);
        }
        
        /* Main Container */
        .main-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: clamp(0.5rem, 3vw, 1rem);
            min-height: 0;
            width: 100%;
            overflow: hidden;
        }
        
        .signin-wrapper {
            display: flex;
            width: 100%;
            max-width: clamp(320px, 90vw, 850px);
            height: calc(100vh - clamp(80px, 15vh, 100px));
            background: rgba(42, 42, 42, 0.95);
            backdrop-filter: blur(20px);
            border-radius: clamp(12px, 3vw, 16px);
            overflow: hidden;
            box-shadow:
                0 20px 40px rgba(0,0,0,0.5),
                0 0 0 1px rgba(255,255,255,0.1);
            animation: containerSlideIn 1s ease-out;
            position: relative;
        }
        
        .signin-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.05), transparent);
            animation: shimmer 4s infinite;
        }
        
        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }
        
        @keyframes containerSlideIn {
            from { opacity: 0; transform: scale(0.95) translateY(20px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }
        
        /* Left Panel - Branding */
        .left-panel {
            flex: 1;
            background: linear-gradient(135deg, rgba(255, 107, 71, 0.9), rgba(253, 121, 168, 0.9));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: clamp(1rem, 4vw, 1.5rem);
            position: relative;
            overflow: hidden;
        }
        
        .left-panel::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="400" height="600" viewBox="0 0 400 600"><rect width="400" height="600" fill="%23ff6b47"/><text x="200" y="300" font-family="Arial" font-size="48" fill="white" text-anchor="middle" dominant-baseline="middle">📱🍕 Welcome Back</text></svg>');
            background-size: cover;
            background-position: center;
            opacity: 0.15;
            animation: panelFloat 15s ease-in-out infinite;
        }
        
        @keyframes panelFloat {
            0%, 100% { transform: scale(1) rotate(0deg); }
            50% { transform: scale(1.05) rotate(1deg); }
        }
        
        .brand-content {
            position: relative;
            z-index: 2;
        }
        
        .brand-title {
            font-size: clamp(1.2rem, 5vw, 2rem);
            font-weight: bold;
            color: white;
            margin-bottom: clamp(0.5rem, 2vw, 0.8rem);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            animation: titlePulse 3s ease-in-out infinite alternate;
        }
        
        @keyframes titlePulse {
            from { transform: scale(1); }
            to { transform: scale(1.02); }
        }
        
        .brand-subtitle {
            font-size: clamp(0.8rem, 3vw, 1rem);
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: clamp(0.8rem, 3vw, 1.2rem);
            animation: fadeInUp 1s ease-out 0.5s both;
        }
        
        .brand-features {
            list-style: none;
            text-align: left;
            animation: fadeInUp 1s ease-out 1s both;
        }
        
        .brand-features li {
            color: rgba(255, 255, 255, 0.85);
            margin-bottom: clamp(0.4rem, 2vw, 0.6rem);
            display: flex;
            align-items: center;
            gap: clamp(0.4rem, 2vw, 0.6rem);
            padding: clamp(0.2rem, 1vw, 0.3rem);
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            font-size: clamp(0.7rem, 2.5vw, 0.85rem);
        }
        
        .brand-features li:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }
        
        .brand-features li::before {
            content: "✨";
            font-size: clamp(0.7rem, 2vw, 0.9rem);
        }
        
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Right Panel - Form */
        .right-panel {
            flex: 1;
            padding: clamp(1rem, 4vw, 1.5rem);
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow-y: auto;
            max-height: 100%;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: clamp(1rem, 4vw, 1.5rem);
        }
        
        .form-title {
            font-size: clamp(1.2rem, 5vw, 1.8rem);
            font-weight: bold;
            background: linear-gradient(45deg, #ff6b47, #fd79a8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: clamp(0.3rem, 1vw, 0.4rem);
            animation: titleGlow 2s ease-in-out infinite alternate;
        }
        
        @keyframes titleGlow {
            from { filter: drop-shadow(0 0 3px rgba(255, 107, 71, 0.3)); }
            to { filter: drop-shadow(0 0 8px rgba(255, 107, 71, 0.6)); }
        }
        
        .form-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-size: clamp(0.8rem, 2.5vw, 0.9rem);
        }
        
        .form-group {
            margin-bottom: clamp(1rem, 3vw, 1.2rem);
        }
        
        .form-group label {
            display: block;
            margin-bottom: clamp(0.3rem, 1vw, 0.4rem);
            font-weight: 600;
            color: #fff;
            font-size: clamp(0.8rem, 2.5vw, 0.9rem);
        }
        
        .input-container {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: clamp(10px, 3vw, 12px);
            top: 50%;
            transform: translateY(-50%);
            font-size: clamp(0.9rem, 2.5vw, 1rem);
            color: rgba(255, 255, 255, 0.6);
            transition: all 0.3s ease;
            z-index: 2;
        }
        
        .form-control {
            width: 100%;
            padding: clamp(0.7rem, 3vw, 0.8rem) clamp(0.7rem, 3vw, 0.8rem) clamp(0.7rem, 3vw, 0.8rem) clamp(2.2rem, 6vw, 2.5rem);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: clamp(8px, 2vw, 10px);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            transition: all 0.3s ease;
            font-size: clamp(0.8rem, 2.5vw, 0.9rem);
            backdrop-filter: blur(10px);
            box-sizing: border-box;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #ff6b47;
            box-shadow: 0 0 15px rgba(255, 107, 71, 0.3);
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-1px);
        }
        
        .form-control:focus + .input-icon {
            color: #ff6b47;
            transform: translateY(-50%) scale(1.1);
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }
        
        .password-toggle {
            position: absolute;
            right: clamp(10px, 3vw, 12px);
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: rgba(255, 255, 255, 0.6);
            cursor: pointer;
            font-size: clamp(0.9rem, 2.5vw, 1rem);
            transition: all 0.3s ease;
            z-index: 2;
        }
        
        .password-toggle:hover {
            color: #ff6b47;
            transform: translateY(-50%) scale(1.1);
        }
        
        .form-check {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: clamp(1rem, 3vw, 1.2rem);
            font-size: clamp(0.75rem, 2vw, 0.85rem);
            flex-wrap: wrap;
            gap: 0.5rem;
        }
        
        .form-check-left {
            display: flex;
            align-items: center;
            gap: clamp(0.3rem, 1vw, 0.4rem);
        }
        
        .form-check-input {
            width: clamp(14px, 3vw, 16px);
            height: clamp(14px, 3vw, 16px);
            accent-color: #ff6b47;
        }
        
        .form-check-label {
            color: rgba(255, 255, 255, 0.8);
        }
        
        .forgot-password {
            color: #ff6b47;
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            font-size: clamp(0.75rem, 2vw, 0.85rem);
        }
        
        .forgot-password::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: #fd79a8;
            transition: width 0.3s ease;
        }
        
        .forgot-password:hover::after {
            width: 100%;
        }
        
        .forgot-password:hover {
            color: #fd79a8;
        }
        
        .btn-primary {
            width: 100%;
            padding: clamp(0.8rem, 3vw, 1rem);
            background: linear-gradient(45deg, #ff6b47, #fd79a8);
            color: white;
            border: none;
            border-radius: clamp(8px, 2vw, 10px);
            font-size: clamp(0.85rem, 2.5vw, 0.95rem);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: clamp(1rem, 3vw, 1.2rem);
            position: relative;
            overflow: hidden;
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
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #fd79a8, #fdcb6e);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(255, 107, 71, 0.4);
        }
        
        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .social-divider {
            display: flex;
            align-items: center;
            margin: clamp(0.8rem, 3vw, 1rem) 0;
            color: rgba(255, 255, 255, 0.6);
        }
        
        .divider-line {
            flex: 1;
            height: 1px;
            background: rgba(255, 255, 255, 0.2);
        }
        
        .divider-text {
            padding: 0 clamp(0.6rem, 2vw, 0.8rem);
            font-size: clamp(0.7rem, 2vw, 0.75rem);
        }
        
        .social-buttons {
            display: flex;
            gap: clamp(0.6rem, 2vw, 0.8rem);
            margin-bottom: clamp(1rem, 3vw, 1.2rem);
            flex-wrap: wrap;
        }
        
        .social-btn {
            flex: 1;
            min-width: 120px;
            padding: clamp(0.6rem, 2vw, 0.7rem);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: clamp(6px, 2vw, 8px);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: clamp(0.3rem, 1vw, 0.4rem);
            font-size: clamp(0.75rem, 2vw, 0.8rem);
        }
        
        .social-btn.google:hover {
            background: rgba(219, 68, 55, 0.8);
            border-color: #DB4437;
            transform: translateY(-2px);
        }
        
        .social-btn.facebook:hover {
            background: rgba(66, 103, 178, 0.8);
            border-color: #4267B2;
            transform: translateY(-2px);
        }
        
        .auth-footer {
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: clamp(0.75rem, 2vw, 0.8rem);
        }
        
        .auth-link {
            color: #ff6b47;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .auth-link:hover {
            color: #fd79a8;
        }
        
        .loading {
            display: inline-block;
            width: clamp(16px, 4vw, 18px);
            height: clamp(16px, 4vw, 18px);
            border: 2px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        .message {
            padding: clamp(0.6rem, 2vw, 0.8rem);
            border-radius: clamp(6px, 2vw, 8px);
            margin-bottom: clamp(1rem, 3vw, 1.2rem);
            text-align: center;
            font-weight: 500;
            animation: messageSlide 0.5s ease-out;
            font-size: clamp(0.75rem, 2vw, 0.85rem);
            display: none;
        }
        
        @keyframes messageSlide {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .message.success {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid #4CAF50;
            color: #4CAF50;
        }
        
        .message.error {
            background: rgba(244, 67, 54, 0.2);
            border: 1px solid #F44336;
            color: #F44336;
        }
        
        .message.info {
            background: rgba(255, 107, 71, 0.2);
            border: 1px solid #ff6b47;
            color: #ff6b47;
        }
        
        /* RESPONSIVE DESIGN BREAKPOINTS */
        
        /* Large Desktop */
        @media (min-width: 1200px) {
            .signin-wrapper {
                max-width: 900px;
            }
        }
        
        /* Desktop */
        @media (min-width: 992px) and (max-width: 1199px) {
            .signin-wrapper {
                max-width: 800px;
            }
        }
        
        /* Tablet */
        @media (max-width: 768px) {
            .signin-wrapper {
                flex-direction: column;
                height: calc(100vh - 80px);
                max-width: 95%;
            }
            
            .left-panel {
                flex: 0.3;
                min-height: 0;
            }
            
            .brand-features {
                display: none;
            }
            
            .right-panel {
                flex: 0.7;
            }
            
            .form-check {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.8rem;
            }
            
            .social-buttons {
                flex-direction: column;
            }
            
            .social-btn {
                min-width: auto;
            }
        }
        
        /* Mobile Large */
        @media (max-width: 480px) {
            body {
                overflow-y: auto;
                overflow-x: hidden;
                height: auto;
                min-height: 100vh;
            }
            
            .main-container {
                overflow-y: auto;
                align-items: flex-start;
                padding-top: 1rem;
            }
            
            .signin-wrapper {
                height: auto;
                min-height: calc(100vh - 100px);
                border-radius: 12px;
            }
            
            .left-panel {
                flex: 0.25;
                min-height: 120px;
            }
            
            .right-panel {
                flex: 0.75;
                overflow-y: visible;
            }
            
            .form-control {
                min-height: 44px; /* Touch-friendly */
            }
            
            .btn-primary {
                min-height: 48px; /* Touch-friendly */
            }
        }
        
        /* Mobile Small */
        @media (max-width: 360px) {
            .left-panel {
                flex: 0.2;
                min-height: 100px;
            }
            
            .right-panel {
                flex: 0.8;
            }
            
            .form-check {
                font-size: 0.7rem;
            }
            
            .social-btn {
                padding: 0.8rem 0.5rem;
            }
        }
        
        /* Landscape Mobile */
        @media (max-height: 500px) and (orientation: landscape) {
            .signin-wrapper {
                flex-direction: row;
                height: calc(100vh - 60px);
            }
            
            .left-panel {
                flex: 0.4;
            }
            
            .right-panel {
                flex: 0.6;
                overflow-y: auto;
            }
            
            .brand-features {
                display: none;
            }
            
            .form-group {
                margin-bottom: 0.8rem;
            }
        }
        
        /* Custom Scrollbar */
        .right-panel::-webkit-scrollbar {
            width: 3px;
        }
        
        .right-panel::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .right-panel::-webkit-scrollbar-thumb {
            background: rgba(255, 107, 71, 0.5);
            border-radius: 2px;
        }
        
        /* High DPI Displays */
        @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
            .form-control, .btn-primary, .social-btn {
                border-width: 1px;
            }
        }
        
        /* Reduced Motion */
        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }
        
        /* Dark Mode Support */
        @media (prefers-color-scheme: dark) {
            .signin-wrapper {
                background: rgba(20, 20, 20, 0.98);
            }
        }
        
        /* Print Styles */
        @media print {
            .background-container,
            .delivery-animations,
            .overlay {
                display: none;
            }
            
            body {
                background: white;
                color: black;
            }
        }
    </style>
</head>
<body>
    <!-- Food Delivery App Background -->
    <div class="background-container">
        <div class="background-slideshow">
            <div class="bg-slide active"></div>
            <div class="bg-slide"></div>
            <div class="bg-slide"></div>
            <div class="bg-slide"></div>
        </div>
    </div>
    
    <!-- Overlay -->
    <div class="overlay"></div>
    
    <!-- Interactive Delivery Animations -->
    <div class="delivery-animations">
        <div class="delivery-element delivery-bike">🛵</div>
        <div class="delivery-element delivery-scooter">🛴</div>
        <div class="delivery-element delivery-car">🚚</div>
        <div class="delivery-element floating-pizza">🍕</div>
        <div class="delivery-element floating-burger">🍔</div>
        <div class="delivery-element floating-noodles">🍜</div>
        <div class="delivery-element floating-taco">🌮</div>
    </div>
    
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="index.html" class="back-btn">← Back to Home</a>
            <a href="index.html" class="logo">🍴 Foodie Hub</a>
            <div></div>
        </div>
    </header>
    
    <!-- Main Container -->
    <main class="main-container">
        <div class="signin-wrapper">
            <!-- Left Panel - Branding -->
            <div class="left-panel">
                <div class="brand-content">
                    <div class="brand-title">🍕 Foodie Hub</div>
                    <div class="brand-subtitle">Fast, Fresh & Delicious!</div>
                    <ul class="brand-features">
                        <li>30-min delivery guarantee</li>
                        <li>Fresh & hot meals</li>
                        <li>Live order tracking</li>
                        <li>24/7 support</li>
                    </ul>
                </div>
            </div>
            
            <!-- Right Panel - Sign In Form -->
            <div class="right-panel">
                <div class="form-header">
                    <h1 class="form-title">Welcome Back!</h1>
                    <p class="form-subtitle">Sign in to order delicious food</p>
                </div>
                
                <!-- Messages -->
                <div class="message success" id="successMessage">
                    Welcome back! Redirecting to your dashboard...
                </div>
                <div class="message error" id="errorMessage">
                    Invalid email or password. Please try again.
                </div>
                <div class="message info" id="infoMessage">
                    Please enter your credentials to continue.
                </div>
                
                <!-- Sign In Form -->
                <form id="signinForm" action="#" method="post">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <div class="input-container">
                            <span class="input-icon">📧</span>
                            <input type="email"
                                   id="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="Enter your email address"
                                   required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-container">
                            <span class="input-icon">🔒</span>
                            <input type="password"
                                   id="password"
                                   name="password"
                                   class="form-control"
                                   placeholder="Enter your password"
                                   required>
                            <button type="button" class="password-toggle" onclick="togglePassword()">
                                <span id="passwordIcon">👁️</span>
                            </button>
                        </div>
                    </div>
                    
                    <div class="form-check">
                        <div class="form-check-left">
                            <input type="checkbox"
                                   id="rememberMe"
                                   name="rememberMe"
                                   class="form-check-input">
                            <label for="rememberMe" class="form-check-label">Remember me</label>
                        </div>
                        <a href="forgot-password.html" class="forgot-password">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn-primary" id="submitBtn">
                        <span id="btnText">🚀 Sign In Now</span>
                        <span id="btnLoading" class="loading" style="display: none;"></span>
                    </button>
                </form>
                
                <div class="social-divider">
                    <div class="divider-line"></div>
                    <div class="divider-text">OR CONTINUE WITH</div>
                    <div class="divider-line"></div>
                </div>
                
                <div class="social-buttons">
                    <button class="social-btn google" onclick="signinWithGoogle()">
                        <span>🔴</span>
                        <span>Google</span>
                    </button>
                    <button class="social-btn facebook" onclick="signinWithFacebook()">
                        <span>🔵</span>
                        <span>Facebook</span>
                    </button>
                </div>
                
                <div class="auth-footer">
                    <p>New to Foodie Hub? <a href="signup.html" class="auth-link">Create Account</a></p>
                </div>
            </div>
        </div>
    </main>
    
    <script>
        // Background slideshow with food delivery app themes
        let currentSlide = 0;
        const slides = document.querySelectorAll('.bg-slide');
        
        function nextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }
        
        setInterval(nextSlide, 6000);
        
        // Interactive delivery elements
        document.querySelectorAll('.delivery-element').forEach(element => {
            element.addEventListener('mouseenter', function() {
                this.style.opacity = '0.4';
                this.style.transform += ' scale(1.2)';
            });
            
            element.addEventListener('mouseleave', function() {
                this.style.opacity = '0.2';
                this.style.transform = this.style.transform.replace(' scale(1.2)', '');
            });
        });
        
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const passwordIcon = document.getElementById('passwordIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                passwordIcon.textContent = '🙈';
            } else {
                passwordInput.type = 'password';
                passwordIcon.textContent = '👁️';
            }
        }
        
        // Enhanced form submission
        document.getElementById('signinForm').addEventListener('submit', function(e) {
            e.preventDefault(); // Prevent actual form submission for demo
            
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value;
            const submitBtn = document.getElementById('submitBtn');
            const btnText = document.getElementById('btnText');
            const btnLoading = document.getElementById('btnLoading');
            
            hideAllMessages();
            
            // Client-side validation
            if (!email || !password) {
                showMessage('error', 'Please fill in all fields');
                return false;
            }
            
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                showMessage('error', 'Please enter a valid email address');
                return false;
            }
            
            if (password.length < 6) {
                showMessage('error', 'Password must be at least 6 characters long');
                return false;
            }
            
            // Show loading state
            submitBtn.disabled = true;
            btnText.style.display = 'none';
            btnLoading.style.display = 'inline-block';
            
            // Simulate API call
            setTimeout(() => {
                // Demo success
                showMessage('success', 'Welcome back! Redirecting to your dashboard...');
                
                // Reset form after demo
                setTimeout(() => {
                    submitBtn.disabled = false;
                    btnText.style.display = 'inline';
                    btnLoading.style.display = 'none';
                    hideAllMessages();
                }, 3000);
            }, 2000);
            
            return false;
        });
        
        function signinWithGoogle() {
            showNotification('Redirecting to Google Sign In... 🔴', 'info');
        }
        
        function signinWithFacebook() {
            showNotification('Redirecting to Facebook Sign In... 🔵', 'info');
        }
        
        function hideAllMessages() {
            document.querySelectorAll('.message').forEach(msg => {
                msg.style.display = 'none';
            });
        }
        
        function showMessage(type, text) {
            hideAllMessages();
            const messageElement = document.getElementById(type + 'Message');
            if (messageElement) {
                messageElement.textContent = text;
                messageElement.style.display = 'block';
            }
        }
        
        function showNotification(message, type = 'success') {
            const notification = document.createElement('div');
            const colors = {
                error: '#e74c3c',
                success: '#4CAF50',
                info: '#ff6b47'
            };
            
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${colors[type]};
                color: white;
                padding: 1rem 1.5rem;
                border-radius: 10px;
                z-index: 10001;
                font-weight: 600;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                transform: translateX(100%);
                transition: transform 0.3s ease;
                max-width: 300px;
                backdrop-filter: blur(10px);
                font-size: 0.9rem;
            `;
            notification.textContent = message;
            
            document.body.appendChild(notification);
            
            setTimeout(() => notification.style.transform = 'translateX(0)', 100);
            
            setTimeout(() => {
                notification.style.transform = 'translateX(100%)';
                setTimeout(() => document.body.contains(notification) && document.body.removeChild(notification), 300);
            }, 4000);
        }
        
        // Real-time email validation
        document.getElementById('email').addEventListener('input', function() {
            const email = this.value.trim();
            if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                this.style.borderColor = '#e74c3c';
                this.style.boxShadow = '0 0 10px rgba(231, 76, 60, 0.3)';
            } else if (email) {
                this.style.borderColor = '#4CAF50';
                this.style.boxShadow = '0 0 10px rgba(76, 175, 80, 0.3)';
            } else {
                this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                this.style.boxShadow = 'none';
            }
        });
        
        // Interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Form control hover effects
            document.querySelectorAll('.form-control').forEach(control => {
                control.addEventListener('focus', function() {
                    this.style.transform = 'translateY(-1px)';
                });
                
                control.addEventListener('blur', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
            
            // Button click effects
            document.querySelectorAll('.btn-primary, .social-btn').forEach(button => {
                button.addEventListener('mousedown', function() {
                    this.style.transform = 'scale(0.98)';
                });
                
                button.addEventListener('mouseup', function() {
                    this.style.transform = 'scale(1)';
                });
            });
            
            // Welcome message
            setTimeout(() => {
                showNotification('Welcome to Foodie Hub! 🍕🚚', 'info');
            }, 2000);
        });
        
        // Handle window resize
        window.addEventListener('resize', function() {
            // Adjust layout if needed
            const wrapper = document.querySelector('.signin-wrapper');
            if (window.innerWidth <= 768) {
                wrapper.style.flexDirection = 'column';
            } else {
                wrapper.style.flexDirection = 'row';
            }
        });
        
        // Touch device optimizations
        if ('ontouchstart' in window) {
            document.body.classList.add('touch-device');
            
            // Improve touch interactions
            document.querySelectorAll('.form-control, .btn-primary, .social-btn').forEach(element => {
                element.style.minHeight = '44px';
            });
        }
    </script>
</body>
</html>