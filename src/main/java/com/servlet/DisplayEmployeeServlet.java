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

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Adding the CSS styles directly in the Servlet for a nice look
        out.print("<html><head><style>");
        out.print("body { font-family: 'Segoe UI', Arial; background: #eef2f3; padding: 50px; text-align: center; }");
        out.print(".result-card { background: white; padding: 30px; display: inline-block; border-radius: 12px; box-shadow: 0 8px 20px rgba(0,0,0,0.1); border-top: 5px solid #2ecc71; text-align: left; min-width: 300px; }");
        out.print("h2 { color: #2c3e50; border-bottom: 1px solid #eee; padding-bottom: 10px; }");
        out.print("p { font-size: 18px; color: #34495e; margin: 10px 0; }");
        out.print(".btn-back { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 5px; }");
        out.print("</style></head><body>");

        try {
            // Get the ID entered in the search box
            int id = Integer.parseInt(request.getParameter("empno"));
            
            EmployeeDAO dao = new EmployeeDAO();
            Employee e = dao.getEmployeeById(id);

            if (e != null) {
                out.print("<div class='result-card'>");
                out.print("<h2>Employee Found!</h2>");
                out.print("<p><b>ID:</b> " + e.getEmpno() + "</p>");
                out.print("<p><b>Name:</b> " + e.getEmpName() + "</p>");
                out.print("<p><b>Joined:</b> " + e.getDoj() + "</p>");
                out.print("<p><b>Gender:</b> " + e.getGender() + "</p>");
                out.print("<p><b>Salary:</b> &#8377; " + e.getBsalary() + "</p>");
                out.print("</div>");
            } else {
                out.print("<div style='background: white; padding: 20px; display: inline-block; border-radius: 10px;'>");
                out.print("<h3 style='color:red;'>No record found for ID: " + id + "</h3>");
                out.print("</div>");
            }
            
            out.print("<br><br><a href='empdisplay.jsp' class='btn-back'>← Search Again</a>");
            out.print("<br><a href='index.jsp' style='color: #7f8c8d; text-decoration: none; font-size: 14px;'>Back to Main Menu</a>");
            
        } catch (Exception ex) {
            out.print("<p style='color:red;'>Error: " + ex.getMessage() + "</p>");
        }
        out.print("</body></html>");
    }
}
