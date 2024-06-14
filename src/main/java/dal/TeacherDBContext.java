package dal;

import model.Course;
import model.MarkData;

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
