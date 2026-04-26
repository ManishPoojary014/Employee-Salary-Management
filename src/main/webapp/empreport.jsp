<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.EmployeeDAO, com.model.Employee, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Report</title>
<style>
    body { font-family: Arial; background-color: #f4f7f6; padding: 30px; }
    h2 { color: #2c3e50; text-align: center; }
    table { width: 90%; margin: auto; border-collapse: collapse; background: white; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #3498db; color: white; }
    tr:hover { background-color: #f1f1f1; }
    .back-btn { display: block; text-align: center; margin-top: 20px; text-decoration: none; color: #3498db; font-weight: bold; }
</style>
</head>
<body>

    <h2>📋 All Registered Employees</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Joining Date</th>
            <th>Gender</th>
            <th>Salary (₹)</th>
        </tr>
        <%
            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> empList = dao.getAllEmployees();
            for(Employee e : empList) {
        %>
        <tr>
            <td><%= e.getEmpno() %></td>
            <td><%= e.getEmpName() %></td>
            <td><%= e.getDoj() %></td>
            <td><%= e.getGender() %></td>
            <td><%= e.getBsalary() %></td>
        </tr>
        <% } %>
    </table>

    <a href="index.jsp" class="back-btn">← Back to Dashboard</a>

</body>
</html>