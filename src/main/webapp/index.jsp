<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management Portal</title>
<style>
    /* Main layout styling */
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
        display: flex; 
        justify-content: center; 
        align-items: center; 
        height: 100vh; 
        margin: 0; 
    }

    /* The central card */
    .card { 
        background: white; 
        padding: 50px; 
        border-radius: 20px; 
        box-shadow: 0 15px 35px rgba(0,0,0,0.2); 
        text-align: center; 
        width: 400px; 
    }

    h1 { 
        color: #2c3e50; 
        margin-bottom: 10px; 
        font-size: 28px;
    }

    p {
        color: #7f8c8d;
        margin-bottom: 30px;
        font-size: 14px;
    }

    /* Common Button Styling */
    .btn { 
        display: block; 
        padding: 15px; 
        margin: 15px 0; 
        color: white; 
        text-decoration: none; 
        border-radius: 10px; 
        transition: all 0.3s ease; 
        font-weight: bold; 
        font-size: 16px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .btn:hover { 
        transform: translateY(-3px); 
        box-shadow: 0 8px 15px rgba(0,0,0,0.2); 
    }

    /* Specific Colors for each action */
    .btn-add { background-color: #3498db; }    /* Blue */
    .btn-add:hover { background-color: #2980b9; }

    .btn-search { background-color: #2ecc71; } /* Green */
    .btn-search:hover { background-color: #27ae60; }

    .btn-delete { background-color: #e74c3c; } /* Red */
    .btn-delete:hover { background-color: #c0392b; }
    
    .btn-report { background-color: #9b59b6; } /* Purple */
    .btn-report:hover { background-color: #8e44ad; }

    /* New button colors for the requirements */
    .btn-update { background-color: #f39c12; } /* Orange */
    .btn-update:hover { background-color: #d35400; }

    .btn-advanced { background-color: #34495e; } /* Dark Blue/Gray */
    .btn-advanced:hover { background-color: #2c3e50; }

</style>
</head>
<body>

    <div class="card">
        <h1>EMS Dashboard</h1>
        <p>Welcome to the Employee Management System</p>
        
        <a href="empadd.jsp" class="btn btn-add">➕ Add New Employee</a>
        
        <a href="empdisplay.jsp" class="btn btn-search">🔍 Search/View Employee</a>

        <a href="empupdate.jsp" class="btn btn-update">✏️ Update Employee</a>
        
        <a href="empreport.jsp" class="btn btn-report">📋 View All Employees</a>

        <a href="reports.jsp" class="btn btn-advanced">📊 Advanced Filter Reports</a>
        
        <a href="empdelete.jsp" class="btn btn-delete">🗑️ Remove Employee</a>
        
        <div style="margin-top: 25px; font-size: 12px; color: #bdc3c7;">
            Connected to MySQL Database: <b>EmployeeDB</b>
        </div>
    </div>

</body>
</html>