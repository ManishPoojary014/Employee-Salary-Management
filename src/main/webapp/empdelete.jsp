<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<% 
    Employee e = (Employee) request.getAttribute("emp"); 
%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Employee</title>
<style>
    body { font-family: 'Segoe UI', Arial; background-color: #fceaea; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    .delete-container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 350px; border-top: 5px solid #e74c3c; }
    h2 { color: #c0392b; }
    input { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
    .readonly-field { background-color: #f0f0f0; color: #7f8c8d; cursor: not-allowed; }
    input[type=submit] { background: #e74c3c; color: white; padding: 12px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; }
    input[type=submit]:hover { background: #c0392b; }
    .back-link { display: block; margin-top: 20px; color: #7f8c8d; text-decoration: none; }
</style>
</head>
<body>
    <div class="delete-container">
        <% if (e == null) { %>
            <h2>🗑️ Delete Employee</h2>
            <% 
                String error = (String) request.getAttribute("error"); 
                if (error != null) { 
            %>
                <p style="color: red; font-weight: bold; background: #ffe6e6; padding: 10px; border-radius: 5px;"><%= error %></p>
            <% } %>
            <p style="color: #7f8c8d;">Enter ID to search for deletion</p>
            <form action="DeleteEmployeeServlet" method="get">
                <input type="number" name="empno" placeholder="Employee ID" required>
                <input type="submit" value="Search Employee">
            </form>
            <a href="index.jsp" class="back-link">← Back to Menu</a>
        
       <% } else { %>
    <h2>Confirm Deletion</h2>
    <p style="color: #e74c3c; font-weight: bold;">Are you sure you want to delete this?</p>
    
    <form action="DeleteEmployeeServlet" method="post">
        <input type="hidden" name="empno" value="<%= e.getEmpno() %>">
        
        <label>Employee ID</label>
        <input type="text" value="<%= e.getEmpno() %>" readonly class="readonly-field">
        
        <label>Name</label>
        <input type="text" value="<%= e.getEmpName() %>" readonly class="readonly-field">
        
        <label>Joining Date</label>
        <input type="text" value="<%= e.getDoj() %>" readonly class="readonly-field">
        
        <label>Gender</label>
        <input type="text" value="<%= e.getGender() %>" readonly class="readonly-field">
        
        <label>Basic Salary</label>
        <input type="text" value="<%= e.getBsalary() %>" readonly class="readonly-field">
        
        <input type="submit" value="Permanently Delete" 
               onclick="return confirm('WARNING: This will permanently delete <%= e.getEmpName() %>. Continue?')">
    </form>
    
    <a href="empdelete.jsp" class="back-link">Cancel / Search Another</a>
<% } %>
    </div>
</body>
</html>
