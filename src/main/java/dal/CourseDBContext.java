package dal;

import model.Course;

import java.sql.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDBContext extends DBContext<Course> {

    public ArrayList<Course> searchByCode(String txtSearch) {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT id, code, detail, description, credit, status FROM course WHERE code LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtSearch + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));
                course.setDescription(rs.getString("description"));
                course.setCredit(rs.getInt("credit"));
                course.setStatus(rs.getBoolean("status"));
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
            String sql = "SELECT id, code, detail, description, credit, status FROM course";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));
                course.setDescription(rs.getString("description"));
                course.setCredit(rs.getInt("credit"));
                course.setStatus(rs.getBoolean("status"));
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
