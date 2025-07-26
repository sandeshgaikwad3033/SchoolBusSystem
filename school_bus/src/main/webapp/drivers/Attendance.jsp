<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Template</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%

String userProfile = (String) session.getAttribute("user_id");
String userPass = (String) session.getAttribute("user_pass");

    Connection con = null;
    PreparedStatement st = null;
    String message = "";

    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String date = request.getParameter("date");
      

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");

            // Prepare to insert the attendance records
            String insertQuery = "INSERT INTO attendance (name, email, Adate, Atten, dname) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(insertQuery);

            // You should keep track of all user IDs you've processed
            for (int userId = 1; userId <= 100; userId++) { // Adjust based on actual number of users
                String attendanceStatus = request.getParameter("attendance" + userId);
                if (attendanceStatus != null) { // Check if attendance was recorded
                    String name = request.getParameter("name" + userId);
                    String email = request.getParameter("email" + userId);

                    if (name != null && email != null) { // Ensure both name and email are present
                        pst.setString(1, name);
                        pst.setString(2, email);
                        pst.setString(3, date);
                        pst.setString(4, attendanceStatus);
                        pst.setString(5, userProfile);
                        pst.addBatch(); // Add to batch
                    }
                }
            }

            // Execute the batch insert
            pst.executeBatch();
            message = "Attendance recorded successfully!";
        } catch (Exception e) {
            message = "Error recording attendance: " + e.getMessage();
        } finally {
            try {
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Fetch users for the attendance form
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus", "root", "");
        st = con.prepareStatement("SELECT * FROM users");
        ResultSet rs = st.executeQuery();
%>
    <div class="container">
    
           <a href="http://localhost:8080/school_bus/drivers/index.jsp"> <button type="">Back</button></a>
        <h1>Attendance Sheet</h1>
        <p><%= message %></p>
        <form action="" method="post">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Present</th>
                        <th>Absent</th>
                    </tr>
                </thead>
                <tbody>
                <%
                while (rs.next()) {
                    String userId = rs.getString("id"); // Assuming there's an 'id' column in the users table
                %>
                    <tr>
                        <td><input type="text" name="name<%= userId %>" value="<%= rs.getString("name") %>" readonly></td>
                        <td><input type="text" name="email<%= userId %>" value="<%= rs.getString("email") %>" readonly></td>
                        <td><input type="radio" name="attendance<%= userId %>" value="present"></td>
                        <td><input type="radio" name="attendance<%= userId %>" value="absent"></td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>
            <button type="submit">Submit</button>
        </form>
    </div>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
