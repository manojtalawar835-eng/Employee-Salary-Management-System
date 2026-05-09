<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Salary Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            color: white;
            padding: 40px 0;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 40px;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            display: block;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .card-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        
        .card p {
            color: #666;
        }
        
        .card.add { border-top: 4px solid #4CAF50; }
        .card.update { border-top: 4px solid #FF9800; }
        .card.delete { border-top: 4px solid #f44336; }
        .card.display { border-top: 4px solid #2196F3; }
        .card.reports { border-top: 4px solid #9C27B0; }
        
        .footer {
            text-align: center;
            color: white;
            margin-top: 50px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏢 Employee Salary Management System</h1>
            <p>Manage your workforce efficiently</p>
        </div>
        
        <div class="dashboard">
            <a href="empadd.jsp" class="card add">
                <div class="card-icon">➕</div>
                <h3>Add Employee</h3>
                <p>Add new employee to the system</p>
            </a>
            
            <a href="empupdate.jsp" class="card update">
                <div class="card-icon">✏️</div>
                <h3>Update Employee</h3>
                <p>Update employee information</p>
            </a>
            
            <a href="empdelete.jsp" class="card delete">
                <div class="card-icon">🗑️</div>
                <h3>Delete Employee</h3>
                <p>Remove employee from system</p>
            </a>
            
            <a href="displayEmployee" class="card display">
                <div class="card-icon">👥</div>
                <h3>Display Employees</h3>
                <p>View all employee records</p>
            </a>
            
            <a href="reports.jsp" class="card reports">
                <div class="card-icon">📊</div>
                <h3>Reports</h3>
                <p>Generate salary reports</p>
            </a>
        </div>
        
        <div class="footer">
            <p>&copy; 2024 Employee Salary Management System</p>
        </div>
    </div>
</body>
</html>