<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Reports</title>
<style>
    body { font-family: 'Segoe UI', Arial, sans-serif; background: #f0f2f5; padding: 40px; }
    h1 { color: #2c3e50; text-align: center; }
    
    .report-box { 
        background: white; 
        padding: 25px; 
        margin: 20px auto; 
        border-radius: 12px; 
        width: 500px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        transition: 0.3s;
    }
    .report-box:hover { transform: scale(1.02); }
    
    /* Box Colors */
    .box-name { border-left: 8px solid #9b59b6; }
    .box-salary { border-left: 8px solid #3498db; }
    .box-years { border-left: 8px solid #2ecc71; }

    h3 { margin-top: 0; color: #34495e; }
    input { padding: 10px; border-radius: 6px; border: 1px solid #ccc; width: 200px; }
    
    .btn { 
        padding: 10px 20px; 
        border: none; 
        border-radius: 6px; 
        cursor: pointer; 
        font-weight: bold; 
        color: white; 
    }
    
    .btn-purple { background: #9b59b6; }
    .btn-blue { background: #3498db; }
    .btn-green { background: #2ecc71; }
    
    .back-link { display: block; text-align: center; margin-top: 30px; text-decoration: none; color: #7f8c8d; font-weight: bold; }
</style>
</head>
<body>

    <h1>📊 Advanced Filter Reports</h1>

    <div class="report-box box-name">
        <h3>1. Names starting with specific letter</h3>
        <form action="ReportResults.jsp">
            <input type="text" name="letter" placeholder="e.g. A" maxlength="1" required>
            <input type="hidden" name="type" value="name">
            <input type="submit" class="btn btn-purple" value="Generate">
        </form>
    </div>

    <div class="report-box box-salary">
        <h3>2. Salary more than specified amount</h3>
        <form action="ReportResults.jsp">
            <input type="number" name="salary" placeholder="e.g. 50000" required>
            <input type="hidden" name="type" value="salary">
            <input type="submit" class="btn btn-blue" value="Generate">
        </form>
    </div>

    <div class="report-box box-years">
        <h3>3. Employees with N or more years of service</h3>
        <form action="ReportResults.jsp">
            <input type="number" name="years" placeholder="Enter years, e.g. 5" required>
            <input type="hidden" name="type" value="experience">
            <input type="submit" class="btn btn-green" value="Generate">
        </form>
    </div>

    <a href="index.jsp" class="back-link">← Back to Dashboard</a>

</body>
</html>