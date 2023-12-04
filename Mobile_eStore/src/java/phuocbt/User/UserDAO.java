/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import phuocbt.Utils.DBUtils;

/**
 *
 * @author phuoc
 */
public class UserDAO {
    public UserDTO checkLogin(String userId, int password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql = "select fullName, role from tbl_User "
                        + "where userId = ? and password= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userId);
                stm.setInt(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    String fullName = rs.getString("fullName");
                    int role = rs.getInt("role");
                    user = new UserDTO(userId, "***", fullName, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(stm!=null) stm.close();
            if(rs!=null) rs.close();
        }
        return user;
    }

}
