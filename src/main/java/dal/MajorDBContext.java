package dal;

import model.Major;

import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MajorDBContext extends DBContext<Major>{
    public void addMajor(Major major) {
        try {
            String sql = "INSERT INTO major (code, detail, status) VALUES (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, major.getCode());
            stm.setString(2, major.getDetail());
            stm.setBoolean(3, major.isStatus());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Major> listAllMajor() {
        ArrayList<Major> majors = new ArrayList<>();
        try {
            String sql = "select id,code,detail,status from major";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Major major = new Major();
                major.setId(rs.getInt("id"));
                major.setCode(rs.getString("code"));
                major.setDetail(rs.getString("detail"));
                major.setStatus(rs.getBoolean("status"));
                majors.add(major);
            }
        } catch (SQLException e) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return majors;
    }

    public ArrayList<Major> getSearchMajor(String search){
        ArrayList<Major> majors = new ArrayList<>();
        try {
            String sql = "select id,code,detail,status from major m where m.id like ? or m.detail like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Major major = new Major();
                major.setId(rs.getInt("id"));
                major.setCode(rs.getString("code"));
                major.setDetail(rs.getString("detail"));
                major.setStatus(rs.getBoolean("status"));
                majors.add(major);
            }
        } catch (SQLException e) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return majors;
    }

    public void updateMajorDetail(String code, String detail, boolean status) {
        try {
            String sql = "UPDATE major SET detail = ?, status = ? WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, detail);
            stm.setBoolean(2, status);
            stm.setString(3, code);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Major> list() {
        return null;
    }

    @Override
    public void insert(Major entity) {

    }

    @Override
    public void update(Major entity) {

    }

    @Override
    public void delete(Major entity) {

    }

    @Override
    public Major get(int id) throws SQLException {
        String sql = "select id,code,detail from major where id = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Major major = new Major();
            major.setId(rs.getInt("id"));
            major.setCode(rs.getString("code"));
            major.setDetail(rs.getString("detail"));
            return major;
        }
        return null;
    }
    public Major getMajorByUserName(String username) throws SQLException {
       String sql ="select s.major_id from `account` a join student s on a.account_id=s.acc_id where a.username =?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Major major = get(rs.getInt("major_id"));
            return major;
        }
        return null;
    }
}
