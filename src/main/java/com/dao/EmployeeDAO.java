package com.dao;
import java.sql.*;
import java.util.*;
import com.model.Employee;

public class EmployeeDAO {

    public int addEmployee(Employee e) throws Exception {
        Connection con = DBConnection.getConn();
        String sql = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, e.getEmpno());
        ps.setString(2, e.getEmpName());
        ps.setString(3, e.getDoj());
        ps.setString(4, e.getGender());
        ps.setDouble(5, e.getBsalary());
        
        return ps.executeUpdate(); 
    }


    public Employee getEmployeeById(int id) throws Exception {
        Employee e = null;
        Connection con = DBConnection.getConn();
        String sql = "SELECT * FROM Employee WHERE Empno = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            e = new Employee();
            e.setEmpno(rs.getInt("Empno"));
            e.setEmpName(rs.getString("EmpName"));
            e.setDoj(rs.getString("DoJ"));
            e.setGender(rs.getString("Gender"));
            e.setBsalary(rs.getDouble("Bsalary"));
        }
        return e;
    }
    public int deleteEmployee(int id) throws Exception {
        Connection con = DBConnection.getConn();
        String sql = "DELETE FROM Employee WHERE Empno = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeUpdate();
    }
    public List<Employee> getAllEmployees() throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = DBConnection.getConn();
        String sql = "SELECT * FROM Employee";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Employee e = new Employee();
            e.setEmpno(rs.getInt("Empno"));
            e.setEmpName(rs.getString("EmpName"));
            e.setDoj(rs.getString("DoJ"));
            e.setGender(rs.getString("Gender"));
            e.setBsalary(rs.getDouble("Bsalary"));
            list.add(e);
        }
        return list;
    }
    public int updateEmployee(Employee e) throws Exception {
        Connection con = DBConnection.getConn();
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, e.getEmpName());
        ps.setString(2, e.getDoj());
        ps.setString(3, e.getGender());
        ps.setDouble(4, e.getBsalary());
        ps.setInt(5, e.getEmpno());
        return ps.executeUpdate();
    }
    public List<Employee> getEmployeesByNameStart(String letter) throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = DBConnection.getConn();
        String sql = "SELECT * FROM Employee WHERE EmpName LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, letter + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Employee e = new Employee();
            e.setEmpno(rs.getInt("Empno"));
            e.setEmpName(rs.getString("EmpName"));
            e.setDoj(rs.getString("DoJ"));
            e.setGender(rs.getString("Gender"));
            e.setBsalary(rs.getDouble("Bsalary"));
            list.add(e);
        }
        return list;
    }

    public List<Employee> getEmployeesBySalary(double salary) throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = DBConnection.getConn();
        String sql = "SELECT * FROM Employee WHERE Bsalary > ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, salary);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Employee e = new Employee();
            e.setEmpno(rs.getInt("Empno"));
            e.setEmpName(rs.getString("EmpName"));
            e.setDoj(rs.getString("DoJ"));
            e.setGender(rs.getString("Gender"));
            e.setBsalary(rs.getDouble("Bsalary"));
            list.add(e);
        }
        return list;
    }
    public List<Employee> getEmployeesByExperience(int years) throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = DBConnection.getConn();
        // This SQL calculates the year difference between now and the DoJ
        String sql = "SELECT * FROM Employee WHERE (YEAR(CURDATE()) - YEAR(DoJ)) >= ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, years);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Employee e = new Employee();
            e.setEmpno(rs.getInt("Empno"));
            e.setEmpName(rs.getString("EmpName"));
            e.setDoj(rs.getString("DoJ"));
            e.setGender(rs.getString("Gender"));
            e.setBsalary(rs.getDouble("Bsalary"));
            list.add(e);
        }
        return list;
    }
   
}