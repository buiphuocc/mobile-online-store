/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.Mobile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import phuocbt.Utils.DBUtils;

/**
 *
 * @author phuoc
 */
public class MobileDAO {
    public List<MobileDTO> getListMobile(String search, int minPrice, int maxPrice) throws SQLException{
        List<MobileDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql="select mobileId, description, price, mobileName, yearOfProduction, quantity, notSale "
                        + "from tbl_Mobile "
                        + "where mobileName like '%"+ search + "%' and price between "+minPrice+" and "+maxPrice + " and notSale = 0";
                
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String mobileId = rs.getString("mobileId");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    byte temp = rs.getByte("notSale");
                    boolean notSale = false;
                    if(temp==0){
                        notSale = false;
                    }
                    if(temp == 1){
                        notSale = true;
                    }
                    MobileDTO mobile = new MobileDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                    list.add(mobile);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(stm!=null) stm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
    
    public List<MobileDTO> getListMobileAD(String search) throws SQLException{
        List<MobileDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql="select mobileId, description, price, mobileName, yearOfProduction, quantity, notSale "
                        + "from tbl_Mobile "
                        + "where mobileName like '%"+ search + "%' or mobileId = '"+ search +"'";
                
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String mobileId = rs.getString("mobileId");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    byte temp = rs.getByte("notSale");
                    boolean notSale = false;
                    if(temp==0){
                        notSale = false;
                    }
                    if(temp == 1){
                        notSale = true;
                    }
                    MobileDTO mobile = new MobileDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                    list.add(mobile);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(stm!=null) stm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
    
    public boolean deleteMobile(String userName) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = (Connection) DBUtils.getConnection();
            if(conn != null){
                String sql = "delete tbl_Mobile "
                        + "where mobileName=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userName);
                int value = stm.executeUpdate();
                if(value>0){
                    result = true;
                }else{
                    result = false;
                } 
            }
        } catch (Exception e) {
        }finally{
            if(conn!=null) conn.close();
            if(stm!=null) stm.close();
        }
        return result;
    }
    
    public boolean updateMobile(MobileDTO mobile) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = (Connection) DBUtils.getConnection();
            if(conn!=null){
                String sql ="update tbl_Mobile "
                        + "set description=?, price=?, quantity=?, notSale=? "
                        + "where mobileName=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, mobile.getDescription());
                stm.setFloat(2, mobile.getPrice());
                stm.setInt(3, mobile.getQuantity());
                stm.setBoolean(4, mobile.isNotSale());
                stm.setString(5, mobile.getMobileName());
                check = stm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(stm!=null) stm.close();
        }
        return check;
    }
}
