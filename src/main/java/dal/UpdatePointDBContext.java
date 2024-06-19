package dal;

import model.MarkData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdatePointDBContext extends DBContext<MarkData>{
    public MarkData getMarkDatabyId(int id) {
        try {
            String sql = "SELECT m.id, m.student_id, c.code AS course_code, gc.name AS grade_category_name, gi.name AS grade_item_name, gi.weight AS grade_item_weight, m.grade " +
                    "FROM mark m " +
                    "JOIN grade_item gi ON m.grade_item_id = gi.id " +
                    "JOIN grade_category gc ON gi.grade_categoryid = gc.id " +
                    "JOIN course c ON gc.course_id = c.id " +
                    "WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                MarkData m = new MarkData();
                m.setId(rs.getInt("id"));
                m.setStudentId(rs.getString("student_id"));
                m.setCourseCode(rs.getString("course_code"));
                m.setGradeCategoryName(rs.getString("grade_category_name"));
                m.setGradeItemName(rs.getString("grade_item_name"));
                m.setGradeItemWeight(rs.getFloat("grade_item_weight"));
                m.setGrade(rs.getFloat("grade"));
                return m;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public MarkData updateMarkData(MarkData m) {
        try {
            String sql = "UPDATE mark m\n"
                    + "JOIN grade_item gi ON m.grade_item_id = gi.id\n"
                    + "JOIN grade_category gc ON gi.grade_categoryid = gc.id\n"
                    + "JOIN course c ON gc.course_id = c.id\n"
                    + "SET m.grade = ?,\n"
                    + "    gi.weight = ?,\n"
                    + "    c.code = ?,\n"
                    + "    gc.name = ?,\n"
                    + "    gi.name = ?\n"
                    + "WHERE m.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, m.getGrade());
            stm.setFloat(2, m.getGradeItemWeight());
            stm.setString(3, m.getCourseCode());
            stm.setString(4, m.getGradeCategoryName());
            stm.setString(5, m.getGradeItemName());
            stm.setInt(6, m.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
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
