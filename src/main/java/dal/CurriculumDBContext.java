package dal;

import model.Course;
import model.Curriculum;
import model.Major;
import model.Term;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CurriculumDBContext extends DBContext<Curriculum>{

    public void addCourseToCurriculum(){

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
    PreparedStatement stm = connection.prepareStatement(sql);
    stm.setInt(1, majorId);
    ResultSet rs = stm.executeQuery();
    while (rs.next()) {
        Term term = new Term();
        term.setId(rs.getInt("term_id"));
//        term.setTermDetail(rs.getString("name"));
        term.setCourses(getCourseForCurriculum(rs.getInt("term_id"),majorId));
        terms.add(term);
    }
    return terms;
}

public ArrayList<Course> getCourseForCurriculum(int termId,int majorId) throws SQLException {
    ArrayList<Course> courses = new ArrayList<>();
    String sql = "select distinct course_id  from curriculum c where major_id=? and term_id=?";
    PreparedStatement stm = connection.prepareStatement(sql);
    stm.setInt(1, majorId);
    stm.setInt(2, termId);
    ResultSet rs = stm.executeQuery();
    while (rs.next()) {
        Course course = new Course();
        course.setId(rs.getInt("course_id"));
        courses.add(course);
    }
    return courses;
}


}
