<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="all_component/allCss.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
</head>
<body style="background-color: #f0f1f2">
    <%@ include file="all_component/nav.jsp"%>

    <div class="container">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Reset Your Password</h3>

                        <c:if test="${not empty msg}">
                            <h5 class="text-center text-success">${msg}</h5>
                        </c:if>

                        <form action="updatePassword" method="post">
                            <div class="form-group mb-3">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="newpass">New Password:</label>
                                <input type="password" class="form-control" id="newpass" name="newpass" placeholder="Enter new password" required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Update Password</button>
                        </form>

                        <div class="text-center mt-3">
                            <a href="login.jsp">Back to Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
