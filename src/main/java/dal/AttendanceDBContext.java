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
                    "left join attendance att on att.ses_id = ses.id where en.student_id = ? and ses.date between ? and ?";
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
                att.setDate(rs.getDate("time"));
                att.setDescription(rs.getString("description"));

                attendances.add(att);
            }
        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return attendances;
    }

    public ArrayList<Attendance> getAttendancesForTeacher(int sesid){
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
        String sql = "select s.id, acc.fullname, g.id as groupid, g.name as groupname, att.id as attid, att.description, att.isPresent, att.time  from student s inner join enrollment en on en.student_id = s.id inner join swp391.group g on g.id = en.group_id\n" +
                "inner join swp391.session ses on ses.group_id = g.id left join attendance att on att.ses_id = ses.id and att.student_id = s.id inner join swp391.account acc on acc.account_id = s.acc_id\n" +
                "where ses.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Group g = new Group();
                Session ses  = new Session();
                Account acc = new Account();

                s.setId(rs.getString("id"));
                acc.setFullname(rs.getString("fullname"));
                s.setAccount(acc);
                g.setId(rs.getInt("groupid"));
                g.setName(rs.getString("groupname"));
                ses.setId(sesid);
                ses.setGroup(g);
                att.setId(rs.getInt("attid"));
                att.setStudent(s);
                att.setSession(ses);
                att.setPresent(rs.getBoolean("isPresent"));
                att.setDate(rs.getDate("time"));
                att.setDescription(rs.getString("description"));
                attendances.add(att);
            }

        } catch (SQLException e) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return attendances;
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
