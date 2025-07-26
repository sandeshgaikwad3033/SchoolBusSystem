<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;

String userProfile = (String) session.getAttribute("user_id");
String userPass = (String) session.getAttribute("user_pass");

if (userProfile == null) {
    response.sendRedirect("../index.jsp");
    return;
}
String location = null;
String img = null;


Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
st=con.prepareStatement("select * from notification where receiver_name = ? and op = 'user' and msgdate = CURDATE()");
st.setString(1, userProfile);
rs = st.executeQuery();
	int count2 = 0;
while(rs.next()){
	count2++;
}
%>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");

    // Query for users
    st = con.prepareStatement("SELECT * FROM users");
    rs = st.executeQuery();

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="style1.css">
  
  <link rel="stylesheet" href="style2.css">
  <link rel="stylesheet" href="style3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>User</title>

</head>
<body>

<%
    boolean userFound = false;
    while (rs.next()) {
        String email = rs.getString("email");
        if (email.equals(userProfile)) {
            userFound = true;
            img = rs.getString("img");
            location = rs.getString("location");
%>
    <!-- SIDEBAR -->
    <section id="sidebar">
        <a href="#" class="brand">
            <i class='bx bxs-smile'></i>
            <span class="text">School Bus Services</span>
        </a>
        <ul class="side-menu top">
            <li class="active"><a href="#0"><i class='bx bxs-dashboard'></i><span class="text">Dashboard</span></a></li>
            <li><a href="#1"><i class='bx bxs-shopping-bag-alt'></i><span class="text">Month Attendance</span></a></li>
            <li><a href="<%= location %>"><i class='bx bxs-doughnut-chart'></i><span class="text">Pickup Location</span></a></li>
            <li><a href="#3"><i class='bx bxs-message-dots'></i><span class="text">Notification</span></a></li>
            <li><a href="#2"><i class='bx bxs-group'></i><span class="text">Driver Details</span></a></li>
        </ul>
        <ul class="side-menu">
            <li><a href="#5"><i class='bx bxs-cog'></i><span class="text">Help and Support</span></a></li>
            <li><a href="http://localhost:8080/school_bus/LogOutuser" class="logout"><i class='bx bxs-log-out-circle'></i><span class="text">Logout</span></a></li>
        </ul>
    </section>
    <!-- SIDEBAR -->

    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#">
                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                </div>
            </form>
            <input type="checkbox" id="switch-mode" hidden>
            <label for="switch-mode" class="switch-mode"></label>
            <a href="#3" class="notification"><i class='bx bxs-bell'></i><span class="num"><%= count2 %></span></a>

            <a href="#" class="profile">
                <img src="<%= img %>">
            </a>
<hr>
<%
        }
    }
    if (!userFound) {
        response.sendRedirect("../index.jsp");
    }
} catch (SQLException e) {
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
         
        <section id="0">
            <ul class="box-infoo">
            <a href="<%= location %>">
                <li>
                <i class='bx bxs-doughnut-chart'></i>
                    <span class="text">
                        <h3></h3>
                        <p><b>Pickup Location</b></p>
                    </span>
                </li>
                </a>
                <a href="#3">
                <li>
					<i class='bx bxs-bell'></i>
					 <span class="text">
                        <h3></h3>
                        <p><b>Notification</b></p>
                    </span>
                </li>
                </a>
                <a href="#1">
                <li>
                <i class='bx bxs-shopping-bag-alt'></i><span class="text">
                    <span class="text">
                        <h3></h3>
                        <p><b>Month Attendance</b></p>
                    </span>
                </li>
                </a>
            </ul>
            </section>
<br><br><br><br>
<%
Connection conn = null;
PreparedStatement sttm = null;
ResultSet rsa = null;
String dname = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
    
    // Query for attendance with ordering
   // sttm = conn.prepareStatement("SELECT * FROM attendance WHERE email = ? ORDER BY Adate DESC");
    		
    sttm = conn.prepareStatement("SELECT * FROM attendance WHERE email = ? AND Adate = CURDATE()");
    sttm.setString(1, userProfile);
    rsa = sttm.executeQuery();
    %>
            <div class="table-data">
            <div class="todo">
                    <div class="head">
                        <h3>Today Attendance</h3>
                    </div>
                    <ul class="todo-list">

<%

    while (rsa.next()) {
        String atten = rsa.getString("Atten");
        String date = rsa.getString("Adate");  
        dname = rsa.getString("dname");
        
 %>
        
        <li class="<%= "present".equals(atten) ? "completed" : "not-completed" %>">
            <p><%= atten %></p>
            <p><%= date %></p>
        </li>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rsa != null) rsa.close();
        if (sttm != null) sttm.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>    

                    </ul>
                </div>
            
                <div class="order">
                    <div class="head">
                        <h3>Today's Driver</h3>
                        <i class='bx bx-search'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Driver Name</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
 <%
                        try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");

    // Query for drivers
    st = con.prepareStatement("SELECT * FROM drivers");
    rs = st.executeQuery();
    String driverName = null, driverImg = null;
	while(rs.next()){
        String email = rs.getString("email");
        if(email.equals(dname)) {
        	driverImg = rs.getString("img");
        	driverName = rs.getString("name");
%>
                             <tr>
                               <td><img src="<%= driverImg %>"><p><%= driverName != null ? driverName : "N/A" %></p></td>
                                <td><span class="status completed">Assigned To</span></td>
                            </tr>
                            							<%
        }
	}
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>
      
                        </tbody>
                    </table>

                </div>
           </div>
 <br><br><br><br>
		<section id="1">
            <div class="table-data">
       <%
       			try{
       				Class.forName("com.mysql.cj.jdbc.Driver");
       			    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
       			    
       			    // Query for attendance with ordering
       			   sttm = conn.prepareStatement("SELECT * FROM attendance WHERE email = ? ORDER BY Adate DESC");
       			    		  sttm.setString(1, userProfile);
  							  rsa = sttm.executeQuery();
       					
       %>
                <div class="order">
                    <div class="head">
                        <h3>Month Attendance</h3>
                        <i class='bx bx-search'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                    <table>
						<thead>
							<tr>
								<th>Student</th>
								<th>Email</th>
								<th>Driver Email</th>
								<th>Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
<%

    while (rsa.next()) {
        String atten = rsa.getString("Atten");
       
        
 %>
							<tr>
								<td>
									<img src="<%= img %>">
									<p><%= rsa.getString("name") %></p>
								</td>
								<td><%= rsa.getString("email") %></td>
								<td><%= rsa.getString("dname") %></td>
								<td><%= rsa.getString("Adate") %></td>
								
								<td><span class="<%= "present".equals(atten) ? "status completed" :"status pending" %>" > <%= atten %></span></td>
							</tr>
							
							<%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rsa != null) rsa.close();
        if (sttm != null) sttm.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>    
                        </tbody>
                    </table>

                </div>
           </div>
         </section>  
     <br><br><br><br>
		<section id="2">
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
	    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
	    
	    sttm = conn.prepareStatement("SELECT * FROM drivers");
	    rsa = sttm.executeQuery();
	    
		%>
            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Driver Details</h3>
                        <i class='bx bx-search'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                    <table>
						<thead>
							<tr>
								<th>name</th>
								<th>Email</th>
								<th>address</th>
								<th>Mobile</th>
								<th>DOB</th>
								<th>gender</th>
							</tr>
						</thead>
						<tbody>
						<%
						while(rsa.next()){
						
						%>
							<tr>
								<td>
									<img src="<%= rsa.getString("img") %>">
									<p><%= rsa.getString("name") %></p>
								</td>
								<td><%= rsa.getString("email") %></td>						
								<td><%= rsa.getString("add") %></td>
								<td><%= rsa.getString("no") %></td>						
								<td><%= rsa.getString("dob") %></td>						
								<td><%= rsa.getString("gen") %></td>						
							</tr>
							<%
						}
							%>
						
                        </tbody>
                    </table>
                </div>
           </div>
         </section>
         <br><br><br><br>
   <section id="3">
                <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connct = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");

                PreparedStatement sttme = connct.prepareStatement("select * from notification where receiver_name = ? AND msgdate = CURDATE()");
                sttme.setString(1, userProfile);
                ResultSet rsase = sttme.executeQuery();
                %>

                <form action="../Notifications" method="post">
                    <div class="table-data">
                    
                        <div class="order">
                            <div class="head">
                                <h3>Send Notification</h3>
                                <input type="email" name="email" value="<%= userProfile %>" required>
                                <input type="text" name="name" value="user">
                                <input type="radio" id="option1" name="op" value="admin" required>
                                <label for="option1">Admin</label><br>
                                <input type="radio" id="option2" name="op" value="driver" required>
                                <label for="option2">Driver</label><br>
                                <input type="date" name="date" required>
                            </div>
 								
  <section class="chat">
    <div class="header-chat">
      <i class="icon fa fa-user-o" aria-hidden="true"></i>
      <p class="name">USER ___________________________________________</p>
      <i class="icon clickable fa fa-ellipsis-h right" aria-hidden="true"></i>
    </div>
                            <div class="messages-chat">
                                <%
                                while (rsase.next()) {
                                    String op = rsase.getString("op");
                                    String senderName = rsase.getString("sender_name");
                                    String msg = rsase.getString("msg");
                                    String msgDate = rsase.getString("msgdate");
                                    if ("admin".equals(senderName)) {
                                %>
     <div class="message">
        <div class="photo" style="background-image: url('admin.png');">
          <div class="online"></div>
        </div>
        <p class="text">ADMIN,</p>
      </div>
      <div class="message text-only">
        <p class="text"><%= rsase.getString("msg") %></p>
      </div>
      <p class="time"><%= rsase.getString("msgdate") %></p>
      <hr>
                                <%
                                    } else if ("driver".equals(senderName)) {
                                %>
     <div class="message">
        <div class="photo" style="background-image: url('drivers.jpg');">
          <div class="online"></div>
        </div>
        <p class="text">DRIVERS,</p>
      </div>
      <div class="message text-only">
        <p class="text"><%= rsase.getString("msg") %></p>
      </div>
      <p class="time"><%= rsase.getString("msgdate") %></p>
      <hr>
                                <%
                                    }
                                }
                                %>
                                
  <div class="footer-cha">
    <i class="icon fa fa-smile-o clickable" style="font-size:25pt;" aria-hidden="true"></i>
    <input type="text" name="msg" class="write-message" placeholder="Type your message here" required>
    <input type="submit" value="send" name="submit" class="icon send fa fa-paper-plane-o clickable" aria-hidden="true">
  </div>
                            </div>
                            
                    </section>
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
            <br><br><br>
        <section id="5">
              <div class="table-data">
              
                        <div class="order">
                       
    <div class="contact_us_green">
        <div class="responsive-container-block big-container">
          <div class="responsive-container-block container">

            <div class="responsive-cell-block wk-tab-12 wk-mobile-12 wk-desk-5 wk-ipadp-10" id="ifgi">
              <div class="container-box">
                <div class="text-content">
                  <p class="text-blk contactus-head">
                    Contact us
                  </p>
                  <p class="text-blk contactus-subhead">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al iqua. Ut enim
                  </p>
                </div>
                <div class="workik-contact-bigbox">
                  <div class="workik-contact-box">
                    <div class="phone text-box">
                      <img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET21.jpg">
                      <p class="contact-text">
                        +91 7229626429 / +91 7263077619
                      </p>
                    </div>
                    <div class="address text-box">
                      <img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET22.jpg">
                      <p class="contact-text">
                       schoolbus@gmail.com
                      </p>
                    </div>
                    <div class="mail text-box">
                      <img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET23.jpg">
                      <p class="contact-text">
                        Hasapsar pune AM college Manjari 
                      </p>
                    </div>
                  </div>
                  <div class="social-media-links">
                    <a href="">
                      <img class="social-svg" id="is9ym" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/gray-mail.svg">
                    </a>
                    <a href="">
                      <img class="social-svg" id="i706n" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/gray-twitter.svg">
                    </a>
                    <a href="">
                      <img class="social-svg" id="ib9ve" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/gray-insta.svg">
                    </a>
                    <a href="">
                      <img class="social-svg" id="ie9fx" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/gray-fb.svg">
                    </a>
                  </div>
                </div>
              </div>
            </div>
           <div class="responsive-cell-block wk-tab-12 wk-mobile-12 wk-desk-7 wk-ipadp-10 line" id="i69b-2">
              <form class="form-box" action="../ContactUs" method="post">
                <div class="container-block form-wrapper">
                  <div class="head-text-box">
                    <p class="text-blk contactus-head">
                      Contact us
                    </p>
                    <p class="text-blk contactus-subhead">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al iqua. Ut enim
                    </p>
                  </div>
                  <div class="responsive-container-block">
                    <div class="responsive-cell-block wk-ipadp-6 wk-tab-12 wk-mobile-12 wk-desk-6" id="i10mt-6">
                      <p class="text-blk input-title">
                        FIRST NAME
                      </p>
                      <input class="input" id="ijowk-6" name="name">
                    </div>
                    <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                      <p class="text-blk input-title">
                        LAST NAME
                      </p>
                      <input class="input" id="indfi-4" name="lname">
                    </div>
                    <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                      <p class="text-blk input-title">
                        EMAIL
                      </p>
                      <input class="input" id="ipmgh-6" name="email">
                    </div>
                    <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                      <p class="text-blk input-title">
                        SUBJECT
                      </p>
                      <input class="input" id="imgis-5" name="subject">
                    </div>
                    <div class="responsive-cell-block wk-tab-12 wk-mobile-12 wk-desk-12 wk-ipadp-12" id="i634i-6">
                      <p class="text-blk input-title">
                        WHAT DO YOU HAVE IN MIND
                      </p>
                      <textarea class="textinput" name="msg" id="i5vyy-6" placeholder="Please enter query..."></textarea>
                    </div>
                  </div>
                  <div class="btn-wrapper">
                    <button class="submit-btn" value="submit" name="submit">
                      Submit
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
                       
                        </div>
              </div>
              </section>
            
            	</main>
        <!-- MAIN -->
    </section>
    <!-- CONTENT -->
    <script src="script.js"></script>
</body>
</html>
