package dal;

import model.*;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SessionDBContext extends DBContext<Session> {
    public ArrayList<Session> getSessionForTeacher(String teacher_id, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "select s.id, c.code as coursecode, c.detail as coursename, g.name as groupname, s.date, r.detail as room, sl.id as slot_id, sl.detail , sl.start , sl.end, s.isTaken from 'session' s inner join 'group' g on s.group_id = g.id inner join course c on c.id = g.course_id inner join room r \n" +
                    "on r.id = s.room_id inner join slot sl on sl.id = s.slot_id where s.teacher_id = ? and s.date between ? and ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, teacher_id);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                Group g = new Group();
                Slot sl = new Slot();
                Room r = new Room();
                Session s = new Session();
                c.setCode(rs.getString("coursecode"));
                c.setDetail(rs.getString("coursename"));
                g.setName(rs.getString("groupname"));
                g.setCourse(c);
                s.setGroup(g);
                s.setDate(rs.getDate("date"));
                r.setDetail(rs.getString("room"));
                s.setRoom(r);
                s.setSlot(sl);
                sl.setId(rs.getInt("slot_id"));
                sl.setDetail(rs.getString("detail"));
                sl.setStartTime(rs.getTime("start"));
                sl.setEndTime(rs.getTime("end"));
                s.setSlot(sl);
                s.setTaken(rs.getBoolean("isTaken"));
                s.setId(rs.getInt("id"));
                s.updateLockStatus();
                sessions.add(s);
            }
        } catch (SQLException e) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return sessions;
    }

    public boolean getIsTakenSession(int sesid){
        try {
            String sql = "select s.isTaken from 'session' s where s.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getBoolean("isTaken");
            }
        } catch (SQLException e) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public void updateIsTakenSession(int sesid){
        try {
            String sql = "update 'session' set isTaken = 1 where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    @Override
    public ArrayList<Session> list() {
        return null;
    }

    @Override
    public void insert(Session entity) {

    }

    @Override
    public void update(Session entity) {

    }

    @Override
    public void delete(Session entity) {

    }

    @Override
    public Session get(int id) throws SQLException {
        return null;
    }
}
