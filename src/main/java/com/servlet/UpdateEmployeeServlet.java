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

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 1. THIS HANDLES THE SEARCH (GET REQUEST)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("empno");
        
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                EmployeeDAO dao = new EmployeeDAO();
                Employee e = dao.getEmployeeById(id); // Ensure this method exists in your DAO
                
                // --- Update Start ---
                if (e == null) {
                    request.setAttribute("errorMessage", "Employee with ID " + id + " does not exist!");
                } else {
                    request.setAttribute("emp", e); // Send data to JSP
                }
                // --- Update End ---
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // Forward to the JSP page
        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
    }
    // 2. THIS HANDLES THE UPDATE (POST REQUEST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            int id = Integer.parseInt(request.getParameter("empno"));
            String name = request.getParameter("empname");
            String doj = request.getParameter("doj");
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("bsalary"));
            
            // Validation
            if (!name.matches("^[a-zA-Z\\s]+$")) {
                out.print("<html><body style='font-family: Arial; text-align: center; padding-top: 50px;'>");
                out.print("<h2 style='color:red'>Invalid Name! Only alphabets are allowed.</h2>");
                out.print("<a href='javascript:history.back()'>Go Back</a>");
                out.print("</body></html>");
                return;
            }

            Employee e = new Employee();
            e.setEmpno(id);
            e.setEmpName(name);
            e.setDoj(doj);
            e.setGender(gender);
            e.setBsalary(salary);

            EmployeeDAO dao = new EmployeeDAO();
            int result = dao.updateEmployee(e);

            out.print("<html><body style='font-family: Arial; text-align: center; padding-top: 50px;'>");
            if (result > 0) {
                out.print("<h2 style='color: green;'>✅ Employee Updated Successfully!</h2>");
            } else {
                out.print("<h2 style='color: red;'>❌ Update Failed. ID Not Found.</h2>");
            }
            out.print("<br><a href='index.jsp'>Back to Dashboard</a>");
            out.print("</body></html>");

        } catch (Exception ex) {
            out.print("<h3 style='color: red;'>Error: " + ex.getMessage() + "</h3>");
            out.print("<a href='empupdate.jsp'>Go Back</a>");
        }
    }
}
