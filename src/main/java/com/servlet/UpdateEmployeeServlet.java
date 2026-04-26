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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            // 1. Capture data from the empupdate.jsp form
            int id = Integer.parseInt(request.getParameter("empno"));
            String name = request.getParameter("empname");
            String doj = request.getParameter("doj");
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("bsalary"));

            // 2. Put data into the Employee model object
            Employee e = new Employee();
            e.setEmpno(id);
            e.setEmpName(name);
            e.setDoj(doj);
            e.setGender(gender);
            e.setBsalary(salary);

            // 3. Call the DAO to update the database
            EmployeeDAO dao = new EmployeeDAO();
            int result = dao.updateEmployee(e);

            // 4. Show success or failure
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