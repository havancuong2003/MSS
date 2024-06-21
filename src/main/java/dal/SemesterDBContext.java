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
        Semester semester = null;
        String sql = "select * from semester where id = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            semester = new Semester();
            semester.setId(rs.getInt("id"));
            semester.setStart(rs.getDate("start"));
            semester.setEnd(rs.getDate("end"));
            semester.setDetail(rs.getString("detail"));
            semester.setNextSemesterID(getNextSemester());
        }
        return semester;
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
    public int getNextSemester(){
        int currentSemesterID = getCurrentSemester();
        String sql ="SELECT id \n" +
                "FROM semester \n" +
                "WHERE id > ?\n" +
                "ORDER BY id \n" +
                "LIMIT 1;\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentSemesterID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException {
        SemesterDBContext s = new SemesterDBContext();
        Semester ss = s.get(1);
        System.out.println(ss.getId()+" "+ss.getStart()+" "+ss.getEnd()+" "+ss.getDetail()+" "+ss.getNextSemesterID());
    }

}
