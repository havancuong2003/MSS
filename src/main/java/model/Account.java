package model;

import java.sql.Blob;
import java.util.Date;

public class Account implements IEntity {
    private int aid;
    private String username;
    private String password;
    private String email;
    private String fullname;
    private String phone;
    private boolean gender;
    private String address;
    private Date dob;
    private int role_id;
    private Blob avatar;




    public Account() {

    }

    public Account(int id, String username, String password, String email, String fullname, String phone, boolean gender, String address, Date dob, int role_id, Blob avatar) {
        this.aid = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.dob = dob;
        this.role_id = role_id;
        this.avatar = avatar;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public Blob getAvatar() {
        return avatar;
    }

    public void setAvatar(Blob avatar) {
        this.avatar = avatar;
    }
}
