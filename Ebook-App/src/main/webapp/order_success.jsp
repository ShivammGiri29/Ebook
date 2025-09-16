<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Success - MyShop</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/nav.jsp"%>

    <div class="container d-flex justify-content-center align-items-center mt-5">
        <div class="card shadow-lg p-4 text-center" style="max-width: 600px; border-radius: 12px;">
            
            <i class="fas fa-check-circle fa-5x text-success mb-3"></i>

            <h1 class="text-success">Thank You!</h1>
            <h2>Your Order was Successful</h2>
            <h5 class="text-muted">Within 7 Days, your product will be delivered to your address.</h5>

            <div class="mt-4">
                <a href="index.jsp" class="btn btn-primary mx-2">
                    <i class="fas fa-home"></i> Home
                </a>

                <a href="order.jsp" class="btn btn-danger mx-2">
                    <i class="fas fa-box"></i> View Order
                </a>

                
            </div>
        </div>
    </div>
</body>
</html>