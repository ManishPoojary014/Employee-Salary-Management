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

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // empno is removed, database will handle it automatically
            String name = request.getParameter("empname");
            String doj = request.getParameter("doj");
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("bsalary"));

            // We pass 0 as the ID, the Database will overwrite it with the next available number
            Employee emp = new Employee(0, name, doj, gender, salary);

            // Using DAO to save to MySQL
            EmployeeDAO dao = new EmployeeDAO();
            int result = dao.addEmployee(emp);

            if (result > 0) {
                out.print("<h2 style='color:green'>Employee Added Successfully!</h2>");
                out.print("<a href='index.jsp'>Back to Home</a>");
            } else {
                out.print("<h2 style='color:red'>Failed to Add Employee.</h2>");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
}
