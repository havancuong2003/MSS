package dal;

import model.Semester;
import model.TimePeriods;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class TimePeriodsDBContext extends DBContext<TimePeriods> {


    @Override
    public ArrayList<TimePeriods> list() {
        return null;
    }

    @Override
    public void insert(TimePeriods entity) {

    }

    @Override
    public void update(TimePeriods entity) {

    }

    @Override
    public void delete(TimePeriods entity) {

    }

    @Override
    public TimePeriods get(int id) throws SQLException {
        return null;
    }

    public void createTimeChangeGroup(String start, String end, int semesterID) {
        String sql = "INSERT INTO `timeperiods` (`start_time_class_change`, `end_time_class_change`,semester_id) VALUES (?, ?,?);";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));
            stm.setInt(3, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void createTimeRegister(String start, String end, int semesterID) {
        String sql = "INSERT INTO `timeperiods` (`start_time_register`, `end_time_register`,semester_id) VALUES (?, ?,?);";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));
            stm.setInt(3, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public TimePeriods getTimePeriods(int semester_id) {
        String sql = "SELECT * FROM timeperiods WHERE semester_id  = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semester_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                TimePeriods t = new TimePeriods();
                t.setId(rs.getInt("id"));
                t.setEndChangeClass(rs.getDate("end_time_class_change"));
                t.setStartChangeClass(rs.getDate("start_time_class_change"));
                t.setEndRegister(rs.getDate("end_time_register"));
                t.setStartRegister(rs.getDate("start_time_register"));
               t.setSemester(getSemester(rs.getInt("semester_id")));


                return t;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public Semester getSemester(int id) {
        String sql = "SELECT * FROM semester WHERE id  = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Semester s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                return s;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateTimeChangeClass(String start, String end, int semesterID) {
        String sql = "UPDATE timeperiods SET start_time_class_change = ?, end_time_class_change = ? WHERE semester_id = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));

            stm.setInt(3, semesterID);

            int rowsUpdated = stm.executeUpdate();

            if (rowsUpdated == 0) {
                System.out.println("No rows updated. No SU24 period found in the database.");
            } else {
                System.out.println("TimePeriods updated successfully.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTimeRegister(String start, String end, int semesterID) {
        String sql = "UPDATE timeperiods SET start_time_register = ?, end_time_register = ? WHERE semester_id = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));

            stm.setInt(3, semesterID);

            int rowsUpdated = stm.executeUpdate();

            if (rowsUpdated == 0) {
                System.out.println("No rows updated. No SU24 period found in the database.");
            } else {
                System.out.println("TimePeriods updated successfully.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
