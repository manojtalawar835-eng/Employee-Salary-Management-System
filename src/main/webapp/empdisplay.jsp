<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Employees</title>
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
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        h2 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }
        
        .stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        
        .stat-card {
            text-align: center;
            flex: 1;
        }
        
        .stat-number {
            font-size: 24px;
            font-weight: bold;
            color: #667eea;
        }
        
        .stat-label {
            color: #666;
            margin-top: 5px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 600;
        }
        
        tr:hover {
            background: #f5f5f5;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .no-data {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            th, td {
                padding: 8px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee List</h2>
        
        <% 
        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
        if (employees != null && !employees.isEmpty()) {
            double totalSalary = 0;
            for (Employee emp : employees) {
                totalSalary += emp.getSalary().doubleValue();
            }
            double avgSalary = totalSalary / employees.size();
        %>
        
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number"><%= employees.size() %></div>
                <div class="stat-label">Total Employees</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">₹ <%= String.format("%,.2f", avgSalary) %></div>
                <div class="stat-label">Average Salary</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">₹ <%= String.format("%,.2f", totalSalary) %></div>
                <div class="stat-label">Total Salary Budget</div>
            </div>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Joining Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (Employee emp : employees) { %>
                    <tr>
                        <td><%= emp.getEmployeeId() %></td>
                        <td><%= emp.getName() %></td>
                        <td><%= emp.getDepartment() %></td>
                        <td><%= emp.getDesignation() %></td>
                        <td>₹ <%= String.format("%,.2f", emp.getSalary()) %></td>
                        <td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy").format(emp.getJoiningDate()) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <div class="no-data">
                <p>No employees found in the database.</p>
                <p>Click <a href="empadd.jsp">here</a> to add your first employee.</p>
            </div>
        <% } %>
        
        <a href="index.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>