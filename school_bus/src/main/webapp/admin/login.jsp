<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin login page</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <header>
  </header>
  <div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
  </div>
  <form method="post" action="../AdminLogin">
    <h3>Only Admin Login Here</h3>
    
    <label for="username">Username</label>
    <input type="text" placeholder="Email or Phone" name="name">
    
    <label for="password">Password</label>
    <input type="password" placeholder="Password" name="password">
    
    <button type="submit">Log In</button>
          <a href="http://localhost:8080/school_bus/index.jsp"><input type="button" value="go back"></a>
    <div class="social">
    </div>
  </form>
        <%
        // Display an alert if the session attribute 'status' is set
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
</body>
</html>