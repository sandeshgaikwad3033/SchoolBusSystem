package com.sandesh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sta = request.getParameter("submit");
		String n = request.getParameter("name");
		String ln = request.getParameter("lname");
		String e = request.getParameter("email");
		String sub = request.getParameter("subject");
		String msg = request.getParameter("msg");

		HttpSession session = request.getSession();

		if(sta.equals("submit")) {
		boolean r = DatabaseMethods.contactus(n, ln, e, sub, msg);
		if(r) {

	           session.setAttribute("status", "send the massage");
			response.sendRedirect("user/index.jsp");

		}
		else {

	           session.setAttribute("status", "not send the massage");
			response.sendRedirect("user/index.jsp");
			
		}
		}else if(sta.equals("SEND_MESSAGE")) {
			boolean r = DatabaseMethods.contactus(n, ln, e, sub, msg);
			if(r) {

		           session.setAttribute("status", "send the massage");
				response.sendRedirect("user/index.jsp");

			}
			else {

		           session.setAttribute("status", "not send the massage");
				response.sendRedirect("user/index.jsp");
				
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
