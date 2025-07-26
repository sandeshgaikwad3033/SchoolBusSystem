<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}

.btn {
    background: #f3bc8c;
    color: white;
    padding: 5px 10px;
    text-align: center;
}
.btn:hover {
    color: #f05462;
    background: white;
    padding: 3px 8px;
    border: 2px solid #f05462;
}

/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}


  input {
  
  border:none;
  outline: none;
  }
  
</style>
</head>
<body>
<%
if (session.getAttribute("status") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
if (session.getAttribute("massage") != null) {
    out.println("<script>alert('" + session.getAttribute("massage") + "')</script>");
    session.removeAttribute("status");
}

%>
<%
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
        
        if (con != null) {
            // System.out.println("connected...");
        }
        
        st = con.prepareStatement("SELECT * FROM signup");
        rs = st.executeQuery();
%>
<section>
  <!--for demo wrap-->
  <h1>Users Registration</h1>
  
           <a href="http://localhost:8080/school_bus/admin/index.jsp"> <button type="">Back</button></a>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>name</th>
          <th>email</th>
          <th>age</th>
          <th>mobile no</th>
          <th>address</th>
          <th>image</th>
          <th>school name</th>
          <th>location</th>
          <th>password</th>
          <th>oprations</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
       
<form action ="../../Stu_opration" method="post">
<% 
        while (rs.next()) { 
%>
<tr>
<td><input type="text" name="name" value="<%= rs.getString("name") %> " required></td>
<td><input type="text" name="email" value="<%= rs.getString("email") %>" required></td>
<td><input type="text" name="age" value="<%= rs.getString("age") %>" required></td>
<td><input type="text" name="mono" value="<%= rs.getString("mono") %>" required></td>
<td><input type="text" name="address" value="<%= rs.getString("add") %>" required></td>
<td><input type="text" name="img" value="<%= rs.getString("img") %>" required></td>
<td><input type="text" name="schoolname" required></td>
<td><input type="text" name="location" required></td>
<td><input type="text" name="pass" required></td>
<td><input type="submit" name="submit" value="delete" class="btn"><input type="submit" name="submit" value="add" class="btn"></td>



</tr>
</form>
<%
       }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of their creation
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (st != null) try { st.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>

      </tbody>
    </table>
                   <%
                if (session.getAttribute("status") != null) {
    out.println("<script>alert('" + session.getAttribute("status") + "')</script>");
    session.removeAttribute("status");
}
                %>
 
  </div>
</section>


<!-- follow me template -->
<div class="made-with-love">
  Made with
  <i>♥</i> by
  <a target="_blank" href="">Sandesh & Yogesh</a>
</div>
<script type="text/javascript">
//'.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();
</script>
</body>
</html>