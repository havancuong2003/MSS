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
            stm.execute();
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
