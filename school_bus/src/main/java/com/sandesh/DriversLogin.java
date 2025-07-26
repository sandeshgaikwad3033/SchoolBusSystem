package com.sandesh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DriversLogin
 */
@WebServlet("/DriversLogin")
public class DriversLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String u=request.getParameter("email");
		String p=request.getParameter("password");
		System.out.println(u);
		System.out.println(p);
		Boolean r=DatabaseMethods.loginDriver(u, p);

		 HttpSession session = request.getSession();
		 
		if(r)
		{

	           session.setAttribute("user_id", u);
            session.setAttribute("user_pass", p);
			response.sendRedirect("drivers/index.jsp");
		}
		else
		{
			 session.setAttribute("status", "ID or Password is incorrect....");
			response.sendRedirect("drivers/login.jsp");
		}
	}

}
