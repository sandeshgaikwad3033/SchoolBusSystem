package com.sandesh;

import java.io.File;
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

@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String img = request.getParameter("img");
        String n = request.getParameter("name");
        String sn = request.getParameter("sname");
        String e = request.getParameter("email");
        String no = request.getParameter("no");
        String age = request.getParameter("age");
        String ad = request.getParameter("add");

        boolean r = DatabaseMethods.signUpinuser(n, e, no, age, ad, img);

        // Define absolute source and destination directories
        String sourceDir = "C:/Users/LENOVO/Downloads"; // Full path to the source folder
        String destDir = "C:\\Users\\LENOVO\\eclipse-workspace\\school_bus\\src\\main\\webapp\\user";
        //"D:\\frontend\\cakeshop\\public\\img\\imagesss";
     // Destination path
        
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
        // Redirect based on the result of sign up
        if (r) {
	           session.setAttribute("status1", "data is submited..");
            response.sendRedirect("index.jsp");
        } else {
	           session.setAttribute("status1", "data is not submited..");
            response.sendRedirect("usersingup/singup.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
