<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,model.Menu,model.Restarunt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Foodie Hub</title>
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
        /* Header with animations */
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
        .nav-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ff8a6b, #ff6b47);
            transition: left 0.3s ease;
            z-index: -1;
        }
        .nav-links a:hover::before {
            left: 0;
        }
        .nav-links a:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 107, 71, 0.4);
        }
        /* Restaurant info with pulse animation - CARD IN MIDDLE */
        .restaurant-info {
            background: linear-gradient(135deg, rgba(51, 51, 51, 0.9), rgba(42, 42, 42, 0.9));
            backdrop-filter: blur(15px);
            padding: 3rem;
            border-radius: 20px;
            margin: 0 auto 3rem auto;
            max-width: 800px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 107, 71, 0.2);
            animation: pulse 3s infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 3rem;
            text-align: center;
        }
        @keyframes pulse {
            0%, 100% { box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3); }
            50% { box-shadow: 0 15px 50px rgba(255, 107, 71, 0.2); }
        }
        .restaurant-image {
            width: 200px;
            height: 200px;
            border-radius: 20px;
            object-fit: cover;
            border: 4px solid #ff6b47;
            box-shadow: 0 15px 40px rgba(255, 107, 71, 0.3);
            transition: all 0.4s ease;
            flex-shrink: 0;
        }
        .restaurant-image:hover {
            transform: scale(1.05) rotate(2deg);
            box-shadow: 0 20px 50px rgba(255, 107, 71, 0.5);
        }
        .restaurant-text {
            flex: 1;
            text-align: center;
        }
        .restaurant-name {
            font-size: 3rem;
            color: #ff6b47;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
            animation: glow 2s ease-in-out infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5), 0 0 20px rgba(255, 107, 71, 0.3); }
            to { text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5), 0 0 30px rgba(255, 107, 71, 0.6); }
        }
        .restaurant-details {
            color: #ccc;
            font-size: 1.3rem;
            font-weight: 500;
        }
        /* Menu content */
        .menu-content {
            background: linear-gradient(135deg, rgba(51, 51, 51, 0.9), rgba(42, 42, 42, 0.9));
            backdrop-filter: blur(15px);
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 107, 71, 0.1);
        }
        .menu-title {
            font-size: 2.5rem;
            color: #ff6b47;
            margin-bottom: 3rem;
            text-align: center;
            position: relative;
            padding-bottom: 1rem;
        }
        .menu-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            border-radius: 2px;
        }
        .menu-items {
            display: grid;
            gap: 2rem;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
        }
        .menu-item {
            background: linear-gradient(135deg, rgba(26, 26, 26, 0.9), rgba(35, 35, 35, 0.9));
            padding: 2rem;
            border-radius: 15px;
            display: flex;
            gap: 1.5rem;
            transition: all 0.4s ease;
            border: 1px solid rgba(255, 107, 71, 0.1);
            position: relative;
            overflow: hidden;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.6s ease forwards;
        }
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .menu-item::before {
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
        .menu-item:hover::before {
            left: 0;
        }
        .menu-item:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 50px rgba(255, 107, 71, 0.2);
            border-color: #ff6b47;
        }
        .menu-item > * {
            position: relative;
            z-index: 1;
        }
        .item-image {
            width: 120px;
            height: 120px;
            border-radius: 15px;
            object-fit: cover;
            border: 3px solid #ff6b47;
            transition: all 0.3s ease;
        }
        .menu-item:hover .item-image {
            transform: rotate(5deg) scale(1.1);
            box-shadow: 0 10px 30px rgba(255, 107, 71, 0.3);
        }
        .item-details {
            flex: 1;
        }
        .item-name {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 0.8rem;
            color: white;
            transition: color 0.3s ease;
        }
        .menu-item:hover .item-name {
            color: #ff8a6b;
        }
        .item-description {
            color: #ccc;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        .item-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .item-price {
            font-size: 1.6rem;
            font-weight: bold;
            color: #4CAF50;
            text-shadow: 0 0 10px rgba(76, 175, 80, 0.3);
        }
        .add-btn {
            background: linear-gradient(45deg, #ff6b47, #ff8a6b);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .add-btn::before {
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
        .add-btn:hover::before {
            left: 0;
        }
        .add-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 30px rgba(255, 107, 71, 0.4);
        }
        .add-btn:active {
            transform: translateY(-1px) scale(1.02);
        }
        .popular {
            background: linear-gradient(45deg, #4CAF50, #66BB6A);
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.9rem;
            margin-left: 0.5rem;
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-5px); }
            60% { transform: translateY(-3px); }
        }
        /* Responsive */
        @media (max-width: 768px) {
            .restaurant-info {
                flex-direction: column;
                text-align: center;
                gap: 2rem;
                max-width: 90%;
            }
            .restaurant-image {
                width: 150px;
                height: 150px;
            }
            .menu-items {
                grid-template-columns: 1fr;
            }
            .menu-item {
                flex-direction: column;
                text-align: center;
            }
            .item-image {
                margin: 0 auto;
            }
            .restaurant-name {
                font-size: 2rem;
            }
            .nav-links {
                flex-direction: column;
                gap: 0.5rem;
            }
        }
        /* Staggered animation for menu items */
        .menu-item:nth-child(1) { animation-delay: 0.1s; }
        .menu-item:nth-child(2) { animation-delay: 0.2s; }
        .menu-item:nth-child(3) { animation-delay: 0.3s; }
        .menu-item:nth-child(4) { animation-delay: 0.4s; }
        .menu-item:nth-child(5) { animation-delay: 0.5s; }
        .menu-item:nth-child(6) { animation-delay: 0.6s; }
        .menu-item:nth-child(7) { animation-delay: 0.7s; }
        .menu-item:nth-child(8) { animation-delay: 0.8s; }
        .menu-item:nth-child(9) { animation-delay: 0.9s; }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="logo">🍴 Foodie Hub</div>
            <div class="nav-links">
                <a href="Login">Login</a>
                <a href="cart">🛒 Cart</a>
            </div>
        </div>
        <!-- Restaurant Info -->
        <%
            Restarunt r1 = (Restarunt)request.getAttribute("restarunt");
        %>
        <div class="restaurant-info">
            <img src="<%=r1.getImagePath() %>" alt="Restaurant Interior" class="restaurant-image">
            <div class="restaurant-text">
                <h1 class="restaurant-name"><%= r1.getName()%></h1>
                <div class="restaurant-details">
                    <%=r1.getCusineType() %> • ⭐ <%=r1.getRating() %> • 🕒 <%=r1.getEta() %> min • 🚚 $2.99
                </div>
            </div>
        </div>
        <!-- Menu Content -->
        <div class="menu-content">
            <h2 class="menu-title">🍽️ Our Menu</h2>
            <div class="menu-items">
                <!-- Biryani Items -->
                <%
                List<Menu>items = (List<Menu>)request.getAttribute("menus");
                	for(Menu item:items){
                %>
                <div class="menu-item">
                    <img src="<%=item.getImagePath() %>" alt="Hyderabadi Biryani" class="item-image">
                    <div class="item-details">
                        <div class="item-name">
                            <%=item.getItemName() %>
                            <span class="popular"><%=item.getRating() %></span>
                        </div>
                        <div class="item-description"><%=item.getDescription() %></div>
                        <div class="item-footer">
                            <div class="item-price"><%=item.getPrice() %></div>
                            <form action="cart" method="get" style="display: inline;"><!-- When ever you click on Add to Cart it redirect to the cart servlet -->
                                <input type="hidden" name="Menu_Id" value="<%=item.getMenuId()%>">
                                <input type="hidden" name="Quantity" value="1">
                                <input type="hidden" name="Restarunt_Id" value="<%=item.getRestaurantId() %>">
                                <input type="hidden" name="Action" value="add">
                                <button type="submit" class="add-btn">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                	}
                %>
        	</div>
    	</div>
    </div>
</body>
</html>