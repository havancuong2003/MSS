package dal;

import model.Answer;
import model.Response;
import model.Semester;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

public class SemesterDBContext extends DBContext<Semester> {
    public void insertSemester(String detail, java.sql.Date start, java.sql.Date end, int isCreate) {
        String sql = "INSERT INTO semester(detail, start, end, isCreate) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, detail);
            statement.setDate(2, start);
            statement.setDate(3, end);
            statement.setInt(4, isCreate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public boolean checkDetailExists(String detail) {
        String sql = "SELECT COUNT(*) FROM semester WHERE detail = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, detail);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count == 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteSemester(int semesterId) {
        String sql = "DELETE FROM semester WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, semesterId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; // returns true if one or more rows were affected
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            return false; // returns false if an exception occurs
        }
    }

    public ArrayList<Semester> getAlSemesterBySearchName(String searchname) {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select * from semester where detail like '%" + searchname + "%' order by start asc";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester semester = new Semester();
                semester.setDetail(rs.getString(2));
                semester.setId(rs.getInt(1));
                semester.setStart(rs.getDate(3));
                semester.setEnd(rs.getDate(4));
                semester.setIsCreate(rs.getInt(5));
                semesters.add(semester);
            }
            return semesters;
        } catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        SemesterDBContext context = new SemesterDBContext();

        System.out.println(context.getAlSemesterBySearchName("").get(1).getDetail());
    }

    public void updateSemester(Semester semester) {

        try {
            String sql = "UPDATE semester SET detail = ?, start = ?, end = ?, isCreate = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semester.getDetail());
            stm.setString(2,   semester.getStart().toString()); ;
            stm.setString(3,   semester.getEnd().toString());
            stm.setInt(4, semester.getIsCreate());
            stm.setInt(5, semester.getId());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
            semester.setTotalCourseRegisterForNextSemester(rs.getInt("totalCourse"));
        }
        return semester;
    }

    public int getCurrentSemester() {
        String sql = "SELECT id FROM semester WHERE ? BETWEEN `start` AND `end`";
        Date now = new Date();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(now.getTime()));
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int getNextSemester() {
        int currentSemesterID = getCurrentSemester();
        String sql = "SELECT id \n" +
                "FROM semester \n" +
                "WHERE id > ?\n" +
                "ORDER BY id \n" +
                "LIMIT 1;\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentSemesterID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public void setTotalCourseRegisterForNextSemester(int number, int semesterID) {
        String sql = "UPDATE `semester` SET `totalCourse` = ? WHERE (`id` = ?);\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, number);
            stm.setInt(2, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}

