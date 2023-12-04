/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.User;

/**
 *
 * @author phuoc
 */
public class UserDTO {
    private String userId;
    private int password;
    private String passwordHide;
    private String fullName;
    private int role;

    public UserDTO() {
    }
    //login and hide password
    public UserDTO(String userId, String passwordHide, String fullName, int role) {
        this.userId = userId;
        this.passwordHide = passwordHide;
        this.fullName = fullName;
        this.role = role;
    }

    public UserDTO(String userId, int password, String fullName, int role) {
        this.userId = userId;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRole() {
        return role;
    }

    public void setRoleId(int role) {
        this.role = role;
    }
    
    
}
