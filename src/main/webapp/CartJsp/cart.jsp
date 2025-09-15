<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.Cart,model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Foodie Hub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            color: white;
            line-height: 1.6;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* Header */
        .header {
            background: rgba(51, 51, 51, 0.9);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }
        
        .header:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.4);
        }
        
        .logo {
            font-size: 2.2rem;
            font-weight: bold;
            color: #ff6b47;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease;
        }
        
        .logo:hover {
            transform: scale(1.05);
            color: #ff8a6b;
        }
        
        .nav-links {
            display: flex;
            gap: 1rem;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 0.8rem 1.5rem;
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 600;
            position: relative;
            overflow: hidden;
        }
        
        .nav-links a:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 107, 71, 0.4);
        }
        
        /* Cart Header */
        .cart-header {
            background: linear-gradient(135deg, rgba(51, 51, 51, 0.9), rgba(42, 42, 42, 0.9));
            backdrop-filter: blur(15px);
            padding: 2rem;
            border-radius: 20px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 107, 71, 0.2);
        }
        
        .cart-title {
            font-size: 2.5rem;
            color: #ff6b47;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }
        
        .cart-subtitle {
            color: #ccc;
            font-size: 1.2rem;
        }
        
        /* Add More Items Button */
        .add-more-section {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .add-more-btn {
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            color: white;
            text-decoration: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }
        
        .add-more-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ff8a6b, #ffab8a);
            transition: left 0.3s ease;
            z-index: -1;
        }
        
        .add-more-btn:hover::before {
            left: 0;
        }
        
        .add-more-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 30px rgba(255, 107, 71, 0.4);
        }
        
        /* Cart Content */
        .cart-content {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
        }
        
        /* Cart Items Section */
        .cart-items {
            background: linear-gradient(135deg, rgba(51, 51, 51, 0.9), rgba(42, 42, 42, 0.9));
            backdrop-filter: blur(15px);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 107, 71, 0.1);
        }
        
        .section-title {
            font-size: 1.8rem;
            color: #ff6b47;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        /* Individual Cart Item */
        .cart-item {
            background: linear-gradient(135deg, rgba(26, 26, 26, 0.9), rgba(35, 35, 35, 0.9));
            padding: 1.5rem;
            border-radius: 15px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 107, 71, 0.1);
            position: relative;
            overflow: hidden;
        }
        
        .cart-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255, 107, 71, 0.1), rgba(255, 138, 107, 0.1));
            transition: left 0.4s ease;
            z-index: 0;
        }
        
        .cart-item:hover::before {
            left: 0;
        }
        
        .cart-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(255, 107, 71, 0.2);
            border-color: #ff6b47;
        }
        
        .cart-item > * {
            position: relative;
            z-index: 1;
        }
        
        /* FIXED: Proper image sizing to prevent full screen occupation */
        .item-image {
            width: 80px !important;
            height: 80px !important;
            min-width: 80px;
            min-height: 80px;
            max-width: 80px;
            max-height: 80px;
            border-radius: 10px;
            object-fit: cover;
            border: 2px solid #ff6b47;
            flex-shrink: 0;
            display: block;
            background: #333;
        }
        
        /* Fallback for broken images */
        .item-image:not([src]), 
        .item-image[src="/placeholder.svg"], 
        .item-image[src*="undefined"] {
            background: linear-gradient(45deg, #333, #444);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ccc;
            font-size: 0.8rem;
        }
        
        .item-image:not([src])::after, 
        .item-image[src="/placeholder.svg"]::after, 
        .item-image[src*="undefined"]::after {
            content: "🍽️";
            font-size: 2rem;
        }
        
        .item-info {
            flex: 1;
            min-width: 0; /* Prevents flex item from growing beyond container */
        }
        
        .item-name {
            font-size: 1.3rem;
            font-weight: bold;
            color: white;
            margin-bottom: 0.5rem;
            word-wrap: break-word;
        }
        
        .item-price {
            color: #4CAF50;
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 0.3rem;
        }
        
        .item-id {
            color: #ccc;
            font-size: 0.9rem;
        }
        
        /* Quantity Controls */
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin: 0 1rem;
            flex-shrink: 0;
        }
        
        .qty-btn {
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            color: white;
            border: none;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: bold;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .qty-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 5px 15px rgba(255, 107, 71, 0.4);
        }
        
        .quantity {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid #ff6b47;
            padding: 0.5rem 1rem;
            border-radius: 10px;
            text-align: center;
            font-weight: bold;
            min-width: 60px;
            max-width: 60px;
        }
        
        /* Remove Button */
        .remove-btn {
            background: linear-gradient(45deg, #ff4757, #ff6b7a);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            flex-shrink: 0;
        }
        
        .remove-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 71, 87, 0.4);
        }
        
        /* Order Summary */
        .order-summary {
            background: linear-gradient(135deg, rgba(51, 51, 51, 0.9), rgba(42, 42, 42, 0.9));
            backdrop-filter: blur(15px);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 107, 71, 0.1);
            height: fit-content;
            position: sticky;
            top: 20px;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding: 0.5rem 0;
        }
        
        .summary-row.total {
            border-top: 2px solid #ff6b47;
            padding-top: 1rem;
            font-size: 1.3rem;
            font-weight: bold;
            color: #4CAF50;
        }
        
        .summary-label {
            color: #ccc;
        }
        
        .summary-value {
            color: white;
            font-weight: bold;
        }
        
        /* Checkout Button */
        .checkout-btn {
            width: 100%;
            background: linear-gradient(45deg, #4CAF50, #66BB6A);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 15px;
            font-size: 1.2rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            position: relative;
            overflow: hidden;
        }
        
        .checkout-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            background: #666;
        }
        
        .checkout-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #66BB6A, #81C784);
            transition: left 0.3s ease;
            z-index: -1;
        }
        
        .checkout-btn:hover:not(:disabled)::before {
            left: 0;
        }
        
        .checkout-btn:hover:not(:disabled) {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(76, 175, 80, 0.4);
        }
        
        /* Empty Cart */
        .empty-cart {
            text-align: center;
            padding: 3rem;
            color: #ccc;
        }
        
        .empty-cart-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #ff6b47;
        }
        
        .empty-cart h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .continue-shopping {
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            color: white;
            text-decoration: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 1rem;
        }
        
        .continue-shopping:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 107, 71, 0.4);
        }
        
        /* Form styling */
        .cart-form {
            display: inline;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .cart-content {
                grid-template-columns: 1fr;
            }
            
            .cart-item {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }
            
            .quantity-controls {
                margin: 0;
            }
            
            .nav-links {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .cart-title {
                font-size: 2rem;
            }
            
            /* Ensure images stay small on mobile too */
            .item-image {
                width: 60px !important;
                height: 60px !important;
                min-width: 60px;
                min-height: 60px;
                max-width: 60px;
                max-height: 60px;
            }
        }
        
        /* Animation for cart items */
        .cart-item {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease forwards;
        }
        
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .cart-item:nth-child(1) { animation-delay: 0.1s; }
        .cart-item:nth-child(2) { animation-delay: 0.2s; }
        .cart-item:nth-child(3) { animation-delay: 0.3s; }
        .cart-item:nth-child(4) { animation-delay: 0.4s; }
        .cart-item:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="logo">🍴 Foodie Hub</div>
            <div class="nav-links">
                <a href="<%=request.getContextPath()%>/home">← Back to Home</a>
                <a href="../login.jsp">Login</a>
            </div>
        </div>

        <!-- Cart Header -->
        <div class="cart-header">
            <h1 class="cart-title">🛒 Your Cart</h1>
            <p class="cart-subtitle">Review your items before checkout</p>
        </div>

        <!-- Add More Items Section -->
        <div class="add-more-section">
            <a href="<%=request.getContextPath()%>/menu?RestaruntId=<%=session.getAttribute("Restarunt_Id")%>" class="add-more-btn" style="display: block; text-align: center; margin: 1rem 0;" class="add-more-btn">
                ➕ Add More Items
            </a>
        </div>

        <!-- Cart Content -->
        <div class="cart-content">
            <!-- Cart Items Section -->
            <div class="cart-items">
                <h2 class="section-title">Cart Items</h2>
                <%
                    // Get cart items using your static Cart.getItems() method
                    Map<Integer, CartItem> cartItems = Cart.getItems();
                    double subtotal = 0.0;
                    if(cartItems != null && !cartItems.isEmpty()) {
                        for(CartItem item : cartItems.values()) {
                            subtotal += item.getPrice() * item.getQuantity();
                %>
                <!-- Cart Item -->
                <div class="cart-item">
                    <!-- FIXED: Proper img tag structure -->
                    <img src="<%=item.getImagePath()%>" alt="<%=item.getName()%>" class="item-image" 
                         onerror="this.style.display='flex'; this.innerHTML='🍽️';">
                    
                    <div class="item-info">
                        <div class="item-name"><%=item.getName()%></div>
                        <div class="item-price">₹<%=String.format("%.2f", item.getPrice())%></div>
                        <div class="item-id">Item ID: <%=item.getId()%></div>
                    </div>
                    
                    <!-- Quantity Controls with Forms -->
                    <div class="quantity-controls">
                        <!-- Decrease Quantity Form -->
                        <form action="<%=request.getContextPath()%>/cart" method="get" class="cart-form">
                            <input type="hidden" name="Action" value="update">
                            <input type="hidden" name="Menu_Id" value="<%=item.getId()%>">
                            <input type="hidden" name="Quantity" value="<%=item.getQuantity()-1%>">
                            <input type="hidden" name="Restarunt_Id" value="<%=session.getAttribute("Restarunt_Id")%>">
                            <button type="submit" class="qty-btn">-</button>
                        </form>
                        
                        <input type="text" class="quantity" value="<%=item.getQuantity()%>" readonly>
                        
                        <!-- Increase Quantity Form -->
                        <form action="<%=request.getContextPath()%>/cart" method="get" class="cart-form">
                            <input type="hidden" name="Action" value="update">
                            <input type="hidden" name="Menu_Id" value="<%=item.getId()%>">
                            <input type="hidden" name="Quantity" value="<%=item.getQuantity()+1%>">
                            <input type="hidden" name="Restarunt_Id" value="<%=session.getAttribute("Restarunt_Id")%>">
                            <button type="submit" class="qty-btn">+</button>
                        </form>
                    </div>
                    
                    <!-- Remove Item Form -->
                    <form action="<%=request.getContextPath()%>/cart" method="get" class="cart-form">
                        <input type="hidden" name="Action" value="delete">
                        <input type="hidden" name="Menu_Id" value="<%=item.getId()%>">
                        <input type="hidden" name="Restarunt_Id" value="<%=session.getAttribute("Restarunt_Id")%>">
                        <button type="submit" class="remove-btn"
                                onclick="return confirm('Are you sure you want to remove this item?')">
                            Remove
                        </button>
                    </form>
                </div>
                <%
                        }
                    } else {
                %>
                <!-- Empty Cart Message -->
                <div class="empty-cart">
                    <div class="empty-cart-icon">🛒</div>
                    <h3>Your cart is empty</h3>
                    <p>Add some delicious items to get started!</p>
                    <a href="<%=request.getContextPath()%>/home" class="continue-shopping">Start Shopping</a>
                </div>
                <%
                    }
                %>
            </div>

            <!-- Order Summary -->
            <div class="order-summary">
                <h2 class="section-title">Order Summary</h2>
                <%
                    if(cartItems != null && !cartItems.isEmpty()) {
                        double deliveryFee = 20.99;
                        double taxRate = 0.08; // 8% tax
                        double tax = subtotal * taxRate;
                        double total = subtotal + deliveryFee + tax;
                %>
                <div class="summary-row">
                    <span class="summary-label">Items (<%=cartItems.size()%>):</span>
                    <span class="summary-value">₹<%=String.format("%.2f", subtotal)%></span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Delivery Fee:</span>
                    <span class="summary-value">₹<%=String.format("%.2f", deliveryFee)%></span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Tax (8%):</span>
                    <span class="summary-value">₹<%=String.format("%.2f", tax)%></span>
                </div>
                <div class="summary-row total">
                    <span class="summary-label">Total:</span>
                    <span class="summary-value">₹<%=String.format("%.2f", total)%></span>
                </div>
                
                <!-- Add More Items Button in Summary -->
                <a href="<%=request.getContextPath()%>/menu?RestaruntId=<%=session.getAttribute("Restarunt_Id")%>" class="add-more-btn" style="display: block; text-align: center; margin: 1rem 0;">
                    ➕ Add More Items
                </a>
                
                <!-- Checkout Form -->
                <form action="<%=request.getContextPath()%>/CheckOutJsp/checkout.jsp" method="post">
                    <input type="hidden" name="totalAmount" value="<%=total%>">
                    <input type="hidden" name="subtotal" value="<%=subtotal%>">
                    <input type="hidden" name="tax" value="<%=tax%>">
                    <input type="hidden" name="deliveryFee" value="<%=deliveryFee%>">
                    <button type="submit" class="checkout-btn">
                        Proceed to Checkout 🚀
                    </button>
                </form>
                <%
                    } else {
                %>
                <div class="summary-row">
                    <span class="summary-label">Items (0):</span>
                    <span class="summary-value">₹0.00</span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Delivery Fee:</span>
                    <span class="summary-value">₹20.99</span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Tax:</span>
                    <span class="summary-value">₹0.00</span>
                </div>
                <div class="summary-row total">
                    <span class="summary-label">Total:</span>
                    <span class="summary-value">₹0.00</span>
                </div>
                
                <!-- Add Items Button for Empty Cart -->
                <a href="../menu.jsp" class="add-more-btn" style="display: block; text-align: center; margin: 1rem 0;">
                    🍽️ Browse Menu
                </a>
                <button class="checkout-btn" disabled>
                    Cart is Empty
                </button>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>