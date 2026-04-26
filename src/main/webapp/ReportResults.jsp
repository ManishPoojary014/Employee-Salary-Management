<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.EmployeeDAO, com.model.Employee, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <style>
        body { font-family: 'Segoe UI', Arial; background: #f4f7f6; padding: 30px; }
        .container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 90%; margin: auto; }
        h2 { color: #2c3e50; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border-bottom: 1px solid #ddd; text-align: left; }
        th { background: #34495e; color: white; }
        tr:hover { background: #f9f9f9; }
        .back { display: block; text-align: center; margin-top: 25px; text-decoration: none; color: #3498db; font-weight: bold; }
        .no-data { text-align: center; padding: 20px; color: #e74c3c; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Filtered Report Results</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date of Joining</th>
                <th>Gender</th>
                <th>Basic Salary (₹)</th>
            </tr>
            <%
                String type = request.getParameter("type");
                EmployeeDAO dao = new EmployeeDAO();
                List<Employee> list = null;

                try {
                    if ("name".equals(type)) {
                        String letter = request.getParameter("letter");
                        list = dao.getEmployeesByNameStart(letter);
                    } 
                    else if ("salary".equals(type)) {
                        double sal = Double.parseDouble(request.getParameter("salary"));
                        list = dao.getEmployeesBySalary(sal);
                    } 
                    else if ("experience".equals(type)) {
                        int yrs = Integer.parseInt(request.getParameter("years"));
                        list = dao.getEmployeesByExperience(yrs);
                    }

                    if (list != null && !list.isEmpty()) {
                        for (Employee e : list) {
            %>
            <tr>
                <td><%= e.getEmpno() %></td>
                <td><%= e.getEmpName() %></td>
                <td><%= e.getDoj() %></td>
                <td><%= e.getGender() %></td>
                <td><%= e.getBsalary() %></td>
            </tr>
            <% 
                        }
                    } else {
            %>
            <tr><td colspan="5" class="no-data">No records found matching your criteria.</td></tr>
            <% 
                    }
                } catch (Exception ex) {
                    out.print("<tr><td colspan='5' class='no-data'>Error: " + ex.getMessage() + "</td></tr>");
                }
            %>
        </table>
        <a href="reports.jsp" class="back">← Back to Reports Menu</a>
    </div>
</body>
</html>