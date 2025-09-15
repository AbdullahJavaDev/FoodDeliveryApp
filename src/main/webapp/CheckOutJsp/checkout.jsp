<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.Cart,model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Foodie Hub</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            color: #ffffff;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .header {
            background-color: #1a1a1a;
            border-bottom: 1px solid #333;
            padding: 20px 0;
            text-align: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #ff6b47;
            text-decoration: none;
        }

        /* Main Content */
        .page-title {
            text-align: center;
            font-size: 36px;
            color: #ff6b47;
            margin: 30px 0;
        }

        .checkout-container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            margin-top: 20px;
        }

        /* Form Styles */
        .checkout-form {
            background-color: #2a2a2a;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #333;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 20px;
            color: #ff6b47;
            margin-bottom: 15px;
            border-bottom: 2px solid #ff6b47;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-row-three {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #ffffff;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #444;
            border-radius: 5px;
            background-color: #333;
            color: #ffffff;
            font-size: 16px;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #ff6b47;
            background-color: #3a3a3a;
        }

        /* Payment Method Grid */
        .payment-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 20px;
        }

        .payment-option {
            background-color: #333;
            border: 2px solid #444;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .payment-option:hover {
            border-color: #ff6b47;
            background-color: #3a3a3a;
        }

        .payment-option.selected {
            border-color: #ff6b47;
            background-color: rgba(255, 107, 71, 0.1);
        }

        .payment-option input[type="radio"] {
            display: none;
        }

        .payment-icon {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .payment-name {
            font-size: 14px;
            color: #ccc;
        }

        /* Card Details */
        .card-details {
            margin-top: 20px;
            padding: 20px;
            background-color: #333;
            border-radius: 8px;
        }

        /* Submit Button */
        .submit-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #ff6b47, #e55a3a);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        .submit-btn:hover {
            background: linear-gradient(45deg, #e55a3a, #d14836);
            transform: translateY(-2px);
        }

        /* Order Summary */
        .order-summary {
            background-color: #2a2a2a;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #333;
            height: fit-content;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #444;
        }

        .item-name {
            font-weight: bold;
        }

        .item-quantity {
            font-size: 14px;
            color: #ccc;
        }

        .item-price {
            font-weight: bold;
            color: #4CAF50;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            color: #ccc;
        }

        .total-row {
            border-top: 2px solid #ff6b47;
            padding-top: 15px;
            margin-top: 15px;
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .checkout-container {
                grid-template-columns: 1fr;
            }
            
            .form-row, .form-row-three {
                grid-template-columns: 1fr;
            }
            
            .payment-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .container {
                padding: 10px;
            }
        }

        @media (max-width: 480px) {
            .payment-grid {
                grid-template-columns: 1fr;
            }
            
            .checkout-form, .order-summary {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <a href="index.html" class="logo">🍴 Foodie Hub 🥄</a>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <div class="container">
            <h1 class="page-title">Checkout</h1>
            
            <div class="checkout-container">
                <!-- Checkout Form -->
                <div class="checkout-form">
                    <!-- 
                        FORM ACTION: Change "CheckoutServlet" to your Java servlet URL
                        METHOD: POST - sends data securely to your Java backend
                    -->
                    <form action="<%=request.getContextPath()+"/CheckoutServlet"%>" method="post" id="checkoutForm">
                        
                        <!-- HIDDEN FIELDS - These will be sent to your Java servlet -->
                        <input type="hidden" name="user_id" value="123" id="userId">
                        <input type="hidden" name="restaurant_id" value="456" id="restaurantId">
                        <input type="hidden" name="order_id" value="" id="orderId">
                        <input type="hidden" name="status" value="pending">
                        <input type="hidden" name="datetime" value="" id="orderDateTime">
                        <input type="hidden" name="total_amount" value="40.08" id="totalAmount">

                        <!-- CUSTOMER INFORMATION SECTION -->
                        <div class="form-section">
                            <h2 class="section-title">Customer Information</h2>
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="customer_name">Full Name *</label>
                                    <input type="text" id="customer_name" name="customer_name" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="customer_phone">Phone Number *</label>
                                    <input type="tel" id="customer_phone" name="customer_phone" required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="customer_email">Email Address *</label>
                                <input type="email" id="customer_email" name="customer_email" required>
                            </div>
                        </div>

                        <!-- DELIVERY ADDRESS SECTION -->
                        <div class="form-section">
                            <h2 class="section-title">Delivery Address</h2>
                            
                            <div class="form-group">
                                <label for="street_address">Street Address *</label>
                                <input type="text" id="street_address" name="address" required>
                            </div>
                            
                            <div class="form-row-three">
                                <div class="form-group">
                                    <label for="city">City *</label>
                                    <input type="text" id="city" name="city" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="state">State *</label>
                                    <select id="state" name="state" required>
                                        <option value="">Select State</option>
                                        <option value="cA">TamilNadu</option>
                                        <option value="NY">Karnataka</option>
                                        <option value="TX">Kerala</option>
                                        <option value="FL">Andhra Pradesh</option>
                                        <option value="IL">Telangaana</option>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="zip_code">ZIP Code *</label>
                                    <input type="text" id="zip_code" name="zip_code" required>
                                </div>
                            </div>
                            
    
                        </div>

                        <!-- PAYMENT METHOD SECTION -->
                        <div class="form-section">
                            <h2 class="section-title">Payment Method</h2>
                            
                            <div class="payment-grid">
                                <div class="payment-option selected" onclick="selectPayment(this, 'credit_card')">
                                    <input type="radio" name="paymentMethod" value="credit_card" checked>
                                    <div class="payment-icon">💳</div>
                                    <div class="payment-name">Credit Card</div>
                                </div>
                                
                                <div class="payment-option" onclick="selectPayment(this, 'debit_card')">
                                    <input type="radio" name="paymentMethod" value="debit_card">
                                    <div class="payment-icon">💳</div>
                                    <div class="payment-name">Debit Card</div>
                                </div>
                                
                                <div class="payment-option" onclick="selectPayment(this, 'paypal')">
                                    <input type="radio" name="paymentMethod" value="paypal">
                                    <div class="payment-icon">🅿️</div>
                                    <div class="payment-name">PayPal</div>
                                </div>
                                
                                <div class="payment-option" onclick="selectPayment(this, 'cash')">
                                    <input type="radio" name="paymentMethod" value="cash">
                                    <div class="payment-icon">💵</div>
                                    <div class="payment-name">Cash</div>
                                </div>
                            </div>
                            
                            <!-- CARD DETAILS (Shows only for card payments) -->
                            <div class="card-details" id="cardDetails">
                                <h3 style="margin-bottom: 15px; color: #ff6b47;">Card Details</h3>
                                
                                <div class="form-group">
                                    <label for="card_number">Card Number</label>
                                    <input type="text" id="card_number" name="card_number" placeholder="1234 5678 9012 3456" maxlength="19">
                                </div>
                                
                                <div class="form-row-three">
                                    <div class="form-group">
                                        <label for="expiry_month">Month</label>
                                        <select id="expiry_month" name="expiry_month">
                                            <option value="">MM</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="expiry_year">Year</label>
                                        <select id="expiry_year" name="expiry_year">
                                            <option value="">YYYY</option>
                                            <option value="2024">2024</option>
                                            <option value="2025">2025</option>
                                            <option value="2026">2026</option>
                                            <option value="2027">2027</option>
                                            <option value="2028">2028</option>
                                            <option value="2029">2029</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" name="cvv" placeholder="123" maxlength="4">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="card_name">Name on Card</label>
                                    <input type="text" id="card_name" name="card_name" placeholder="John Doe">
                                </div>
                            </div>
                        </div>

                        <!-- SUBMIT BUTTON -->
                        <button type="submit" class="submit-btn" id="submitBtn">
                            Place Order
                        </button>
                    </form>
                </div>

                <!-- ORDER SUMMARY -->
                <div class="order-summary">
                    <h2 class="section-title">Order Summary</h2>
                    
                     <%
                    	// Get cart items using your static Cart.getItems() method
                    	Map<Integer, CartItem> cartItems = Cart.getItems();
                    	double subtotal = 0.0;
                    	if(cartItems != null && !cartItems.isEmpty()) {
                        for(CartItem item : cartItems.values()) {
                            subtotal += item.getPrice() * item.getQuantity();
               		 %>
                    <!-- Order Items -->
                    <div class="order-items">
                        <div class="order-item">
                            <div>
                                <div class="item-name"><%=item.getName() %></div>
                                <div class="item-quantity">Qty: <%=item.getQuantity() %></div>
                            </div>
                            <div class="item-price">₹<%=item.getPrice() %></div>
                        </div>
                       <%
                        	}
                    	}
                        
                       %> 
                       <%
                       		double tax = (0.08*subtotal);
                       		String per = (subtotal>1000)?("20%"):("10%");
                       		double discount=(subtotal>1000)?(0.20*subtotal):(0.10*subtotal);
                       		double total = (subtotal+tax)-discount;
                       
                       %>
                    <!-- Summary Calculations -->
                    <div class="summary-row">
                        <span>Subtotal</span>
                        <span>₹<%=subtotal%></span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Tax (8%)</span>
                        <span>₹<%=tax %></span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Discount(<%=per %>)</span>
                        <span style="color: #4CAF50;">₹<%=discount %></span>
                    </div>
                    
                    <div class="summary-row total-row">
                        <span>Total</span>
                        <span id="totalDisplay">₹<%= String.format("%.1f", total) %></span>
                    </div>

                    <!-- Order Info -->
                    <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #444; font-size: 14px; color: #ccc;">
                        <div>Status: <span style="color: #ffd700;">Pay to Confirm</span></div>
                        <div>Estimated: <span style="color: #fff;">20-25 minutes</span></div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Simple JavaScript for Form Interactions -->
    <script>
        // Initialize form when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Set current date and time
            const now = new Date().toISOString();
            document.getElementById('orderDateTime').value = now;
            
            // Generate unique order ID
            const orderId = 'FH-ORD-' + Date.now();
            document.getElementById('orderId').value = orderId;
            document.getElementById('orderIdDisplay').textContent = orderId;
        });

        // Function to select payment method
        function selectPayment(element, type) {
            // Remove selected class from all payment options
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to clicked option
            element.classList.add('selected');
            
            // Check the radio button
            element.querySelector('input[type="radio"]').checked = true;
            
            // Show/hide card details
            const cardDetails = document.getElementById('cardDetails');
            if (type === 'credit_card' || type === 'debit_card') {
                cardDetails.style.display = 'block';
                // Make card fields required
                document.getElementById('card_number').required = true;
                document.getElementById('expiry_month').required = true;
                document.getElementById('expiry_year').required = true;
                document.getElementById('cvv').required = true;
                document.getElementById('card_name').required = true;
            } else {
                cardDetails.style.display = 'none';
                // Remove required from card fields
                document.getElementById('card_number').required = false;
                document.getElementById('expiry_month').required = false;
                document.getElementById('expiry_year').required = false;
                document.getElementById('cvv').required = false;
                document.getElementById('card_name').required = false;
            }
        }

        // Format card number input
        document.getElementById('card_number').addEventListener('input', function() {
            let value = this.value.replace(/\s/g, '').replace(/[^0-9]/gi, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            this.value = formattedValue;
        });

        // Format CVV input (numbers only)
        document.getElementById('cvv').addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        // Handle form submission
        document.getElementById('checkoutForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.innerHTML = 'Processing Order...';
            submitBtn.disabled = true;
            
            // Note: Form will submit to your Java servlet
            // You can add additional validation here if needed
        });
    </script>
</body>
</html>