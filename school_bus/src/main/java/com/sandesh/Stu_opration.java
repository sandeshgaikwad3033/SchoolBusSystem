package com.sandesh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Stu_opration
 */
@WebServlet("/Stu_opration")
public class Stu_opration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        String result = request.getParameter("submit");
        if ("add".equals(result)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String age = request.getParameter("age");
            String mono = request.getParameter("mono");
            String address = request.getParameter("address");
            String schoolname = request.getParameter("schoolname");
            String location = request.getParameter("location");
            String pass = request.getParameter("pass");
            String img = request.getParameter("img");
            
        
            boolean r = DatabaseMethods.studata(name, email, age, mono, address, schoolname, location, pass, img);
            boolean r2 = DatabaseMethods.DeleteRegistration(name);
            if (r) {
                session.setAttribute("status", "Data is stored in the database.");
                response.sendRedirect("admin/registration/registration.jsp");		
            } else {
                session.setAttribute("status", "Data is not stored in the database.");
                response.sendRedirect("admin/registration/registration.jsp");	
            }
        } else if ("delete".equals(result)) {
            String name = request.getParameter("name");
            boolean r = DatabaseMethods.DeleteRegistration(name);
            
            if (r) {
                session.setAttribute("status", "Data is deleted from the database.");
                response.sendRedirect("admin/registration/registration.jsp");	
            } else {
                session.setAttribute("status", "Data is not deleted from the database.");
                response.sendRedirect("admin/registration/registration.jsp");
            }
        }
    }
}
