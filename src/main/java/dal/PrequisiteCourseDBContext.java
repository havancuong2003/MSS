package dal;
import java.sql.*;
import java.util.ArrayList;

import model.Course;

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
