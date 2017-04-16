/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author Nguyen
 */
public class ProductDAO {
    

public ArrayList<Product> getListProductByCategory(String code) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM Products WHERE Code = '" + code + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setCode(rs.getString(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getFloat(3));
            product.setImage(rs.getString(4));
            product.setDetail(rs.getString(5));
            list.add(product);
        }
        return list;
    }

    // hien thi chi tiet san pham
    public Product getProduct(String code) throws SQLException{
        Connection con = DBConnect.getConnection();
        String sql = "select * from products where Code = '"+code+"'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while(rs.next()){
            product.setCode(rs.getString(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getFloat(3));
            product.setImage(rs.getString(4));
            product.setDetail(rs.getString(5));
        }
        return product;
    }
    
    public Product getProduct(Long code) throws SQLException{
        Connection con = DBConnect.getConnection();
        String sql = "select * from products where Code = '"+code+"'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while(rs.next()){
            product.setCode(rs.getString(1));
            product.setName(rs.getString(2));
            product.setPrice(rs.getFloat(3));
            product.setImage(rs.getString(4));
            product.setDetail(rs.getString(5));
        }
        return product;
    }
    
    public static void main(String[] args) throws SQLException{
        ProductDAO dao = new ProductDAO();
//        for(Product p: dao.getListProductByCategory("SP001"){
//            System.out.println(p.getCode()+ " - " + p.getName());
//        }
//        System.out.println(dao.getProduct(code).getCode());
//    }
    }
}
