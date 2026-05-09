package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        EmployeeDAO dao = new EmployeeDAO();
        
        try {
            if ("department".equals(reportType)) {
                String department = request.getParameter("department");
                List<Employee> employees = dao.getEmployeesByDepartment(department);
                request.setAttribute("employees", employees);
                request.setAttribute("reportTitle", "Employees in " + department + " Department");
                request.setAttribute("reportType", "department");
                
            } else if ("salaryRange".equals(reportType)) {
                BigDecimal minSalary = new BigDecimal(request.getParameter("minSalary"));
                BigDecimal maxSalary = new BigDecimal(request.getParameter("maxSalary"));
                List<Employee> employees = dao.getEmployeesBySalaryRange(minSalary, maxSalary);
                request.setAttribute("employees", employees);
                request.setAttribute("reportTitle", "Employees with Salary Between " + minSalary + " and " + maxSalary);
                request.setAttribute("reportType", "salaryRange");
                
            } else if ("summary".equals(reportType)) {
                double avgSalary = dao.getAverageSalary();
                int totalEmployees = dao.getTotalEmployeeCount();
                request.setAttribute("avgSalary", avgSalary);
                request.setAttribute("totalEmployees", totalEmployees);
                request.setAttribute("reportTitle", "Salary Summary Report");
                request.setAttribute("reportType", "summary");
            }
            
        } catch (Exception e) {
            request.setAttribute("error", "Error generating report: " + e.getMessage());
        }
        
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}