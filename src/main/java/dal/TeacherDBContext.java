package dal;

import model.Account;
import model.MarkData;
import model.Teacher;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TeacherDBContext extends DBContext<MarkData>{

    public ArrayList<MarkData> getCourseList() {
        ArrayList<MarkData> markList = new ArrayList<>();
        try {
            String sql = "SELECT m.student_id, c.code AS course_code, gc.name AS grade_category_name, gi.name AS grade_item_name, gi.weight AS grade_item_weight, m.grade \n" +
                    "FROM mark m \n" +
                    "JOIN grade_item gi ON m.grade_item_id = gi.id \n" +
                    "JOIN grade_category gc ON gi.grade_categoryid = gc.id \n" +
                    "JOIN course c ON gc.course_id = c.id\n" +
                    "ORDER BY m.student_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MarkData mark = new MarkData();
                mark.setStudentId(rs.getString("student_id"));
                mark.setCourseCode(rs.getString("course_code"));
                mark.setGradeCategoryName(rs.getString("grade_category_name"));
                mark.setGradeItemName(rs.getString("grade_item_name")); // Đặt giá trị cho thuộc tính gradeItemName
                mark.setGradeItemWeight(rs.getFloat("grade_item_weight"));
                mark.setGrade(rs.getFloat("grade"));
                markList.add(mark);
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return markList;
    }

    public ArrayList<Teacher> searchTeacherByAccountFullNameOrId(String search) {
        ArrayList<Teacher> teacherList = new ArrayList<>();
        try {
            String sql = "SELECT t.id, a.fullname\n" +
                    "FROM teacher t inner join account a on t.acc_id = a.account_id\n" +
                    "WHERE a.fullname LIKE ? OR t.id LIKE ? LIMIT 3";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("id"));
                Account acc = new Account();
                acc.setFullname(rs.getString("fullname"));
                teacher.setAccount(acc);
                teacherList.add(teacher);
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return teacherList;
    }

    //- -------------------------------------------------------------------------------------------------------------
    //- -------------------------------------------------------------------------------------------------------------
    //- -------------------------------------------------------------------------------------------------------------
    //- -------------------------------------------------------------------------------------------------------------
    public static void main(String[] args) {
        TeacherDBContext t = new TeacherDBContext();
        System.out.println(t.checkTeacherCanTeachCourse("t1","t2",1,"2024-06-10"));
    }
    public boolean checkTeacherTeachThisSession(String teacherid, String date, int slotID) {
        String sql = "select * from `session` where teacher_id =? and date =? and slot_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, teacherid);
            stm.setString(2, date);
            stm.setInt(3, slotID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean checkTeacherCanTeachCourse(String currentTeacher, String targetTeacher, int slotID, String date) {
        String sql ="\n" +
                "select * from teacher_course where teacher_id = ? and course_id = \n" +
                "(select g.course_id from `session` s join `group` g on s.group_id = g.id where s.id = \n" +
                "( select s.id from `session` s        \n" +
                "join teacher t on t.id = s.teacher_id  \n" +
                "join `group` g on s.group_id = g.id\n" +
                "where s.date =? and s.teacher_id=? and s.slot_id=?)\n" +
                ")";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, targetTeacher);
            stm.setString(2, date);
            stm.setString(3, currentTeacher);
            stm.setInt(4, slotID);

            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean checkTeacherExist(String teacherid) {
        String sql = "select * from teacher where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, teacherid);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public void ChangeSessionTeacher(String teacherid,String currentTeacher, int slotID,String date) {
        String sql ="UPDATE `session` s1\n" +
                "JOIN (\n" +
                "    SELECT id\n" +
                "    FROM `session`\n" +
                "    WHERE date = ? AND teacher_id = ? AND slot_id = ?\n" +
                ") s2 ON s1.id = s2.id\n" +
                "SET s1.teacher_id = ?\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, date);
            stm.setString(2, currentTeacher);
            stm.setInt(3, slotID);
            stm.setString(4, teacherid);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }



    @Override
    public ArrayList<MarkData> list() {
        return null;
    }

    @Override
    public void insert(MarkData entity) {

    }

    @Override
    public void update(MarkData entity) {

    }

    @Override
    public void delete(MarkData entity) {

    }

    @Override
    public MarkData get(int id) throws SQLException {
        return null;
    }
}
