<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

        Only photos in the Downloads folder will be accessed
  <div class="container" id="container">
    <div class="form-container sign-in-container">
      <form action="../UserRegistration" method="post">
        <h1>SignUp</h1>
        <input type="file" name="img" placeholder="" required />
        <input type="text" name="name" placeholder="User Name" required />
        <input type="email" name="email"placeholder="Email" required />
        <input type="text" name="no" placeholder="Mobile NO" required />
        <input type="text" name="age" placeholder="age"required />
        <textarea name="add" id="" placeholder="Permanent Address" required></textarea>
        <button type="submit">Sign Up</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-right">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button type="button" onclick="history.back()">go back</button>
        </div>
      </div>
    </div>
  </div>
 
</body>
</html>