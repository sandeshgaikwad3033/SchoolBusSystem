<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
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
	
	st=con.prepareStatement("select * from notification where op = 'driver' and msgdate = CURDATE()");
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
    <title>Driver Panel</title>
</head>
<body>
<div class="side-menu">
<div class="brand-name">
<h3>School Bus Services</h3>
</div>
<ul>
    
<a href=""><li><img src="" alt="">&nbsp; <span>Dashboard</span> </li></a>
<a href="#1"><li><img src="" alt="">&nbsp;<span>personal Information</span> </li></a>
<a href="http://localhost:8080/school_bus/drivers/Attendance.jsp"><li><img src="" alt="">&nbsp;<span>Student Attendance</span></li></a>
<a href="#2"><li><img src="" alt="">&nbsp;<span>Notification</span> </li></a>
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
Welcome to <%= userProfile %>
</div>

</div>
</div>
<div class="content">

<div class="cards">

<a href="">

<div class="card">
<div class="box">
<h1><%= count %></h1>
<h3>Students Record</h3>
</div>

<div class="icon-case">
<img src="students.png" alt="">
</div>
</div>
</a>




<a href="http://localhost:8080/school_bus/drivers/Attendance.jsp">
<div class="card">
<div class="box">

<h1><%= count %></h1>
<h3>Student Attendance</h3>
</div>

<div class="icon-case">
<img src="teachers.png" alt="">
</div>
</div>
</a>



<a href="#2">
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


<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Student Information</h2>
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

<section id="1">
<div class="content-2">
<div class="recent-payments">
<div class="title">
<h2>Your  Information</h2>
<a href="#" class="btn">View All</a>
</div>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
	
	if(con!=null)
	{
		//System.out.println("connected...");
	}
	 st=con.prepareStatement("select * from drivers where email= ?");
	 st.setString(1, userProfile);
	 rs = st.executeQuery();

%>
<table>
<tr>
<th>Name</th>
<th>email</th>
<th>Address</th>
<th>Mobile No</th>
<th>DOB</th>
<th>Gender</th>
<th>Password</th>
</tr>
<% while(rs.next()){
	
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("add") %></td>
<td><%= rs.getString("no") %></td>
<td><%= rs.getString("dob") %></td>
<td><%= rs.getString("gen") %></td>
<td><%= rs.getString("pass") %></td>
</tr>
<%
}
%>

</table>

</div>
</div>
</section>
<section id="2">
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
	<input type="text" name="name" value="driver">      		
				<input type="radio" id="option1" name="op" value="user" required>
				<label for="option1">User</label><br>
				<input type="radio" id="option2" name="op" value="admin" required>
				<label for="option2">Admin</label><br>
						<input type="email" name="email" placeholder="Message Receiver Email" required>
						<input type="date" name="date" required>
		
<a href="#" class="btn">View All</a>
</div>
<table>
  <section class="chat">
    <div class="header-chat">
      <i class="icon fa fa-user-o" aria-hidden="true"></i>
      <p class="name">Drivers ___________________________________________</p>
      <i class="icon clickable fa fa-ellipsis-h right" aria-hidden="true"></i>
    </div>
    <div class="messages-chat">
      <%
      while(rsase.next()){
    	String op = rsase.getString("op");
    	  if(op.equals("driver"))
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
     		 }else if(sname.equals("admin")){
     			 
     		 
      %>
      <div class="message">
        <div class="photo" style="background-image: url('admin.png');">
          <div class="online"></div>
        </div>
        <p class="text">Admin,</p>
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
    <input type="submit" value="sends" name="submit" class="icon send fa fa-paper-plane-o clickable" aria-hidden="true">
  </div>
  </div>
  
  </section>
  

</table>


</div>
</div>
</form>
              <%
                if (session.getAttribute("status") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
                %>
</section>

</div>
</div>
</body>
</html>
