package com.sandesh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String u=request.getParameter("email");
		String p=request.getParameter("password");
		Boolean r=DatabaseMethods.loginInuser(u, p);

		 HttpSession session = request.getSession();
		 
		if(r)
		{

	           session.setAttribute("user_id", u);
            session.setAttribute("user_pass", p);
			response.sendRedirect("user/index.jsp");
		}
		else
		{
			 session.setAttribute("status", "ID or Password is incorrect....");
			response.sendRedirect("userlogin/login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
