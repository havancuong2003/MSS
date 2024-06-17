package dal;

import model.Course;
import model.Curriculum;
import model.Major;
import model.PrequisiteCourse;
import model.Major;
import model.Term;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CurriculumDBContext extends DBContext<Curriculum>{

    public Curriculum getCurriculum (int majorid){
        Curriculum c = new Curriculum();
        TermDBContext tdb = new TermDBContext();
        ArrayList<Term> terms = new ArrayList<>();
        try {
            String sql = "select distinct c.major_id, c.term_id from curriculum c where c.major_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, majorid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int t = rs.getInt("term_id");
                Term term = tdb.getTerm(t, majorid);
                terms.add(term);
            }
            c.setTerms(terms);
        }catch (SQLException e) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
    CourseDBContext courseDBContext = new CourseDBContext();


    public void AddCourseToCurriculum(int majorid, int courseid, int term, String description) {
        try {
            String sql = "insert into curriculum (`major_id`,`course_id`,`term_id`,`description`) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, majorid);
            stm.setInt(2, courseid);
            stm.setInt(3, term);
            stm.setString(4, description);
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

public ArrayList<Term> getTermForCurriculum(int majorId) throws SQLException {
    ArrayList<Term> terms = new ArrayList<>();
    String sql = "select distinct term_id  from curriculum c where major_id=?";
  try {
      PreparedStatement stm = connection.prepareStatement(sql);
      stm.setInt(1, majorId);
      ResultSet rs = stm.executeQuery();
      while (rs.next()) {
          Term term = new Term();
          term.setId(rs.getInt("term_id"));
          term.setCourses(getCourseForCurriculum(rs.getInt("term_id"),majorId));
          term.setMajor(getMajorByID(majorId));
          terms.add(term);
      }
  } catch (SQLException e) {
      e.printStackTrace();
  }
    return terms;
}

public Major getMajorByID(int id) throws SQLException {
        Major major = null;
    String sql = "select * from major where id=?";
    PreparedStatement stm = connection.prepareStatement(sql);
    stm.setInt(1, id);
    ResultSet rs = stm.executeQuery();
    while (rs.next()) {
         major = new Major();
        major.setId(rs.getInt("id"));
        major.setCode(rs.getString("code"));
        major.setDetail(rs.getString("detail"));
        return major;
    }
    return major;
}

public ArrayList<Course> getCourseForCurriculum(int termId,int majorId) throws SQLException {
    ArrayList<Course> courses = new ArrayList<>();
    String sql = "select distinct course_id ,c.description as descriptionPre,cr.description from curriculum c join course cr on c.course_id = cr.id where major_id=? and term_id=?";
    PreparedStatement stm = connection.prepareStatement(sql);
    stm.setInt(1, majorId);
    stm.setInt(2, termId);
    ResultSet rs = stm.executeQuery();
    while (rs.next()) {
        Course course = courseDBContext.getCourseByID(rs.getInt("course_id"));
        ArrayList<Course> coursePrerequisite = courseDBContext.getPrerequisiteCourseByCourseID(rs.getInt("course_id"));
       course.setPrerequisiteCourses(coursePrerequisite);
       course.setDescriptionPrerequisiteCourses(rs.getString("descriptionPre"));
       course.setDescription(rs.getString("description"));
        courses.add(course);
    }
    return courses;
}


}
