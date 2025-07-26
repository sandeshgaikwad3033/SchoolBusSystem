<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ page session="true" %>
<%

String userProfile = (String) session.getAttribute("user_id");
String userPass = (String) session.getAttribute("user_pass");

if (userProfile == null) {
    response.sendRedirect("../index.jsp");
    return;
}
%>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	PreparedStatement st=con.prepareStatement("select * from users");
	ResultSet rs = st.executeQuery();
		int count = 0;
	while(rs.next()){
		count++;
	}
	st=con.prepareStatement("select * from drivers");
	 rs = st.executeQuery();
		int count1 = 0;
	while(rs.next()){
		count1++;
	}
	st=con.prepareStatement("select * from notification where op = 'admin' and msgdate = CURDATE()");
	 rs = st.executeQuery();
		int count2 = 0;
	while(rs.next()){
		count2++;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style1.css">
     <link rel="stylesheet" href="style2.css">
    <title>Admin Panel</title>
</head>
<body>
<div class="side-menu">
<div class="brand-name">
<h3>School Bus Services</h3>
</div>
<ul>
    
<a href=""><li><img src="" alt="">&nbsp; <span>Dashboard</span> </li></a>
<a href="#1"><li><img src="" alt="">&nbsp;<span>Students</span> </li></a>
<a href="http://localhost:8080/school_bus/admin/signup.jsp"><li><img src="" alt="">&nbsp;<span>Add Drivers</span></li></a>
<a href="#4"><li><img src="" alt="">&nbsp;<span>Notification</span> </li></a>
<a href="#3"><li><img src="" alt="">&nbsp;<span>ContactUs</span> </li></a>
<a href="http://localhost:8080/school_bus/admin/registration/registration.jsp"><li><img src="" alt="">&nbsp; <span>Registration</span></li></a>

<a href="http://localhost:8080/school_bus/LogOutuser" ><li><img src="" alt="">&nbsp;<span>LogOut</span> </li></a>

</ul>
</div>
   
<div class="container">
<div class="header">
<div class="nav">	
<div class="search">
<input type="text" placeholder="Search..">
<button type="submit"><img src="search.png" alt=""></button>
</div>
               
<div class="user">
<a href="http://localhost:8080/school_bus/LogOutuser" class="btn">LogOut</a>
<a href="#4"><img src="no.jpg" alt=""></a>
<div class="img-case">
<img src="<%= userProfile.equals("sandesh") && userPass.equals("sonu@1085") ? "sonu1.png" : "yogesh2.jpeg" %>" alt="">
</div>
</div>
</div>
</div>
<div class="content">

<div class="cards">

<a href="#1">

<div class="card">
<div class="box">
<h1><%= count %></h1>
<h3>Students</h3>
</div>

<div class="icon-case">
<img src="students.png" alt="">
</div>
</div>
</a>




<a href="#2">
<div class="card">
<div class="box">

<h1><%= count1 %></h1>
<h3>Drivers</h3>
</div>

<div class="icon-case">
<img src="teachers.png" alt="">
</div>
</div>
</a>



<a href="#4">
<div class="card">
<div class="box">
<h1><%= count2 %></h1>
<h3>Notification</h3>
</div>

<div class="icon-case">
<img src="schools.png" alt="">
</div>
</div>
</a>

<div class="icon-case">
<img src="income.png" alt="">
</div>
</div>

<section id=1>
<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Students Data</data></h2>
<a href="#" class="btn">View All</a>
</div>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	 st=con.prepareStatement("select * from users");
	 rs = st.executeQuery();

%>
<table>
<tr>
<th>Student Name</th>
<th>Password</th>
<th>email</th>
<th>Mobile No</th>
<th>School Name</th>
<th>Address</th>
<th>Student Location</th>
</tr>
<% while(rs.next()){
	
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("PASS") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("mono") %></td>
<td><%= rs.getString("schoolname") %></td>
<td><%= rs.getString("address") %></td>
<td><a href="<%= rs.getString("location") %>" class="btn">View</a></td>
</tr>
<%
}
%>

</table>


</div>
</div>
</section>
<section id="2">
<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Drivers Data</data></h2>
<a href="#" class="btn">View All</a>
</div>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	PreparedStatement stt=con.prepareStatement("select * from drivers");
	ResultSet rsa = stt.executeQuery();

%>
<table>
<tr>
<th>Driver Name</th>
<th>Password</th>
<th>email</th>
<th>Mobile No</th>
<th>DOB</th>
<th>Address</th>
<th>Gender</th>
</tr>
<% while(rsa.next()){
	
%>
<tr>
<td><%= rsa.getString("name") %></td>
<td><%= rsa.getString("PASS") %></td>
<td><%= rsa.getString("email") %></td>
<td><%= rsa.getString("no") %></td>
<td><%= rsa.getString("dob") %></td>
<td><%= rsa.getString("add") %></td>
<td><%= rsa.getString("gen") %></td>
</tr>
<%
}
%>

</table>


</div>
</div>
</section>
<section id="3">
<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Contact Us Data</data></h2>
<a href="#" class="btn">View All</a>
</div>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection connc = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	PreparedStatement sttm=con.prepareStatement("select * from contactus");
	ResultSet rsas = sttm.executeQuery();

%>
<table>
<tr>
<th>Name</th>
<th>Last Name</th>
<th>Email</th>
<th>Subject</th>
<th>Massage</th>
</tr>
<% while(rsas.next()){
	
%>
<tr>
<td><%= rsas.getString("name") %></td>
<td><%= rsas.getString("lname") %></td>
<td><%= rsas.getString("email") %></td>
<td><%= rsas.getString("subject") %></td>
<td><%= rsas.getString("msg") %></td>
</tr>
<%
}
%>

</table>


</div>
</div>
</section>

<section id="4">
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection connct = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	PreparedStatement sttme=connct.prepareStatement("select * from notification where msgdate = CURDATE()");
	ResultSet rsase = sttme.executeQuery();

%>
         <form action="../Notifications" method="post">
<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Notification</data></h2>
	<input type="text" name="name" value="admin">      		
				<input type="radio" id="option1" name="op" value="user" required>
				<label for="option1">User</label><br>
				<input type="radio" id="option2" name="op" value="driver" required>
				<label for="option2">Driver</label><br>
						<input type="email" name="email" placeholder="Message Receiver Email" required>
						<input type="date" name="date" required>
		
<a href="#" class="btn">View All</a>
</div>
<table>
  <section class="chat">
    <div class="header-chat">
      <i class="icon fa fa-user-o" aria-hidden="true"></i>
      <p class="name">Admin ___________________________________________</p>
      <i class="icon clickable fa fa-ellipsis-h right" aria-hidden="true"></i>
    </div>
    <div class="messages-chat">
      <%
      while(rsase.next()){
    	String op = rsase.getString("op");
    	  if(op.equals("admin"))
    	  {
     		 String sname = rsase.getString("sender_name");
     		 if(sname.equals("user")){
      %>
     <div class="message">
        <div class="photo" style="background-image: url('users.jpg');">
          <div class="online"></div>
        </div>
        <p class="text">USER,<%= rsase.getString("receiver_name") %> </p>
      </div>
      <div class="message text-only">
        <p class="text"><%= rsase.getString("msg") %></p>
      </div>
      <p class="time"><%= rsase.getString("msgdate") %></p>
      <hr>
      <%
     		 }else if(sname.equals("driver")){
     			 
     		 
      %>
      <div class="message">
        <div class="photo" style="background-image: url('drivers.jpg');">
          <div class="online"></div>
        </div>
        <p class="text">DRIVER,<%= rsase.getString("receiver_name") %></p>
      </div>
      <div class="message text-only">
        <p class="text"><%= rsase.getString("msg") %></p>
      </div>
      <p class="time"><%= rsase.getString("msgdate") %></p>
      <hr>
      <%
     		 }
    	  }
      }
      %>
  <div class="footer-cha">
    <i class="icon fa fa-smile-o clickable" style="font-size:25pt;" aria-hidden="true"></i>
    <input type="text" name="msg" class="write-message" placeholder="Type your message here" required>
    <input type="submit" value="sendto" name="submit" class="icon send fa fa-paper-plane-o clickable" aria-hidden="true">
  </div>
  </div>
  
  </section>
  

</table>


</div>
</div>
               <%
                if (session.getAttribute("status") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
                %>
</form>
</section>

</div>
</div>
</body>
</html>
