package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addEmployee")
public class AddEmployeeServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String employeeId = request.getParameter("employeeId");
            String name = request.getParameter("name");
            String department = request.getParameter("department");
            String designation = request.getParameter("designation");
            BigDecimal salary = new BigDecimal(request.getParameter("salary"));
            String joiningDateStr = request.getParameter("joiningDate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date joiningDate = sdf.parse(joiningDateStr);
            
            // Validate Employee ID uniqueness
            EmployeeDAO dao = new EmployeeDAO();
            Employee existingEmp = dao.getEmployeeByEmployeeId(employeeId);
            
            if (existingEmp != null) {
                request.setAttribute("message", "❌ Employee ID '" + employeeId + "' already exists! Please use a different ID.");
                request.getRequestDispatcher("empadd.jsp").forward(request, response);
                return;
            }
            
            Employee employee = new Employee();
            employee.setEmployeeId(employeeId);
            employee.setName(name);
            employee.setDepartment(department);
            employee.setDesignation(designation);
            employee.setSalary(salary);
            employee.setJoiningDate(joiningDate);
            
            boolean success = dao.addEmployee(employee);
            
            if (success) {
                request.setAttribute("message", "✅ Employee added successfully! ID: " + employeeId);
            } else {
                request.setAttribute("message", "❌ Failed to add employee!");
            }
        } catch (Exception e) {
            request.setAttribute("message", "❌ Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("empadd.jsp").forward(request, response);
    }
}