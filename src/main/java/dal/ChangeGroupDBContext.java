package dal;

import model.ChangeGroup;
import model.Group;
import model.Semester;
import model.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ChangeGroupDBContext extends DBContext<ChangeGroup> {
    GroupDBContext gdbc = new GroupDBContext();
    CourseDBContext cdbc = new CourseDBContext();

    @Override
    public ArrayList<ChangeGroup> list() {
        return null;
    }

    @Override
    public void insert(ChangeGroup entity) {

    }

    @Override
    public void update(ChangeGroup entity) {

    }

    @Override
    public void delete(ChangeGroup entity) {

    }

    @Override
    public ChangeGroup get(int id) throws SQLException {
        return null;
    }



    public ArrayList<ChangeGroup> getAllRequired(String username, int semesterID) {
        ArrayList<ChangeGroup> changeGroups = new ArrayList<>();
        try {
            String sql = "select cc.id,fromStudent,fromGroup,toStudent,toGroup,status,semester from changeClass cc join Student s on s.id=cc.fromStudent join `account` a on a.account_id=s.acc_id\n" +
                    "                    where a.userName = ? and status = 'processing' and semester = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ChangeGroup c = new ChangeGroup();
                c.setId(rs.getInt("id"));
                c.setFromStudent(getStudentByID(rs.getString("fromStudent")));
                c.setToStudent(getStudentByID(rs.getString("toStudent")));
                c.setFromGroup(getGroupByID(rs.getInt("fromGroup")));
                c.setToGroup(getGroupByID(rs.getInt("toGroup")));
                c.setStatus(rs.getString("status"));
                c.setSemester(getSemesterByID(rs.getInt("semester")));
                changeGroups.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return changeGroups;
    }

    public ArrayList<ChangeGroup> getAllRequiredToSwap(String username, int semesterID) {
        ArrayList<ChangeGroup> changeGroups = new ArrayList<>();
        try {
            String sql = "select cc.id,fromStudent,fromGroup,toStudent,toGroup,status,semester from changeClass cc join Student s on s.id=cc.toStudent join `account` a on a.account_id=s.acc_id\n" +
                    "                    where a.userName = ? and status = 'processing' and semester = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ChangeGroup c = new ChangeGroup();
                c.setId(rs.getInt("id"));
                c.setFromStudent(getStudentByID(rs.getString("fromStudent")));
                c.setToStudent(getStudentByID(rs.getString("toStudent")));
                c.setFromGroup(getGroupByID(rs.getInt("fromGroup")));
                c.setToGroup(getGroupByID(rs.getInt("toGroup")));
                c.setStatus(rs.getString("status"));
                c.setSemester(getSemesterByID(rs.getInt("semester")));
                changeGroups.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return changeGroups;
    }

    public Student getStudentByID(String id) {
        Student s = null;
        try {
            String sql = "select id,acc_id,current_term from student where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new Student();
                s.setId(rs.getString("id"));
                s.setAccount(gdbc.getAccountByID(rs.getInt("acc_id")));
                s.setCurrentTerm(rs.getString("current_term"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Group getGroupByID(int id) {
        Group g = null;
        try {
            String sql = "select *\n" +
                    " from `group` where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                g = new Group();
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                g.setCourse(cdbc.getCourseByID(rs.getInt("course_id")));
                g.setTeacher(gdbc.getTeacherByID(rs.getString("pic")));
                g.setLink(rs.getString("link"));
                g.setSemester(getSemesterByID(rs.getInt("semester_id")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return g;
    }

    public Semester getSemesterByID(int id) {
        Semester s = null;
        try {
            String sql = "select * from `semester` where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                s.setStart(rs.getDate("start"));
                s.setEnd(rs.getDate("end"));
                s.setTotalCourseRegisterForNextSemester(rs.getInt("totalCourse"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }



    public void changeGroup(String fromStudent, int fromGroup, String toStudent, int toGroup, int changeID) {
        try {
            // Update the first student's group
            String sql1 = "UPDATE enrollment " +
                    "SET `group_id` = ? " +
                    "WHERE id = ( " +
                    "    SELECT id FROM ( " +
                    "        SELECT id FROM enrollment WHERE student_id = ? AND group_id = ? " +
                    "    ) AS subquery " +
                    ");";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            stm1.setInt(1, toGroup);
            stm1.setString(2, fromStudent);
            stm1.setInt(3, fromGroup);
            stm1.executeUpdate();
            stm1.close();

            // Update the second student's group
            String sql2 = "UPDATE enrollment " +
                    "SET `group_id` = ? " +
                    "WHERE id = ( " +
                    "    SELECT id FROM ( " +
                    "        SELECT id FROM enrollment WHERE student_id = ? AND group_id = ? " +
                    "    ) AS subquery " +
                    ");";
            PreparedStatement stm2 = connection.prepareStatement(sql2);
            stm2.setInt(1, fromGroup);
            stm2.setString(2, toStudent);
            stm2.setInt(3, toGroup);
            stm2.executeUpdate();
            stm2.close();

            // Update the changeclass status
            String sql3 = "UPDATE changeclass SET `status` = 'Accepted' WHERE id = ?";
            PreparedStatement stm3 = connection.prepareStatement(sql3);
            stm3.setInt(1, changeID);
            stm3.executeUpdate();
            stm3.close();

        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRequired(String id) {
        try {
            String sql = "	delete from changeClass\n"
                    + "					where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChangeGroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }




}
