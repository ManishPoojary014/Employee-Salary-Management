<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Update Employee</title>
<style>
    body { font-family: Arial; background: #fff4e6; display: flex; justify-content: center; padding: 50px; }
    .card { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); width: 400px; border-top: 5px solid #f39c12; }
    input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 5px; }
    input[type=submit] { background: #f39c12; color: white; border: none; cursor: pointer; font-weight: bold; }
</style>
</head>
<body>
    <div class="card">
        <h2>Update Employee Details</h2>
        <form action="UpdateEmployeeServlet" method="post">
            <input type="number" name="empno" placeholder="Enter ID to Update" required>
            <input type="text" name="empname" placeholder="New Name" required>
            <input type="date" name="doj" required>
		    <label>Gender:</label>

			<input type="radio" name="gender" value="Male" checked> M

			<input type="radio" name="gender" value="Female"> F
            <input type="number" name="bsalary" placeholder="New Salary" step="0.01" min="0" required>
            <input type="submit" value="Update Record">
        </form>
        <a href="index.jsp">Back to Menu</a>
    </div>
</body>
</html>
