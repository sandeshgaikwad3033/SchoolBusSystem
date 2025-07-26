<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="home\style.css">
    <title>school bus</title>   
</head>
<body>
    <nav>
        <div class="logo">
            <h1>School Bus System</h1>
        </div>
        <div class="links">
            <div class="link" data-aos="fade-up" data-aos-duration="1200"><a href="">Home</a></div>
            <div class="link" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="100"><a href="aboutus\index.html">About</a></div>
            <div class="link" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="200"><a href="services\services.jsp">Services</a></div>
            <div class="link" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="300"><a href="drivers\login.jsp">Drivers</a></div>
            <div class="link" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="400"><a href="contactus\contactus.jsp">Contact</a></div>
            <div class="link" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="500"><a href="admin\login.jsp">Admin</a></div>
        </div>
        <div class="buttons">
            <button data-aos="fade-up" data-aos-duration="1200" data-aos-delay="800"><a href="userlogin\login.jsp">Login</a></button>
            <button data-aos="fade-up" data-aos-duration="1200" data-aos-delay="900"><a href="usersingup\singup.jsp">Sign up</a></button>
        </div>
    </nav>
    <section>
        <div class="content">
            <h1 data-aos="fade-right" data-aos-duration="2000" data-aos-delay="900">"Your child’s safety is our journey’s top destination."</h1>
            <p data-aos="fade-left" data-aos-duration="2000" data-aos-delay="1000">Welcome to our digital school bus .</p>
           <a href="services\services.jsp"> <button data-aos="zoom-in" data-aos-duration="2000" data-aos-delay="1200">
            CLICK HERE</button></a>
        </div>
                       <%
                if (session.getAttribute("status") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
                %>
                               <%
                if (session.getAttribute("status1") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
                %>
    </section>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init();
    </script>
</body>
</html>