package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateEmployee")
public class UpdateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String employeeId = request.getParameter("employeeId");
            String name = request.getParameter("name");
            String department = request.getParameter("department");
            String designation = request.getParameter("designation");
            BigDecimal salary = new BigDecimal(request.getParameter("salary"));
            String joiningDateStr = request.getParameter("joiningDate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            Employee employee = new Employee();
            employee.setId(id);
            employee.setEmployeeId(employeeId);
            employee.setName(name);
            employee.setDepartment(department);
            employee.setDesignation(designation);
            employee.setSalary(salary);
            employee.setJoiningDate(sdf.parse(joiningDateStr));
            
            EmployeeDAO dao = new EmployeeDAO();
            boolean success = dao.updateEmployee(employee);
            
            if (success) {
                request.setAttribute("message", "Employee updated successfully!");
            } else {
                request.setAttribute("message", "Failed to update employee!");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        EmployeeDAO dao = new EmployeeDAO();
        Employee emp = dao.getEmployeeByEmployeeId(employeeId);
        request.setAttribute("employee", emp);
        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
    }
}