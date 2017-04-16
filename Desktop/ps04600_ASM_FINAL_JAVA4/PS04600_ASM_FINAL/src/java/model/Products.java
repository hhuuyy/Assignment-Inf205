/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connect.DBConnect;
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
public class Products{
    
    Connection conn = null;
    public Products() {
    }
    public void delete(String code){
        try{
            conn = DBConnect.getConnection();
            String sql = "DELETE FROM Products where Code=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,code);
            ps.execute();
            ps.close();
            conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public void update(String code,String name, float price){
        try{
            conn = DBConnect.getConnection();
            String sql = "UPDATE Products SET Name=?, Price=? Where Code=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setFloat(2, price);
            ps.setString(3, code);
            ps.execute();
            ps.close();
            conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public void insert(String code,String name, float price){
        try{
            conn = DBConnect.getConnection();
            String sql = "insert into Products(Code,Name,Price) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2,name);
            ps.setFloat(3, price);
            ps.execute();
            ps.close();
            conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public List<Product> showProduct(String tensp){
        try{
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM Products";
            if(tensp.length()>0){
                sql += " where Name like '%"+tensp+"%'";
            }
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Product> list = new ArrayList<Product>();
            while(rs.next()){
                String code = rs.getString(1);
                String name = rs.getString(2);
                float price = rs.getFloat(3);
                String image = rs.getString(4);
                String detail = rs.getString(5);
                Product sp = new Product(code, name, price, image, detail);
                list.add(sp);
            }
            return list;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
