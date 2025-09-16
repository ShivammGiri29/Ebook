<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
	user u = (user) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart}">
		<div id="toast"></div>

		<script type="text/javascript">
        showToast("${addCart}");

        function showToast(content) {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }
    </script>
    <c:remove var="addCart" scope="session"/>
	</c:if>

	<%@include file="all_component/nav.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
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
							
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mx-1">View Details</a>
							<a href="" class="btn btn-warning btn-sm mx-1"> <i
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

