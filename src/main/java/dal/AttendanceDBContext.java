package dal;

import model.*;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendanceForStudent(String sid, Date from, Date to) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "select ses.id as sesid, ses.teacher_id as teacherid, r.detail as room, ses.date, ses.isTaken, att.isPresent, att.time, att.description, en.student_id, g.id as groupid, g.name as groupname, c.code as coursecode, sl.id as slot, sl.start, sl.end\n" +
                    "from enrollment en inner join session ses on en.group_id = ses.group_id \n" +
                    "inner join swp391.group g on g.id = en.group_id inner join slot sl on sl.id = ses.slot_id inner join teacher t on t.id = ses.teacher_id \n" +
                    "inner join room r on r.id = ses.room_id inner join course c on c.id = g.course_id \n" +
                    "left join attendance att on att.ses_id = ses.id and att.student_id = en.student_id where en.student_id = ? and ses.date between ? and ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Session ses = new Session();
                Course c = new Course();
                Group g = new Group();
                Room r = new Room();
                Slot sl = new Slot();
                Teacher t = new Teacher();
                ses.setId(rs.getInt("sesid"));
                c.setCode(rs.getString("coursecode"));
                g.setId(rs.getInt("groupid"));
                g.setCourse(c);
                g.setName(rs.getString("groupname"));
                r.setDetail(rs.getString("room"));
                sl.setId(rs.getInt("slot"));
                sl.setStartTime(rs.getTime("start"));
                sl.setEndTime(rs.getTime("end"));
                ses.setSlot(sl);
                ses.setTeacher(t);
                ses.setGroup(g);
                ses.setDate(rs.getDate("date"));
                ses.setTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
                ses.setSlot(sl);
                att.setSession(ses);
                att.setPresent(rs.getBoolean("isPresent"));
                att.setDate(rs.getTimestamp("time"));
                att.setDescription(rs.getString("description"));

                attendances.add(att);
            }
        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return attendances;
    }

    public ArrayList<Attendance> getAttendancesForTeacher(int sesid) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "select s.id, acc.fullname, g.id as groupid, g.name as groupname, att.id as attid, att.description, att.isPresent, att.time, ses.date,ses.isTaken as isTaken, sl.id as slot, sl.start, sl.end from student s inner join enrollment en on en.student_id = s.id inner join swp391.group g on g.id = en.group_id\n" +
                    "inner join swp391.session ses on ses.group_id = g.id left join attendance att on att.ses_id = ses.id and att.student_id = s.id inner join swp391.account acc on acc.account_id = s.acc_id\n" +
                    "inner join slot sl on sl.id = ses.slot_id where ses.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Group g = new Group();
                Session ses = new Session();
                Account acc = new Account();
                Slot sl = new Slot();
                sl.setId(rs.getInt("slot"));
                sl.setStartTime(rs.getTime("start"));
                sl.setEndTime(rs.getTime("end"));
                ses.setSlot(sl);
                s.setId(rs.getString("id"));
                acc.setFullname(rs.getString("fullname"));
                s.setAccount(acc);
                g.setId(rs.getInt("groupid"));
                g.setName(rs.getString("groupname"));
                ses.setDate(rs.getDate("date"));
                ses.setId(sesid);
                ses.setGroup(g);
                ses.setTaken(rs.getBoolean("isTaken"));
                ses.updateLockStatus();
                att.setId(rs.getInt("attid"));
                att.setStudent(s);
                att.setSession(ses);
                att.setPresent(rs.getBoolean("isPresent"));
                att.setDate(rs.getTimestamp("time"));
                att.setDescription(rs.getString("description"));
                attendances.add(att);
            }

        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return attendances;
    }

    public void update(String description, int sesid, String studentid, Boolean present) {

        try {
            String sql = "update attendance set description = ?, isPresent = ?, time = now() where ses_id = ? and student_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setBoolean(2, present);
            stm.setInt(3, sesid);
            stm.setString(4, studentid);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void add(String description, int sesid, String studentid, Boolean present) {
        try {
            String sql = "insert into attendance (description, isPresent, ses_id, student_id, time) values(?,?,?,?,now())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setBoolean(2, present);
            stm.setInt(3, sesid);
            stm.setString(4, studentid);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Attendance getAttendance(int sesid, String student_id) {
        Attendance att = new Attendance();
        try {
            String sql = "select ses.id as sesid, ses.teacher_id as teacherid, acc.fullname as teachername, r.detail as room, ses.date, ses.isTaken, att.isPresent, att.time, att.description, en.student_id, g.id as groupid, g.name as groupname, c.code as coursecode, c.detail as coursename, sl.id as slot, sl.start, sl.end\n" +
                    "from enrollment en inner join session ses on en.group_id = ses.group_id \n" +
                    "inner join swp391.group g on g.id = en.group_id inner join slot sl on sl.id = ses.slot_id inner join teacher t on t.id = ses.teacher_id \n" +
                    "inner join room r on r.id = ses.room_id inner join course c on c.id = g.course_id inner join account acc on acc.account_id = t.acc_id \n" +
                    "left join attendance att on att.ses_id = ses.id and att.student_id = en.student_id where en.student_id = ? and ses.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            stm.setInt(2, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session ses = new Session();
                Course c = new Course();
                Group g = new Group();
                Room r = new Room();
                Slot sl = new Slot();
                Teacher t = new Teacher();
                Account acc = new Account();
                acc.setFullname(rs.getString("teachername"));
                t.setAccount(acc);
                ses.setId(rs.getInt("sesid"));
                c.setCode(rs.getString("coursecode"));
                c.setDetail(rs.getString("coursename"));
                g.setId(rs.getInt("groupid"));
                g.setCourse(c);
                g.setName(rs.getString("groupname"));
                r.setDetail(rs.getString("room"));
                sl.setId(rs.getInt("slot"));
                sl.setStartTime(rs.getTime("start"));
                sl.setEndTime(rs.getTime("end"));
                ses.setSlot(sl);
                ses.setTeacher(t);
                ses.setGroup(g);
                ses.setDate(rs.getDate("date"));
                ses.setTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
                ses.setSlot(sl);
                att.setSession(ses);
                att.setPresent(rs.getBoolean("isPresent"));
                att.setDate(rs.getTimestamp("time"));
                att.setDescription(rs.getString("description"));

            }
        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return att;
    }

    @Override
    public ArrayList<Attendance> list() {
        return null;
    }

    @Override
    public void insert(Attendance entity) {

    }

    @Override
    public void update(Attendance entity) {

    }

    @Override
    public void delete(Attendance entity) {

    }

    @Override
    public Attendance get(int id) throws SQLException {
        return null;
    }
}
