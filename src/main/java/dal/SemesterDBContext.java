package dal;

import model.Semester;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class SemesterDBContext extends DBContext<Semester> {
    public ArrayList<Semester> getSemesterForStudent(String sid) {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select distinct se.id, se.detail from swp391.group gr inner join enrollment en on en.group_id = gr.id \n" +
                    "inner join semester se on se.id = gr.semester_id where en.student_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                semesters.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return semesters;
    }

    public ArrayList<Semester> getSemesterForTeacher(String tid) {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select distinct s.id, s.detail from swp391.group g inner join semester s on g.semester_id = s.id\n" +
                    "where g.PIC = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, tid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                semesters.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return semesters;
    }

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
}
