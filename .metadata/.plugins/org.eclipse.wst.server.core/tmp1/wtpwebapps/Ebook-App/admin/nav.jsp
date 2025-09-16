<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- Top Thin Bar -->
<div class="container-fluid" style="height: 10px; background-color: #111827;"></div>

<!-- Logo + Search + User Section -->
<div class="container-fluid p-4 bg-dark text-white shadow-sm">
  <div class="row align-items-center">
    
    <!-- Logo -->
    <div class="col-md-3 text-warning">
      <h3>
        <i class="fa-solid fa-book"></i> Ebooks
      </h3>
    </div>

    <!-- Search -->
    <div class="col-md-6">
      <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
        <input class="form-control mr-sm-2 w-75" type="search" name="ch"
          placeholder="Search for books..." aria-label="Search">
        <button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>

    <!-- User Section -->
    <div class="col-md-3 text-right">
      <c:if test="${not empty userobj}">
        <a href="checkout.jsp" class="btn btn-outline-warning mr-2"> 
          <i class="fa-solid fa-cart-plus"></i>
        </a> 
        <a class="btn btn-warning text-dark mr-2">
          <i class="fa-solid fa-user"></i> ${userobj.name}
        </a> 
        <!-- Trigger Logout Modal -->
        <a data-toggle="modal" data-target="#logoutModal" class="btn btn-danger text-white">
          <i class="fa-solid fa-right-to-bracket"></i> Logout
        </a>
      </c:if>

      <c:if test="${empty userobj}">
        <a href="login.jsp" class="btn btn-warning text-dark mr-2">
          <i class="fa-solid fa-right-to-bracket"></i> Login
        </a> 
        <a href="register.jsp" class="btn btn-outline-warning">
          <i class="fa-solid fa-user-plus"></i> Register
        </a>
      </c:if>
    </div>
  </div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg" style="background-color: #111827;">
  <a class="navbar-brand text-warning" href="#"><i class="fa-solid fa-house"></i></a>
  <button class="navbar-toggler text-white" type="button" data-toggle="collapse"
    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
    aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Home</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Books</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Books</a></li>
      <li class="nav-item"><a class="nav-link text-white" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Books</a></li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-outline-warning my-2 my-sm-0">
        <i class="fa-solid fa-gear"></i> Setting
      </a>
      <a href="helpline.jsp" class="btn btn-outline-warning my-2 my-sm-0 ml-2">
        <i class="fa-solid fa-phone"></i> Contact Us
      </a>
    </form>
  </div>
</nav>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1"
  role="dialog" aria-labelledby="logoutModalTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirm Logout</h5>
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <h4>Do you really want to logout?</h4>
        <button type="button" class="btn btn-secondary"
          data-dismiss="modal">Close</button>
        <a href="logout" type="button"
          class="btn btn-danger text-white">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Custom Hover Style -->
<style>
  .navbar a.nav-link:hover {
    color: #FBBF24 !important; /* Premium Gold hover */
  }
  .navbar-brand:hover {
    color: #FFD700 !important; /* Premium Gold */
  }
</style>
