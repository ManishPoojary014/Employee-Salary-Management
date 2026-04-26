package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.EmployeeDAO;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            int id = Integer.parseInt(request.getParameter("empno"));
            EmployeeDAO dao = new EmployeeDAO();
            int result = dao.deleteEmployee(id);

            if (result > 0) {
                out.print("<body style='font-family:Arial; text-align:center; padding-top:50px;'>");
                out.print("<h2 style='color:green;'>Employee ID " + id + " Deleted Successfully!</h2>");
                out.print("<a href='index.jsp'>Back to Menu</a>");
                out.print("</body>");
            } else {
                out.print("<h3 style='color:red;'>Error: Employee ID not found.</h3>");
                out.print("<a href='empdelete.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
}