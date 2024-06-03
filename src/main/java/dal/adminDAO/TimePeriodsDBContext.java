package dal.adminDAO;

import dal.DBContext;
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
    public void createTimeChangeGroup(String start,String end,String description){
        String sql = "INSERT INTO `timeperiods` (`start_time_class_change`, `end_time_class_change`,description) VALUES (?, ?,?);";

        try {
            PreparedStatement   stm = connection.prepareStatement(sql);
            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));
            stm.setString(3,description);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void createTimeRegister(String start,String end,String description){
        String sql = "INSERT INTO `timeperiods` (`start_time_register`, `end_time_register`,description) VALUES (?, ?,?);";

        try {
            PreparedStatement   stm = connection.prepareStatement(sql);
            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));
            stm.setString(3,description);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public TimePeriods getTimePeriods(String description) {
        String sql = "SELECT * FROM timeperiods WHERE description = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                TimePeriods t = new TimePeriods();
                t.setId(rs.getInt("id"));
t.setEndChangeClass(rs.getDate("end_time_class_change"));
t.setStartChangeClass(rs.getDate("start_time_class_change"));
t.setEndRegister(rs.getDate("end_time_register"));
t.setStartRegister(rs.getDate("start_time_register"));
t.setStatus(rs.getString("status"));


                t.setDescription(rs.getString("description"));
                return t;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateTimeChangeClass(String start, String end,String description){
        String sql = "UPDATE timeperiods SET start_time_class_change = ?, end_time_class_change = ? WHERE description = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));

            stm.setString(3, description);

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

    public void updateTimeRegister(String start, String end,String description){
        String sql = "UPDATE timeperiods SET start_time_register = ?, end_time_register = ? WHERE description = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDate(1, java.sql.Date.valueOf(start));
            stm.setDate(2, java.sql.Date.valueOf(end));

            stm.setString(3, description);

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
