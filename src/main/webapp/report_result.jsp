<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
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
            margin-bottom: 10px;
            text-align: center;
        }
        
        .report-title {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .stats-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        
        .stat-value {
            font-size: 28px;
            font-weight: bold;
            margin: 10px 0;
        }
        
        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background: #667eea;
            color: white;
            font-weight: 600;
        }
        
        tr:hover {
            background: #f5f5f5;
        }
        
        .department-summary {
            margin-top: 30px;
        }
        
        .department-card {
            background: #f8f9fa;
            margin-bottom: 15px;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        
        .department-name {
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }
        
        .department-stats {
            margin-top: 10px;
            color: #666;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 30px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
        }
        
        .no-data {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📈 Report Results</h2>
        <div class="report-title">
            <%= request.getAttribute("reportTitle") != null ? request.getAttribute("reportTitle") : "Salary Report" %>
        </div>
        
        <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
        %>
            <div class="error">
                <%= error %>
            </div>
        <%
        }
        
        String reportType = (String) request.getAttribute("reportType");
        
        if ("summary".equals(reportType)) {
            Double avgSalary = (Double) request.getAttribute("avgSalary");
            Integer totalEmployees = (Integer) request.getAttribute("totalEmployees");
            DecimalFormat df = new DecimalFormat("#,##0.00");
        %>
            <div class="stats-summary">
                <div class="stat-box">
                    <div class="stat-label">Total Employees</div>
                    <div class="stat-value"><%= totalEmployees %></div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Average Salary</div>
                    <div class="stat-value">₹ <%= df.format(avgSalary) %></div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Total Salary Budget</div>
                    <div class="stat-value">₹ <%= df.format(avgSalary * totalEmployees) %></div>
                </div>
            </div>
        <%
        }
        
        if ("department".equals(reportType) || "salaryRange".equals(reportType)) {
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");
            if (employees != null && !employees.isEmpty()) {
                double totalSalary = 0;
                for (Employee emp : employees) {
                    totalSalary += emp.getSalary().doubleValue();
                }
        %>
            <div class="stats-summary">
                <div class="stat-box">
                    <div class="stat-label">Employees Found</div>
                    <div class="stat-value"><%= employees.size() %></div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Average Salary</div>
                    <div class="stat-value">₹ <%= String.format("%,.2f", totalSalary / employees.size()) %></div>
                </div>
                <div class="stat-box">
                    <div class="stat-label">Total Salary</div>
                    <div class="stat-value">₹ <%= String.format("%,.2f", totalSalary) %></div>
                </div>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Designation</th>
                        <th>Salary</th>
                        <th>Joining Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (Employee emp : employees) {
                    %>
                    <tr>
                        <td><%= emp.getId() %></td>
                        <td><%= emp.getName() %></td>
                        <td><%= emp.getDepartment() %></td>
                        <td><%= emp.getDesignation() %></td>
                        <td>₹ <%= String.format("%,.2f", emp.getSalary()) %></td>
                        <td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy").format(emp.getJoiningDate()) %></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        <%
            } else if (employees != null && employees.isEmpty()) {
        %>
            <div class="no-data">
                <p>No employees found matching the criteria.</p>
            </div>
        <%
            }
        }
        %>
        
        <a href="reports.jsp" class="back-link">← Generate Another Report</a>
    </div>
</body>
</html>