<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Employee</title>
<style>
    body { font-family: 'Segoe UI', Arial; background-color: #fceaea; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    .delete-container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; width: 350px; border-top: 5px solid #e74c3c; }
    h2 { color: #c0392b; }
    input[type=number] { width: 100%; padding: 12px; margin: 15px 0; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
    input[type=submit] { width: 100%; background: #e74c3c; color: white; padding: 12px; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; }
    input[type=submit]:hover { background: #c0392b; }
    .back-link { display: block; margin-top: 20px; color: #7f8c8d; text-decoration: none; }
</style>
</head>
<body>
    <div class="delete-container">
        <h2>🗑️ Delete Employee</h2>
        <p style="color: #7f8c8d;">Enter ID to permanently remove</p>
        <form action="DeleteEmployeeServlet" method="post">
            <input type="number" name="empno" placeholder="Employee ID" required>
            <input type="submit" value="Delete Record" onclick="return confirm('Are you sure you want to delete this?')">
        </form>
        <a href="index.jsp" class="back-link">← Back to Menu</a>
    </div>
</body>
</html>