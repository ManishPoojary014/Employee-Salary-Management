<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<% 
    // This retrieves the employee object sent from your Servlet
    Employee e = (Employee) request.getAttribute("emp"); 
    // Retrieve the error message if the ID was not found
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head><title>Update Employee</title>
<style>
    body { font-family: Arial; background: #fff4e6; display: flex; justify-content: center; padding: 50px; }
    .card { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); width: 400px; border-top: 5px solid #f39c12; }
    input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
    .readonly-field { background-color: #f0f0f0; color: #7f8c8d; cursor: not-allowed; }
    input[type=submit] { background: #f39c12; color: white; border: none; cursor: pointer; font-weight: bold; }
    .radio-container { display: flex; gap: 15px; margin-bottom: 10px; }
    input[type="radio"] { width: auto; margin: 0; }
    
    /* Error message styling */
    .error-box { 
        background-color: #fee2e2; 
        color: #b91c1c; 
        padding: 10px; 
        border-radius: 5px; 
        margin-bottom: 15px; 
        border: 1px solid #f87171; 
        font-size: 14px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="card">
        <%-- Display the error message only if it is not null --%>
        <% if (errorMessage != null) { %>
            <div class="error-box">
                <%= errorMessage %>
            </div>
        <% } %>

        <% if (e == null) { %>
            <h2>Search Employee</h2>
            <form action="UpdateEmployeeServlet" method="get">
                <label>Enter Employee ID:</label>
                <input type="number" name="empno" placeholder="Enter ID to Search" required>
                <input type="submit" value="Search">
            </form>
            <a href="index.jsp">Back to Menu</a>

        <% } else { %>
            <h2>Update Employee Details</h2>
            <form action="UpdateEmployeeServlet" method="post">
                
                <label>Employee ID</label>
                <input type="number" name="empno" value="<%= e.getEmpno() %>" readonly class="readonly-field">
                
                <label>Full Name</label>
                <input type="text" name="empname" value="<%= e.getEmpName() %>" pattern="[A-Za-z\s]+" title="Only alphabets allowed" required>
                
                <label>Joining Date</label>
                <input type="date" name="doj" value="<%= e.getDoj() %>" required>
                
                <label>Gender:</label>
               <div class="radio-container">
               <label><input type="radio" name="gender" value="Male" <%= "Male".equals(e.getGender()) ? "checked" : "" %>> Male</label>
               <label><input type="radio" name="gender" value="Female" <%= "Female".equals(e.getGender()) ? "checked" : "" %>> Female</label>
               <label><input type="radio" name="gender" value="Other" <%= "Other".equals(e.getGender()) ? "checked" : "" %>> Other</label>
               </div>
                
                
                <label>Basic Salary</label>
                <input type="number" name="bsalary" value="<%= e.getBsalary() %>" step="0.01" min="0" required>
                
                <input type="submit" value="Update Record">
            </form>
            <a href="empupdate.jsp">Search Another</a> | <a href="index.jsp">Back to Menu</a>
        <% } %>
    </div>
</body>
</html>
