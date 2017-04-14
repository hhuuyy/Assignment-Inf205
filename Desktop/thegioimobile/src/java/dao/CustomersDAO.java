/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Customers;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Administrator
 */
public class CustomersDAO {
    public static List<Customers> layDanhSachKH(String tenkh){
        List<Customers> list = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        String sql="from Customers";   
        if(tenkh.length()>0){
            sql += " where hoten like '%"+tenkh+"%'";
        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;
    }
    public static Customers LayThongTinCus(String user){
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        Customers cus = (Customers) sesion.get(Customers.class, user);
        sesion.close();
        return cus;
    }
    public static boolean xoaKhachHang(String maCus)
    {
        Customers kh = CustomersDAO.LayThongTinCus(maCus);        
        if(kh == null)
            return false;        
        
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.delete(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.print(e);
            return false;
        }        
    }

}
