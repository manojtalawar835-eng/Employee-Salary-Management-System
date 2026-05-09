<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports</title>
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
            max-width: 900px;
            margin: 0 auto;
        }
        
        h2 {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }
        
        .report-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .report-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            transition: transform 0.3s;
        }
        
        .report-card:hover {
            transform: translateY(-5px);
        }
        
        .report-card h3 {
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 15px;
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
            font-size: 14px;
        }
        
        button {
            width: 100%;
            padding: 10px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: transform 0.3s;
        }
        
        button:hover {
            transform: translateY(-2px);
        }
        
        .back-link {
            display: inline-block;
            margin-top: 30px;
            text-align: center;
            width: 100%;
            color: white;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Salary Reports Dashboard</h2>
        
        <div class="report-options">
            <!-- Department Report -->
            <div class="report-card">
                <h3>Department-wise Report</h3>
                <form action="reportCriteria" method="post">
                    <input type="hidden" name="reportType" value="department">
                    <div class="form-group">
                        <label>Select Department:</label>
                        <select name="department" required>
                            <option value="">Choose Department</option>
                            <option value="IT">IT</option>
                            <option value="HR">HR</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                            <option value="Sales">Sales</option>
                        </select>
                    </div>
                    <button type="submit">Generate Report</button>
                </form>
            </div>
            
            <!-- Salary Range Report -->
            <div class="report-card">
                <h3>Salary Range Report</h3>
                <form action="reportCriteria" method="post">
                    <input type="hidden" name="reportType" value="salaryRange">
                    <div class="form-group">
                        <label>Minimum Salary (₹):</label>
                        <input type="number" name="minSalary" step="1000" required>
                    </div>
                    <div class="form-group">
                        <label>Maximum Salary (₹):</label>
                        <input type="number" name="maxSalary" step="1000" required>
                    </div>
                    <button type="submit">Generate Report</button>
                </form>
            </div>
            
            <!-- Summary Report -->
            <div class="report-card">
                <h3>Salary Summary</h3>
                <form action="reportCriteria" method="post">
                    <input type="hidden" name="reportType" value="summary">
                    <div class="form-group">
                        <p style="color: #666; margin-bottom: 15px;">
                            Get overall salary statistics including:
                        </p>
                        <ul style="margin-left: 20px; color: #555;">
                            <li>Total employees count</li>
                            <li>Average salary</li>
                            <li>Department-wise breakdown</li>
                        </ul>
                    </div>
                    <button type="submit">Generate Summary Report</button>
                </form>
            </div>
        </div>
        
        <a href="index.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>