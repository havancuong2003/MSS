package dal;

import model.Semester;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class SemesterDBContext extends DBContext<Semester> {
    @Override
    public ArrayList<Semester> list() {
        return null;
    }

    @Override
    public void insert(Semester entity) {

    }

    @Override
    public void update(Semester entity) {

    }

    @Override
    public void delete(Semester entity) {

    }

    @Override
    public Semester get(int id) throws SQLException {
        return null;
    }
    public  int getCurrentSemester(){
        String sql ="SELECT id FROM semester WHERE ? BETWEEN `start` AND `end`";
        Date now = new Date();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(now.getTime()));
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

}
