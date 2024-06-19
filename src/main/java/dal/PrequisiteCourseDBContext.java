package dal;
import java.sql.*;
import java.util.ArrayList;

import model.Course;
import model.PrequisiteCourse;

public class PrequisiteCourseDBContext extends DBContext<Course> {
    public void addPrequisiteCourse(int courseID, int preCourseID){
        try {
            String sql = "insert into prequisite_course (`course_id`,`pre_course_id`) values(?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            stm.setInt(2, preCourseID);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<PrequisiteCourse> getPrequisiteCourseList(){
        ArrayList<PrequisiteCourse> prequisiteCourses = new ArrayList<>();
        try {
            String sql = "select pc.course_id, c1.code, pc.pre_course_id, c2.code as pre_course_code from prequisite_course pc inner join " +
                    "course c1 on pc.course_id = c1.id inner join course c2 on c2.id = pc.pre_course_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                Course preCourse = new Course();
                PrequisiteCourse prequisiteCourse = new PrequisiteCourse();
                course.setId(rs.getInt("course_id"));
                course.setCode(rs.getString("code"));
                preCourse.setId(rs.getInt("pre_course_id"));
                preCourse.setCode(rs.getString("pre_course_code"));
                prequisiteCourse.setCourse(course);
                prequisiteCourse.setPreCourse(preCourse);
                prequisiteCourses.add(prequisiteCourse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prequisiteCourses;

    }
    @Override
    public ArrayList<Course> list() {
        return null;
    }

    @Override
    public void insert(Course entity) {

    }

    @Override
    public void update(Course entity) {

    }

    @Override
    public void delete(Course entity) {

    }

    @Override
    public Course get(int id) throws SQLException {
        return null;
    }
}
