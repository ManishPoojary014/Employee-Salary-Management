package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.EmployeeDAO;
import com.model.Employee;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    
    // 1. SEARCH: Fetches the data to display for confirmation
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("empno");
        
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                EmployeeDAO dao = new EmployeeDAO();
                Employee e = dao.getEmployeeById(id);
                if (e == null) {
                    // This creates the error message
                    request.setAttribute("error", "Employee ID " + id + " not found!");
                }
                request.setAttribute("emp", e); // Send data to JSP
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("empdelete.jsp").forward(request, response);
    }

    // 2. DELETE: Executes the permanent removal
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            int id = Integer.parseInt(request.getParameter("empno"));
            EmployeeDAO dao = new EmployeeDAO();
            int result = dao.deleteEmployee(id);

            out.print("<body style='font-family:Arial; text-align:center; padding-top:50px;'>");
            if (result > 0) {
                out.print("<h2 style='color:green;'>✅ Employee ID " + id + " Deleted Successfully!</h2>");
            } else {
                out.print("<h2 style='color:red;'>❌ Delete Failed. ID Not Found.</h2>");
            }
            out.print("<br><a href='index.jsp'>Back to Menu</a>");
            out.print("</body>");
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
}
