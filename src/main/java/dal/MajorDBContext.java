package dal;


import model.Course;
import model.Major;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MajorDBContext extends  DBContext<Major>{
    public void addMajor(Major major){
        try {
            String sql = "INSERT INTO major (code, detail) VALUES (?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, major.getCode());
            stm.setString(2, major.getDetail());
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
        return null;
    }
}
