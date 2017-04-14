/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connect.DBConnect;
import model.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen
 */
public class Customerss {

    Connection conn = null;
    
    public Customerss() {
    }
    public boolean checkLogin(String user, String pass){
        try{
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM Customers where Username=? and Password=?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            boolean exist = false;
            exist = rs.next();
            rs.close(); stm.close(); conn.close();
            if(exist){
                return true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public List<Customer> showCustomer(String username){
        try{
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM Customers";
            if(username.length()>0){
                sql += " where Username like '%"+username+"%'";
            }
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Customer> list = new ArrayList<Customer>();
            while(rs.next()){
                String user = rs.getString(1);
                String pass = rs.getString(2);
                String hoten = rs.getString(3);
                String email = rs.getString(4);
                boolean gioitinh = rs.getBoolean(6);
                Customer sp = new Customer(user, pass,gioitinh, hoten,email);
                list.add(sp);
            }
            return list;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void insert(String user,String pass, String hoten, String email){
        try{
            conn = DBConnect.getConnection();
            String sql = "insert into Customers(Username,Password,Hoten,Email) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, hoten);
            ps.setString(4, email);
            ps.execute();
            ps.close();
            conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
