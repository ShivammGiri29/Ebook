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
	</div>

</body>
</html>
