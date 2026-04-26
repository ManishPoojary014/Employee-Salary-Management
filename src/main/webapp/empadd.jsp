<!DOCTYPE html>
<html>
<head>
<title>Add Employee</title>
<style>
    body { font-family: Arial, sans-serif; background-color: #f7f9fc; padding: 50px; }
    .form-container { max-width: 400px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
    h2 { color: #34495e; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
    input[type=text], input[type=number], input[type=date] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
    input[type=submit] { width: 100%; background: #3498db; color: white; padding: 12px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }
    input[type=submit]:hover { background: #2980b9; }
    .back { display: block; text-align: center; margin-top: 15px; color: #7f8c8d; text-decoration: none; }
</style>
</head>
<body>
    <div class="form-container">
        <h2>New Employee</h2>
        <form action="AddEmployeeServlet" method="post">
            <label>Employee ID</label>
            <input type="number" name="empno" placeholder="e.g. 101" required>
            <label>Full Name</label>
            <input type="text" name="empname" placeholder="Enter Name" required>
            <label>Joining Date</label>
            <input type="date" name="doj" required>
            <label>Gender</label><br>
            <input type="radio" name="gender" value="Male" checked> Male 
            <input type="radio" name="gender" value="Female"> Female <br><br>
            <label>Basic Salary</label>
            <input type="number" name="bsalary" step="0.01" required>
            <input type="submit" value="Register Employee">
        </form>
        <a href="index.jsp" class="back">← Back to Menu</a>
    </div>
</body>
</html>