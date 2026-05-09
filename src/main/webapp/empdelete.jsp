<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.EmployeeDAO" %>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .success {
            background: #d4edda;
            color: #155724;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
        }
        .employee-details {
            background: #f0f0f0;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Employee</h2>
        
        <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
            <div class="message <%= message.contains("✅") ? "success" : "error" %>">
                <%= message %>
            </div>
        <%
        }
        %>
        
        <%
        String employeeId = request.getParameter("employeeId");
        EmployeeDAO dao = new EmployeeDAO();
        Employee employee = null;
        
        if (employeeId != null && !employeeId.trim().isEmpty()) {
            employee = dao.getEmployeeByEmployeeId(employeeId);
        }
        
        if (employee != null) {
        %>
            <div class="employee-details">
                <h3>Employee Found:</h3>
                <p><strong>ID:</strong> <%= employee.getEmployeeId() %></p>
                <p><strong>Name:</strong> <%= employee.getName() %></p>
                <p><strong>Department:</strong> <%= employee.getDepartment() %></p>
                <p><strong>Salary:</strong> ₹ <%= employee.getSalary() %></p>
            </div>
            
            <form action="deleteEmployee" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?')">
                <input type="hidden" name="employeeId" value="<%= employee.getEmployeeId() %>">
                <button type="submit">Confirm Delete</button>
            </form>
        <%
        } else {
        %>
            <form action="empdelete.jsp" method="get">
                <div class="form-group">
                    <label>Enter Employee ID:</label>
                    <input type="text" name="employeeId" placeholder="e.g., EMP001" required>
                </div>
                <button type="submit">Search Employee</button>
            </form>
        <%
            if (employeeId != null && !employeeId.trim().isEmpty()) {
        %>
            <div class="message error" style="margin-top: 20px;">
                No employee found with ID: <%= employeeId %>
            </div>
        <%
            }
        }
        %>
        
        <br>
        <a href="index.jsp">Back to Dashboard</a>
    </div>
</body>
</html>