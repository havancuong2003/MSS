package dal;

import model.Course;

import java.sql.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDBContext extends DBContext<Course> {

    public CourseDBContext() {
    }

    public ArrayList<Course> searchByCode(String txtSearch) {
        ArrayList<Course> courses = new ArrayList<>();

        try {
            String sql = "SELECT * FROM course WHERE code like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+txtSearch+"%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getCourseList() {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "select id,code,detail from course";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));
                courses.add(course);
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return courses;
    }

    public void addCourse(Course course) {
        try {
            String sql = "insert into course (`code`,`detail`) values(?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, course.getCode());
            stm.setString(2, course.getDetail());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getMaxID() {
        int id = 0;
        try {
            String sql = "select max(id) from course";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return id;
    }

    public Course getCourseByID(int id) {
        Course course = new Course();
        try {
            String sql = "select * from course where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return course;
    }

    public void updateCourse(int id,String code, String detail){
        try {
            String sql = "UPDATE course " +
                    "SET\n" +
                    "`code` = ?,\n" +
                    "`detail` = ?\n" +
                    "WHERE `id` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,code);
            stm.setString(2,detail);
            stm.setInt(3,id);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

//   public HashMap<Integer,ArrayList<Course>> getCoursePrerequisite(){
//       HashMap<Integer,ArrayList<Course>> courses = new HashMap<>();
//       try {
//           String sql = "SELECT distinct course_id FROM prequisite_course";
//           PreparedStatement stm = connection.prepareStatement(sql);
//           ResultSet rs = stm.executeQuery();
//           while (rs.next()) {
//            int courseID = rs.getInt("course_id");
//           ArrayList<Course> listPrerequisite =getPrerequisiteCourseByCourseID(courseID);
//           courses.put(courseID,listPrerequisite);
//           }
//       } catch (SQLException e) {
//           throw new RuntimeException(e);
//       }
//       return courses;
//   }

   public ArrayList<Course> getPrerequisiteCourseByCourseID(int courseID){
       ArrayList<Course> courses = new ArrayList<>();
       try {
           String sql = "SELECT * FROM prequisite_course where course_id = ?";
           PreparedStatement stm = connection.prepareStatement(sql);
           stm.setInt(1, courseID);
           ResultSet rs = stm.executeQuery();
           while (rs.next()) {
              Course course = getCourseByID(rs.getInt("pre_course_id"));
               courses.add(course);
           }
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
       return courses;
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
    public Course get(int id) {
        return null;
    }
}
