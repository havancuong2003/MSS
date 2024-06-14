package dal;

import model.Course;
import model.Student;

import java.sql.*;
import java.util.ArrayList;

public class StudentDBContext extends DBContext<Student> {
    CourseDBContext courseDBContext = new CourseDBContext();
    @Override
    public ArrayList<Student> list() {
        return null;
    }

    @Override
    public void insert(Student entity) {

    }

    @Override
    public void update(Student entity) {

    }

    @Override
    public void delete(Student entity) {

    }

    @Override
    public Student get(int id) throws SQLException {
        return null;
    }

    public int getCurrentTermOfStudent(String username) throws SQLException{
        String sql ="select current_term from account a join student s on a.account_id = s.acc_id where a.username = ?";
        int term =-1;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                term = rs.getInt("current_term");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return term;
    }

    public ArrayList<Course> getAllCourseRegisterForStudent(int termId, int majorId,String username) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM curriculum c left join registercourse r on c.course_id = r.course_id\n" +
                "left join student s on s.id = r.student_id\n" +
                "                WHERE c.term_id <= ?\n" +
                "                AND c.major_id = ?\n" +
                "\t\t\tAND c.course_id NOT IN (SELECT course_id FROM total)\n" +
                "            and c.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username =? )";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, termId+1);
            stm.setInt(2, majorId);
            stm.setString(3,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = courseDBContext.getCourseByID(rs.getInt("course_id"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getCourseRegisterAgain(String username) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "select t.course_id from total t join student s on t.student_id = s.id join account a on a.account_id = s.acc_id where isPass =0 and a.username =?\n" +
                "\n" +
                " and t.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username = ? )";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = courseDBContext.getCourseByID(rs.getInt("course_id"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getCourseRegisterImprove(String username) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "select t.course_id from total t join student s on t.student_id = s.id join account a on a.account_id = s.acc_id where isPass =1 and a.username =? \n" +
                "\n" +
                " and t.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username =? )";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = courseDBContext.getCourseByID(rs.getInt("course_id"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getCoursesRegistered(String username,int semesterID){
        String sql ="SELECT r.course_id FROM registercourse r join student s on r.student_id = s.id join account a on a.account_id  = s.acc_id where a.username =? and r.semester =?";

        ArrayList<Course> courses = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setInt(2,semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = courseDBContext.getCourseByID(rs.getInt("course_id"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public String getStudentID(String username){
        String sql = "select id from student s join account a on s.acc_id = a.account_id where a.username =?";
        String id = "";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getString("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public String registerCourse(String studentID, int courseID, int semester){
        String sql = "INSERT INTO registercourse (student_id, course_id, semester) VALUES (?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,studentID);
            stm.setInt(2,courseID);
            stm.setInt(3,semester);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
