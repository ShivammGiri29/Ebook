<%@page import="com.entity.user"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
    background: url("img/book.webp") center/cover no-repeat;
    height: 50vh;
    position: relative;
}

.back-img::after {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background: rgba(0,0,0,0.5); 
}

.ebook-title {
    position: relative; 
    font-size: 52px;
    font-weight: bold;
    text-align: center;
    text-transform: uppercase;
    color: #fff; /* white text */
    text-shadow: 0 0 10px #ff3c3c, 0 0 20px #ff3c3c, 0 0 40px #ff0000;
    animation: glow 2s infinite alternate;
    z-index: 1;
}

@keyframes glow {
    from {
        text-shadow: 0 0 5px #ff3c3c, 0 0 10px #ff5e5e, 0 0 20px #ff7e7e;
    }
    to {
        text-shadow: 0 0 20px #ff0000, 0 0 30px #ff3333, 0 0 60px #ff6666;
    }
}
.btn-premium {
    background-color: #2c2f33; /* Dark charcoal */
    color: #fff;               /* White text */
    border: 1px solid #2c2f33;
    transition: all 0.3s;
}

.btn-premium:hover {
    background-color: transparent;
    color: #2c2f33;
    border: 1px solid #2c2f33;
}



.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>

<body style="background-color: #f7f7f7;">

	<%
	user u = (user) session.getAttribute("userobj");
	%>


	<%@include file="all_component/nav.jsp"%>
	<!-- Hero Section -->
<div class="container-fluid" style="background: linear-gradient(rgba(17,24,39,0.8), rgba(17,24,39,0.8)), url('img/book.webp') center/cover no-repeat; height: 50vh;">
    <div class="d-flex flex-column justify-content-center align-items-center h-100 text-center text-white">
        <h1 class="display-4 fw-bold" style="color: #FFD700;">Ebook Management System</h1>
        <p class="lead mt-2" style="color: #ffffffaa;">Discover, Read, and Buy Your Favorite Books</p>
        <a href="all_recent_book.jsp" class="btn btn-warning btn-lg mt-3">Browse Books</a>
    </div>
</div>

	<!-- RECENT BOOK -->
	<div class="container-fluid">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<div class="text-center mt-2">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mx-1">View Details</a> <a
								href="" class="btn btn-warning btn-sm mx-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>
						<%
						} else {
						%>
						<div class="text-center mt-2">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mx-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm mx-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mx-1">View Details</a> <a href=""
								class="btn btn-warning btn-sm mx-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-premium btn-sm">View All</a>

		</div>
	</div>

	<hr>
	<!-- END OF RECENT BOOKS -->

	<!-- NEW BOOK -->
	<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="text-center mt-2">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mx-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm mx-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mx-1">View Details</a> <a href=""
								class="btn btn-warning btn-sm mx-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-premium btn-sm">View All</a>
		</div>
	</div>

	<hr>
	<!-- END OF NEW BOOKS -->
	<!-- OLD BOOK -->
	<div class="container-fluid">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();

			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="text-center mt-2">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mx-1">View Details</a> <a href=""
								class="btn btn-warning btn-sm mx-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%>
							</a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-premium btn-sm">View All</a>

		</div>
	</div>
	<hr>

	<!-- END OF OLD BOOKS -->





	<%@include file="all_component/footer.jsp"%>
</body>
</html>