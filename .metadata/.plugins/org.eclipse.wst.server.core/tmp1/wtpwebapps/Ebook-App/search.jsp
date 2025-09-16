<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_component/nav.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);

			com.entity.user u = (com.entity.user) session.getAttribute("userobj");

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>

						<div class="text-center mt-2">
							<% if (!"Old".equalsIgnoreCase(b.getBookCategory())) { %>
								<% if (u == null) { %>
									<!-- If not logged in -->
									<a href="login.jsp" class="btn btn-danger btn-sm mx-1">
										<i class="fa-solid fa-cart-plus"></i> Add Cart
									</a>
								<% } else { %>
									<!-- If logged in -->
									<a href="cart?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm mx-1">
										<i class="fa-solid fa-cart-plus"></i> Add Cart
									</a>
								<% } %>
							<% } %>
							
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mx-1">View Details</a> 
							<a href="" class="btn btn-warning btn-sm mx-1"> 
								<i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%>
							</a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>
