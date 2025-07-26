<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Import Java Required Classes -->
<%@ page import="java.util.List,model.Restarunt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodie Hub - Delicious Food Delivered</title>
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
            background: #111827;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            opacity: 0.05;
        }

        .floating-emoji {
            position: absolute;
            font-size: 2rem;
            animation: float 6s ease-in-out infinite;
        }

        .floating-emoji:nth-child(1) { left: 10%; top: 15%; animation-delay: 0s; }
        .floating-emoji:nth-child(2) { left: 25%; top: 8%; animation-delay: 1s; }
        .floating-emoji:nth-child(3) { left: 40%; top: 20%; animation-delay: 2s; }
        .floating-emoji:nth-child(4) { left: 60%; top: 12%; animation-delay: 3s; }
        .floating-emoji:nth-child(5) { left: 75%; top: 18%; animation-delay: 4s; }
        .floating-emoji:nth-child(6) { left: 15%; top: 50%; animation-delay: 0.5s; }
        .floating-emoji:nth-child(7) { left: 35%; top: 45%; animation-delay: 1.5s; }
        .floating-emoji:nth-child(8) { left: 55%; top: 55%; animation-delay: 2.5s; }
        .floating-emoji:nth-child(9) { left: 80%; top: 40%; animation-delay: 3.5s; }
        .floating-emoji:nth-child(10) { left: 20%; top: 80%; animation-delay: 4.5s; }
        .floating-emoji:nth-child(11) { left: 45%; top: 75%; animation-delay: 5s; }
        .floating-emoji:nth-child(12) { left: 70%; top: 85%; animation-delay: 5.5s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        /* Header Styles */
        .header {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(17, 24, 39, 0.95);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid #374151;
            padding: 1rem 0;
        }

        .header-content {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }

        .auth-section {
            display: flex;
            gap: 0.5rem;
            width: 100%;
        }

        .auth-btn {
            flex: 1;
            background: #f97316;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }

        .auth-btn:hover {
            background: #ea580c;
            transform: translateY(-2px);
        }

        .search-section {
            position: relative;
            width: 100%;
            max-width: 28rem;
        }

        .search-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
            width: 1rem;
            height: 1rem;
        }

        .search-bar {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            background: white;
            color: #111827;
            transition: all 0.3s ease;
        }

        .search-bar:focus {
            outline: none;
            box-shadow: 0 0 0 2px #f97316;
        }

        .logo {
            font-size: 1.875rem;
            font-weight: bold;
            color: #f97316;
            cursor: pointer;
            transition: transform 0.3s ease;
            text-decoration: none;
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .nav {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 0.5rem;
            list-style: none;
            margin-top: 1rem;
        }

        .nav a {
            color: #d1d5db;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 0.75rem;
            border-radius: 9999px;
            transition: all 0.3s ease;
        }

        .nav a:hover,
        .nav a.active {
            color: #fb923c;
            background: rgba(249, 115, 22, 0.2);
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, rgba(249, 115, 22, 0.9), rgba(236, 72, 153, 0.9));
            padding: 3rem 0;
            text-align: center;
        }

        .hero h1 {
            font-size: 2.25rem;
            font-weight: bold;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .hero p {
            font-size: 1.125rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            max-width: 32rem;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-btn {
            background: white;
            color: #f97316;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 9999px;
            font-size: 1.125rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .hero-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* Section Styles */
        .section {
            padding: 3rem 0;
        }

        .section-title {
            text-align: center;
            font-size: 2.25rem;
            font-weight: bold;
            margin-bottom: 2rem;
            background: linear-gradient(45deg, #fb923c, #f472b6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Categories Grid - Responsive: 2 cols mobile, 3 cols tablet, 6 cols desktop */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }

        .category-card {
            background: rgba(55, 65, 81, 0.8);
            backdrop-filter: blur(8px);
            border-radius: 0.75rem;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px solid #374151;
        }

        .category-card:hover {
            transform: translateY(-5px) scale(1.05);
            background: rgba(75, 85, 99, 0.8);
            box-shadow: 0 15px 30px rgba(249, 115, 22, 0.3);
            border-color: rgba(249, 115, 22, 0.5);
        }

        .category-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .category-name {
            font-weight: 600;
            font-size: 0.875rem;
        }

        /* Restaurant Stats */
        .restaurant-stats {
            text-align: center;
            margin-bottom: 2rem;
        }

        .stats-number {
            font-size: 2.25rem;
            font-weight: bold;
            color: #f97316;
            margin-bottom: 0.5rem;
        }

        .stats-text {
            color: #9ca3af;
        }

        /* Filters */
        .filters {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }

        .filter-btn {
            background: transparent;
            color: #d1d5db;
            border: 1px solid #4b5563;
            padding: 0.5rem 1rem;
            border-radius: 9999px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 0.875rem;
        }

        .filter-btn:hover,
        .filter-btn.active {
            background: #f97316;
            color: white;
            border-color: #f97316;
            transform: translateY(-2px);
        }

        /* Restaurants Grid - Exactly 3 cards per row on desktop */
        .restaurants-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        .restaurant-card {
            background: rgba(55, 65, 81, 0.8);
            backdrop-filter: blur(8px);
            border-radius: 0.75rem;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 1px solid #374151;
            position: relative;
        }

        .restaurant-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 50px rgba(249, 115, 22, 0.3);
            border-color: rgba(249, 115, 22, 0.5);
        }

        .restaurant-image-container {
            position: relative;
            overflow: hidden;
        }

        .restaurant-image {
            width: 100%;
            height: 12rem;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover .restaurant-image {
            transform: scale(1.1);
        }

        .restaurant-badge {
            position: absolute;
            top: 0.75rem;
            right: 0.75rem;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            z-index: 10;
        }

        .badge-popular { background: #f97316; color: white; }
        .badge-trending { background: #ef4444; color: white; }
        .badge-new { background: #10b981; color: white; }

        .restaurant-info {
            padding: 1rem;
        }

        .restaurant-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.5rem;
        }

        .restaurant-name {
            font-size: 1.125rem;
            font-weight: 600;
            color: white;
            transition: color 0.3s ease;
        }

        .restaurant-card:hover .restaurant-name {
            color: #fb923c;
        }

        .restaurant-rating {
            display: flex;
            align-items: center;
            gap: 0.25rem;
            background: #10b981;
            color: white;
            padding: 0.25rem 0.5rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .restaurant-cuisine {
            color: #fb923c;
            font-weight: 500;
            margin-bottom: 0.75rem;
            font-size: 0.875rem;
        }

        .restaurant-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #9ca3af;
            font-size: 0.75rem;
            margin-bottom: 1rem;
        }

        .detail-item {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .restaurant-actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }

        .btn-primary {
            flex: 1;
            background: #f97316;
            color: white;
        }

        .btn-primary:hover {
            background: #ea580c;
        }

        .btn-icon {
            width: 2.5rem;
            height: 2.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            background: transparent;
            color: #9ca3af;
            border: 1px solid #4b5563;
        }

        .btn-icon:hover {
            background: rgba(249, 115, 22, 0.2);
            border-color: #f97316;
            color: #fb923c;
        }

        .btn-icon.favorited {
            background: #f97316;
            border-color: #f97316;
            color: white;
        }

        .btn-icon.favorited:hover {
            background: #ea580c;
        }

        /* No Results */
        .no-results {
            text-align: center;
            padding: 3rem 0;
        }

        .no-results-emoji {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .no-results h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .no-results p {
            color: #9ca3af;
        }

        /* Footer */
        .footer {
            background: #111827;
            border-top: 1px solid #374151;
            padding: 2rem 0;
            text-align: center;
            color: #9ca3af;
        }

        /* Responsive Design */
        @media (min-width: 768px) {
            .header-content {
                flex-direction: row;
                align-items: center;
            }

            .auth-section {
                width: auto;
            }

            .auth-btn {
                flex: none;
            }

            .search-section {
                flex: 1;
                max-width: 32rem;
                margin: 0 2rem;
            }

            .hero h1 {
                font-size: 3rem;
            }

            .hero p {
                font-size: 1.25rem;
            }

            .section {
                padding: 4rem 0;
            }

            .section-title {
                font-size: 2.5rem;
                margin-bottom: 3rem;
            }

            .categories-grid {
                grid-template-columns: repeat(3, 1fr);
                gap: 1.5rem;
            }

            .category-card {
                padding: 1.5rem;
            }

            .category-icon {
                font-size: 2.5rem;
                margin-bottom: 0.75rem;
            }

            .category-name {
                font-size: 1rem;
            }

            .restaurants-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 2rem;
            }

            .restaurant-image {
                height: 14rem;
            }

            .restaurant-info {
                padding: 1.5rem;
            }

            .restaurant-name {
                font-size: 1.25rem;
            }

            .restaurant-cuisine {
                font-size: 1rem;
            }

            .restaurant-details {
                font-size: 0.875rem;
            }
        }

        @media (min-width: 1024px) {
            .hero {
                padding: 5rem 0;
            }

            .hero h1 {
                font-size: 3.75rem;
            }

            .categories-grid {
                grid-template-columns: repeat(6, 1fr);
            }

            /* EXACTLY 3 cards per row on desktop */
            .restaurants-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 0.5rem;
            }

            .hero {
                padding: 2rem 0;
            }

            .hero h1 {
                font-size: 1.875rem;
            }

            .section {
                padding: 2rem 0;
            }

            .section-title {
                font-size: 1.875rem;
            }

            .filters {
                gap: 0.25rem;
            }

            .filter-btn {
                padding: 0.375rem 0.75rem;
                font-size: 0.75rem;
            }
        }

        /* Utility Classes */
        .hidden {
            display: none !important;
        }

        /* Icons */
        .icon {
            width: 1rem;
            height: 1rem;
            display: inline-block;
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="animated-bg">
        <div class="floating-emoji">🍕</div>
        <div class="floating-emoji">🍔</div>
        <div class="floating-emoji">🍜</div>
        <div class="floating-emoji">🥗</div>
        <div class="floating-emoji">🍣</div>
        <div class="floating-emoji">🍛</div>
        <div class="floating-emoji">🌮</div>
        <div class="floating-emoji">🍰</div>
        <div class="floating-emoji">🥡</div>
        <div class="floating-emoji">🍝</div>
        <div class="floating-emoji">🥙</div>
        <div class="floating-emoji">🍲</div>
    </div>

    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="auth-section">
                	<button disable class="auth-btn" disabled>Sign In</button>
                    <a href="" class="auth-btn">Log Out</a>
                </div>

                <div class="search-section">
                    <svg class="search-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21 21-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                    <input type="text" class="search-bar" placeholder="Search restaurants or cuisines..." id="searchBar">
                </div>

                <a href="#" class="logo">Foodie Hub 🍴</a>
            </div>

            <nav>
                <ul class="nav">
                    <li><a href="#" class="active">Home</a></li>
                    <li><a href="#restaurantsGrid">Restaurants</a></li>
                    <li><a href="<%=request.getContextPath()%>/menu?RestaruntId=101&RestaruntId=102&RestaruntId=103">Menu</a></li>
                    <li><a href="#">Cart</a></li>
                    <li><a href="#">Orders</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>🍽️ Delicious Food Delivered to Your Door</h1>
            <p>Order from your favorite restaurants and enjoy fresh, hot meals delivered fast</p>
            <a href="<%=request.getContextPath()%>/RegLoginJsp/SignIn.jsp" class="hero-btn">🚀 Order Now</a>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">🌟 Popular Categories</h2>
            <div class="categories-grid">
                <div class="category-card" data-category="italian">
                    <div class="category-icon">🍕</div>
                    <div class="category-name">Italian</div>
                </div>
                <div class="category-card" data-category="japanese">
                    <div class="category-icon">🍣</div>
                    <div class="category-name">Japanese</div>
                </div>
                <div class="category-card" data-category="american">
                    <div class="category-icon">🍔</div>
                    <div class="category-name">American</div>
                </div>
                <div class="category-card" data-category="chinese">
                    <div class="category-icon">🥡</div>
                    <div class="category-name">Chinese</div>
                </div>
                <div class="category-card" data-category="indian">
                    <div class="category-icon">🍛</div>
                    <div class="category-name">Indian</div>
                </div>
                <div class="category-card" data-category="healthy">
                    <div class="category-icon">🥗</div>
                    <div class="category-name">Healthy</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Restaurants Section -->
    <section class="section" id="restaurants">
        <div class="container">
            <h2 class="section-title">🏪 Featured Restaurants</h2>

            <!-- Restaurant Stats -->
            <div class="restaurant-stats">
                <div class="stats-number" id="restaurantCount">9</div>
                <p class="stats-text">Amazing Restaurants Available</p>
            </div>

            <!-- Filters -->
            <div class="filters">
                <button class="filter-btn active" data-filter="all">🍽️ All</button>
                <button class="filter-btn" data-filter="italian">🍕 Italian</button>
                <button class="filter-btn" data-filter="japanese">🍣 Japanese</button>
                <button class="filter-btn" data-filter="american">🍔 American</button>
                <button class="filter-btn" data-filter="chinese">🥡 Chinese</button>
                <button class="filter-btn" data-filter="indian">🍛 Indian</button>
                <button class="filter-btn" data-filter="healthy">🥗 Healthy</button>
            </div>

            <!-- Restaurants Grid -->
            <div class="restaurants-grid" id="restaurantsGrid">
                
			<%
				//Get the data from the Request Object that can be passed by MyServlet
				List<Restarunt>restarunts = (List<Restarunt>)request.getAttribute("restarunts");
				if(restarunts != null && !restarunts.isEmpty()){
					for(Restarunt r : restarunts ){
				
			%>

                <!-- Restaurant Card 1-->
                <div class="restaurant-card" data-category="japanese" data-name="Sushi Zen" data-cuisine="Japanese Sushi">
                    <div class="restaurant-image-container">
                        <img src="<%= r.getImagePath() %>" alt="Sushi Zen" class="restaurant-image">
                    </div>
                    <div class="restaurant-info">
                        <div class="restaurant-header">
                            <h3 class="restaurant-name"><%= r.getName() %></h3>
                            <div class="restaurant-rating">
                                <span>⭐</span>
                                <span><%= String.format("%.1f", r.getRating()) %></span>
                            </div>
                        </div>
                        <div class="restaurant-cuisine">🍣 <%= r.getCusineType() %></div>
                        <div class="restaurant-details">
                            <div class="detail-item">🕒 <%= r.getEta() %> min</div>
                            <div class="detail-item">🚚 $2.99</div>
                            <div class="detail-item">📍 <%= r.isActive() %></div>
                        </div>
                        <div class="restaurant-actions" >
                        	<form action="menu" method="get" ><!-- Redirect to menu.jsp Servlet -->
                        		<input type="hidden" name="RestaruntId" value="<%=r.getRestaurantId()%>">
                        		<button class="btn btn-primary" type="submit">View Menu</button>
                        	</form>
                            <button class="btn btn-icon favorite-btn" data-restaurant="2">❤️</button>
                        </div>
                    </div>
                </div>
		<%
				}
			}else{
					
		%>
			<div class="no-results">
            	<div class="no-results-emoji">😔</div>
            	<h3>No Restaurants Found</h3>
            	<p>Try adjusting your search or check back later!</p>
        	</div>
        <%
			}
        %>	
   
            <!-- No Results Message -->
            <div class="no-results hidden" id="noResults">
                <div class="no-results-emoji">😔</div>
                <h3>No restaurants found</h3>
                <p>Try adjusting your search or filter criteria</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Foodie Hub. All rights reserved. | Delicious food delivered with love ❤️</p>
        </div>
    </footer>

    <!-- JavaScript -->
   // Replace the existing JavaScript section in your JSP file with this:

<script>
    // State management
    let activeFilter = 'all';
    let searchTerm = '';
    let favorites = [];

    // DOM elements
    const searchBar = document.getElementById('searchBar');
    const restaurantsGrid = document.getElementById('restaurantsGrid');
    const noResults = document.getElementById('noResults');
    const restaurantCount = document.getElementById('restaurantCount');
    const filterButtons = document.querySelectorAll('.filter-btn');
    const categoryCards = document.querySelectorAll('.category-card');
    const favoriteButtons = document.querySelectorAll('.favorite-btn');

    // Get all restaurant cards
    function getAllRestaurantCards() {
        return document.querySelectorAll('.restaurant-card');
    }

    // Extract text content from restaurant card for searching
    function getRestaurantSearchText(card) {
        const nameElement = card.querySelector('.restaurant-name');
        const cuisineElement = card.querySelector('.restaurant-cuisine');
        
        const name = nameElement ? nameElement.textContent.toLowerCase() : '';
        const cuisine = cuisineElement ? cuisineElement.textContent.toLowerCase() : '';
        
        return { name, cuisine };
    }

    // Filter restaurants
    function filterRestaurants(filter = activeFilter, search = searchTerm) {
        const restaurantCards = getAllRestaurantCards();
        let visibleCount = 0;

        restaurantCards.forEach(card => {
            // Get category from data attribute (if exists) or from cuisine text
            const category = card.dataset.category || '';
            
            // Extract search text from the actual DOM elements
            const { name, cuisine } = getRestaurantSearchText(card);
            
            // Check filter match
            const matchesFilter = filter === 'all' || 
                category === filter || 
                cuisine.includes(filter) ||
                (filter === 'japanese' && cuisine.includes('japanese')) ||
                (filter === 'italian' && cuisine.includes('italian')) ||
                (filter === 'american' && cuisine.includes('american')) ||
                (filter === 'chinese' && cuisine.includes('chinese')) ||
                (filter === 'indian' && cuisine.includes('indian')) ||
                (filter === 'healthy' && cuisine.includes('healthy'));
            
            // Check search match
            const matchesSearch = search === '' ||
                name.includes(search.toLowerCase()) ||
                cuisine.includes(search.toLowerCase());

            if (matchesFilter && matchesSearch) {
                card.classList.remove('hidden');
                visibleCount++;
            } else {
                card.classList.add('hidden');
            }
        });

        // Update restaurant count
        restaurantCount.textContent = visibleCount;

        // Show/hide no results message
        if (visibleCount === 0) {
            noResults.classList.remove('hidden');
            restaurantsGrid.style.display = 'none';
        } else {
            noResults.classList.add('hidden');
            restaurantsGrid.style.display = 'grid';
        }
    }

    // Update active filter button
    function updateActiveFilterButton(filter) {
        filterButtons.forEach(btn => {
            if (btn.dataset.filter === filter) {
                btn.classList.add('active');
            } else {
                btn.classList.remove('active');
            }
        });
    }

    // Handle filter button clicks
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            activeFilter = button.dataset.filter;
            updateActiveFilterButton(activeFilter);
            filterRestaurants();
        });
    });

    // Handle category card clicks
    categoryCards.forEach(card => {
        card.addEventListener('click', () => {
            const category = card.dataset.category;
            activeFilter = category;
            updateActiveFilterButton(category);
            filterRestaurants();
            // Scroll to restaurants section
            document.getElementById('restaurants').scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Handle search input
    searchBar.addEventListener('input', (e) => {
        searchTerm = e.target.value;
        filterRestaurants();
    });

    // Handle favorite button clicks
    favoriteButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation();
            const restaurantId = parseInt(button.dataset.restaurant);
            if (favorites.includes(restaurantId)) {
                favorites = favorites.filter(id => id !== restaurantId);
                button.classList.remove('favorited');
            } else {
                favorites.push(restaurantId);
                button.classList.add('favorited');
            }
        });
    });

    // Handle hero button click
    document.querySelector('.hero-btn').addEventListener('click', (e) => {
        e.preventDefault();
        document.getElementById('restaurants').scrollIntoView({
            behavior: 'smooth'
        });
    });

    // Initialize the page
    document.addEventListener('DOMContentLoaded', () => {
        filterRestaurants();
    });

    // Smooth scroll for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
</script>
</body>
</html>