package dal;

import model.Course;
import model.Slot;
import model.TimeSlot;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SlotDBContext extends DBContext<TimeSlot> {
    public ArrayList<Slot> getSlots() {
        String sql = "select id,detail,start,end from slot";
        ArrayList<Slot> slots = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("id"));
                slot.setDetail(rs.getString("detail"));
                slot.setStartTime(rs.getTime("start"));
                slot.setEndTime(rs.getTime("end"));
                slots.add(slot);
            }
        } catch (SQLException e) {
            Logger.getLogger(SlotDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return slots;
    }

    public boolean checkDateRangeValid(Date startDate, Date endDate) {
        String sql = "SELECT COUNT(*) FROM semester WHERE (start <= ? AND end >= ?) OR (start <= ? AND end >= ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, endDate);
            statement.setDate(2, startDate);
            statement.setDate(3, startDate);
            statement.setDate(4, endDate);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count == 0; // Return true if no overlapping date ranges are found
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkDateRangeValidForUpdate(Date startDate, Date endDate, int id) {
        String sql = "SELECT COUNT(*) FROM semester WHERE ((start <= ? AND end >= ?) OR (start <= ? AND end >= ?)) AND id != ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, endDate);
            statement.setDate(2, startDate);
            statement.setDate(3, startDate);
            statement.setDate(4, endDate);
            statement.setInt(5, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count == 0; // Return true if no overlapping date ranges are found
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }


    public void updateSlot(Slot slot) {
        try {
            String sql = "UPDATE slot SET detail = ?, start = ?, end = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, slot.getDetail());
            stm.setTime(2, slot.getStartTime());
            stm.setTime(3, slot.getEndTime());
            stm.setInt(4, slot.getId());
            stm.execute();
        } catch (SQLException e) {
            Logger.getLogger(SlotDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean deleteSlot(int slotId) {
        try {
            String sql = "DELETE FROM slot WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, slotId);

            int rowsAffected = stm.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            Logger.getLogger(SlotDBContext.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }



    public ArrayList<Slot> getSlotsBySearchName(String searchName) {
        String sql = "select id,detail,start,end from slot where detail like '%" + searchName + "%'";
        ArrayList<Slot> slots = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("id"));
                slot.setDetail(rs.getString("detail"));
                slot.setStartTime(rs.getTime("start"));
                slot.setEndTime(rs.getTime("end"));
                slots.add(slot);
            }
        } catch (SQLException e) {
            Logger.getLogger(SlotDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return slots;
    }



    @Override
    public ArrayList<TimeSlot> list() {
        String sql = "select id,detail from slot";

        ArrayList<TimeSlot> slots = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TimeSlot slot = new TimeSlot();
                slot.setId(rs.getInt("id"));
                slot.setDescription(rs.getString("detail"));
                slots.add(slot);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slots;
    }

    public void addSlot(Slot slot) {
        try {
            String sql = "INSERT INTO slot (detail, start, end) VALUES (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, slot.getDetail());
            stm.setTime(2, slot.getStartTime());
            stm.setTime(3, slot.getEndTime());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void insert(TimeSlot entity) {

    }

    @Override
    public void update(TimeSlot entity) {

    }

    @Override
    public void delete(TimeSlot entity) {

    }

    @Override
    public TimeSlot get(int id) throws SQLException {
        return null;
    }
}
