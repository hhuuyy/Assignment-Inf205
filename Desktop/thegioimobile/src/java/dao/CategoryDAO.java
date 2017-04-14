/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author Nguyen
 */
public class CategoryDAO {
    

public ArrayList<Category> getListCategory() {
        Connection cons = DBConnect.getConnection();
        String sql = "SELECT * FROM Category";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getString("Code"));
                category.setCategoryName(rs.getString("Name"));
                list.add(category);
            }
            cons.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//    public static void main(String[] args) {
//        CategoryDAO dao = new CategoryDAO();
//        for(Category d: dao.getListCategory()){
//            System.out.println(d.getCategoryID()+ " - " + d.getCategoryName());
//        }
//    }
}
