package com.sandesh;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;

import java.io.File;
/**
 * Servlet implementation class DriversRegistration
 */
@WebServlet("/DriversRegistration")
public class DriversRegistration extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String img = request.getParameter("img");
		String n = request.getParameter("name");
		String E = request.getParameter("email");
		String ad = request.getParameter("address");
		String no = request.getParameter("no");
		String dob = request.getParameter("dob");
		String gen = request.getParameter("gen");
		String pass = request.getParameter("pass");
		
		boolean r = DatabaseMethods.signUpdrivers(n, E, ad, no, dob, gen, pass, img);
		
		  // Define absolute source and destination directories
        String sourceDir = "C:/Users/LENOVO/Downloads"; // Full path to the source folder
        String destDir = "C:\\Users\\LENOVO\\eclipse-workspace\\school_bus\\src\\main\\webapp\\user"; // Destination path

        // Define source and destination file paths
        File sourceFile = new File(sourceDir, img);
        File destFile = new File(destDir, img);

        // Prepare the response writer
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Check if the source file exists
        if (sourceFile.exists() && !sourceFile.isDirectory()) {
            // Ensure the destination directory exists
            File destFolder = new File(destDir);
            if (!destFolder.exists()) {
                destFolder.mkdirs(); // Create the destination folder if it doesn't exist
                out.println("<p>Destination folder created: " + destDir + "</p>");
            }

                Files.copy(sourceFile.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                out.println("<h3>Error occurred while copying the image: </h3>");
        } else {
            out.println("<h3>Error: Source image '" + img + "' does not exist in '" + sourceDir + "'!</h3>");
            out.println("<p>Checked file path: " + sourceFile.getAbsolutePath() + "</p>");
        }

        HttpSession session = request.getSession();
        
		if(r) {
			session.setAttribute("status", "send the data in data base");
            
			response.sendRedirect("admin/drivers/index.jsp");

		}
		else {
			session.setAttribute("status", "not send the data in data base");
            
			response.sendRedirect("admin/drivers/signup.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
