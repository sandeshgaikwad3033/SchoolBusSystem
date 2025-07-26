package com.sandesh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Notifications
 * @param <Date>
 */
@WebServlet("/Notifications")
public class Notifications extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        
		String result = request.getParameter("submit");
		String sname = request.getParameter("name");
		String rname = request.getParameter("email");

		String op = request.getParameter("op");
		String date = request.getParameter("date");
		String msg = request.getParameter("msg");
		
		
		if("send".equals(result)) {
			
			boolean r = DatabaseMethods.notification(sname,rname,op,date,msg);
			
			if(r) {
                session.setAttribute("status", "massage is send");
                response.sendRedirect("user/index.jsp");
			}else {

				session.setAttribute("status", "massage is not send ");
                response.sendRedirect("user/index.jsp");
			}
		}
		
		if("sendto".equals(result)) {
			
			boolean r = DatabaseMethods.notification(sname,rname,op,date,msg);
			
			if(r) {

                session.setAttribute("status", "send the massage.");
                response.sendRedirect("admin/index.jsp");
			}else {

                session.setAttribute("status", "not send the massage.");
                response.sendRedirect("admin/index.jsp");
			}
		}
		
		if("sends".equals(result)) {
			
			boolean r = DatabaseMethods.notification(sname,rname,op,date,msg);
			
			if(r) {

                session.setAttribute("status", "send the massage.");
                response.sendRedirect("drivers/index.jsp");
			}else {

                session.setAttribute("status", "not send the massage");
                response.sendRedirect("drivers/index.jsp");
			}
		}
	}

}
