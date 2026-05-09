<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
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
            max-width: 600px;
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
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }
        
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        
        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
        }
        
        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        button:hover {
            transform: translateY(-2px);
        }
        
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
        
        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .search-section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f0f0f0;
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
        
        .info-text {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Employee</h2>
        
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("successfully") ? "success" : "error" %>">
                <%= message %>
            </div>
        <% } %>
        
        <div class="search-section">
            <form action="updateEmployee" method="get">
                <div class="form-group">
                    <label>Enter Employee ID to Update:</label>
                    <input type="text" name="employeeId" placeholder="e.g., EMP001" required>
                </div>
                <button type="submit">Search Employee</button>
            </form>
        </div>
        
        <% Employee emp = (Employee) request.getAttribute("employee"); %>
        <% if (emp != null) { %>
            <form action="updateEmployee" method="post">
                <input type="hidden" name="id" value="<%= emp.getId() %>">
                
                <div class="form-group">
                    <label>Employee ID:</label>
                    <input type="text" name="employeeId" value="<%= emp.getEmployeeId() %>" required>
                </div>
                
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="name" value="<%= emp.getName() %>" required>
                </div>
                
                <div class="form-group">
                    <label>Department:</label>
                    <select name="department" required>
                        <option value="IT" <%= emp.getDepartment().equals("IT") ? "selected" : "" %>>IT</option>
                        <option value="HR" <%= emp.getDepartment().equals("HR") ? "selected" : "" %>>HR</option>
                        <option value="Finance" <%= emp.getDepartment().equals("Finance") ? "selected" : "" %>>Finance</option>
                        <option value="Marketing" <%= emp.getDepartment().equals("Marketing") ? "selected" : "" %>>Marketing</option>
                        <option value="Sales" <%= emp.getDepartment().equals("Sales") ? "selected" : "" %>>Sales</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Designation:</label>
                    <input type="text" name="designation" value="<%= emp.getDesignation() %>" required>
                </div>
                
                <div class="form-group">
                    <label>Salary (₹):</label>
                    <input type="number" name="salary" step="0.01" value="<%= emp.getSalary() %>" required>
                </div>
                
                <div class="form-group">
                    <label>Joining Date:</label>
                    <input type="date" name="joiningDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(emp.getJoiningDate()) %>" required>
                </div>
                
                <button type="submit">Update Employee</button>
            </form>
        <% } %>
        
        <a href="index.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>