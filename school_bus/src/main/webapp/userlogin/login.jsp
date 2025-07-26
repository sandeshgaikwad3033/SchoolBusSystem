<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

  <div class="container" id="container">
    <div class="form-container sign-in-container">
      <form action="../UserLogin" method="post">
        <h1>Login</h1>
        <div class="social-container">
          <a href="#" class="social">S<i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social">C<i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social">H<i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="social">O<i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social">O<i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social">L<i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>Use your account</span>
        <input type="text" name="email" placeholder="User email" required />
        <input type="password" name="password"  placeholder="Password" required />
        <a href="#">Forgot your password?</a>
        <button type="submit">Log In</button>
      </form>
            <%        // Display an alert if the session attribute 'status' is set
        if (session.getAttribute("status") != null) {
    %>
        <script>
            alert('Password is not match');
        </script>
    <%
            // Clear the session attribute after displaying the alert
            session.removeAttribute("status");
        }
    %>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <a href="http://localhost:8080/school_bus/index.jsp"><button type="button" value="go back">go back</button></a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>