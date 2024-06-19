package dal;

import model.Account;
import model.Course;
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
