<footer class="text-white mt-4" style="background-color: #111827;">
  <div class="container p-4">
    <div class="row">
      
      <!-- About Section -->
      <div class="col-md-4">
        <h5 class="text-warning">E-Book Management System</h5>
        <p>
          A platform to explore, buy, and manage e-books. 
          Find the latest, new, and old books in one place.
        </p>
      </div>

      <!-- Quick Links -->
      <div class="col-md-4">
        <h5 class="text-warning">Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="index.jsp" class="text-white text-decoration-none">Home</a></li>
          <li><a href="all_recent_book.jsp" class="text-white text-decoration-none">Recent Books</a></li>
          <li><a href="all_new_book.jsp" class="text-white text-decoration-none">New Books</a></li>
          <li><a href="all_old_book.jsp" class="text-white text-decoration-none">Old Books</a></li>
          <li><a href="helpline.jsp" class="text-white text-decoration-none">Contact Us</a></li>
        </ul>
      </div>

      <!-- Contact & Social -->
      <div class="col-md-4">
        <h5 class="text-warning">Contact Us</h5>
        <p><i class="fa-solid fa-envelope text-warning"></i> support@ebookapp.com</p>
        <p><i class="fa-solid fa-phone text-warning"></i> +91 8591636011</p>
        <p><i class="fa-solid fa-location-dot text-warning"></i> Mumbai, India</p>

        <!-- Social Media Icons -->
        <a href="#" class="text-white me-3"><i class="fa-brands fa-facebook"></i></a>
        <a href="#" class="text-white me-3"><i class="fa-brands fa-twitter"></i></a>
        <a href="#" class="text-white me-3"><i class="fa-brands fa-instagram"></i></a>
      </div>
    </div>
  </div>

  <!-- Bottom Bar -->
  <div class="text-center p-2" style="background-color: #0f172a;">
    <small>
      <i class="fa-solid fa-copyright text-warning"></i> 
      <%= java.time.Year.now() %> | Design & Developed by <b class="text-warning">Shivam Giri</b>
    </small>
  </div>
</footer>

<style>
  footer a:hover {
    color: #FBBF24 !important; /* Gold hover */
  }
  footer i.fa-brands:hover {
    color: #FFD700 !important; /* Bright premium gold */
  }
</style>
