<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Employee</title>
<style>
    body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #eef2f3; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    .search-container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; width: 350px; }
    h2 { color: #2c3e50; margin-bottom: 20px; }
    input[type=number] { width: 100%; padding: 12px; margin: 15px 0; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; font-size: 16px; }
    input[type=submit] { width: 100%; background: #2ecc71; color: white; padding: 12px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; font-weight: bold; transition: 0.3s; }
    input[type=submit]:hover { background: #27ae60; }
    .back-link { display: block; margin-top: 20px; color: #7f8c8d; text-decoration: none; font-size: 14px; }
    .back-link:hover { color: #34495e; }
</style>
</head>
<body>
    <div class="search-container">
        <h2>🔍 Search Employee</h2>
        <form action="DisplayEmployeeServlet" method="get">
            <label style="color: #7f8c8d;">Enter Employee ID</label>
            <input type="number" name="empno" placeholder="e.g. 101" required>
            <input type="submit" value="Search Now">
        </form>
        <a href="index.jsp" class="back-link">← Back to Main Menu</a>
    </div>
</body>
</html>