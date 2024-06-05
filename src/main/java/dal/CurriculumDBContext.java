package dal;

import model.Course;
import model.Curriculum;
import model.Major;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CurriculumDBContext extends DBContext<Curriculum>{

    public ArrayList<Curriculum> getCurriculumList(int majorId) {
        ArrayList<Curriculum> curriculums = new ArrayList<>();
        try {
            String sql = "select id,major_id,term,course_id,prequisite_course_id,description from curriculum where major_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1,majorId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                Course prequisiteCourse = new Course();
                c.setId(rs.getInt("course_id"));
                prequisiteCourse.setId(rs.getInt("prequisite_course_id"));
                Major m = new Major();
                m.setId(rs.getInt("major_id"));
                Curriculum curriculum = new Curriculum();
                curriculum.setId(rs.getInt("id"));
                curriculum.setMajor(m);
                curriculum.setCourse(c);
                curriculum.setPrequisiteCourse(prequisiteCourse);
                curriculum.setTerm(rs.getInt("term"));
                curriculum.setDescription(rs.getString("description"));
                curriculums.add(curriculum);
            }
        } catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return curriculums;

    }

    public void AddCourseToCurriculum(int majorid, int courseid, int prequisiteCourseid, int term, String description) {
        try {
            String sql = "insert into curriculum (`major_id`,`course_id`,`prequisite_course_id`,`term`,`description`) values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, majorid);
            stm.setInt(2, courseid);
            stm.setInt(3, prequisiteCourseid);
            stm.setInt(4, term);
            stm.setString(5, description);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void DeleteCourseFromCurriculum(int courseid, int majorid) {
        try {
            String sql = "delete from curriculum where course_id = ? and major_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseid);
            stm.setInt(2, majorid);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void DeleteCurriculum(int id) {
        try {
            String sql = "delete from curriculum where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int GetNumberCourseInATerm(int term, int majorid){
        int number = 0;
        try {
            String sql = "select count(*) from curriculum where term = ? and major_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, term);
            stm.setInt(2, majorid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                number = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return number;
    }

    

    @Override
    public ArrayList<Curriculum> list() {
        return null;
    }

    @Override
    public void insert(Curriculum entity) {

    }

    @Override
    public void update(Curriculum entity) {

    }

    @Override
    public void delete(Curriculum entity) {

    }

    @Override
    public Curriculum get(int id) throws SQLException {
        return null;
    }
}
