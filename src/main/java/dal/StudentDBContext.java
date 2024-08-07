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
        String sql = "SELECT  distinct c.course_id FROM curriculum c left join registercourse r on c.course_id = r.course_id\n" +
                "                left join student s on s.id = r.student_id\n" +
                "                                WHERE c.term_id <= ?\n" +
                "                              AND c.major_id = ?\n" +
                "              AND c.course_id NOT IN (SELECT g.course_id FROM total t join `group` g on g.id = t.group_id)\n" +
                "                          and c.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username =? )";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, termId);
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
        String sql = "    select g.course_id from total t join `group` g on g.id = t.group_id join student s on t.student_id = s.id join account a on a.account_id = s.acc_id where isPass =0 and a.username = ?\n" +
                "          \n" +
                "                and g.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username =? )";

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
        String sql = "    select g.course_id from total t join `group` g on g.id = t.group_id join student s on t.student_id = s.id join account a on a.account_id = s.acc_id where isPass =1 and a.username = ?\n" +
                "                and g.course_id not in ( select r.Course_id from registercourse r join student s on s.id= r.student_id join account a on a.account_id = s.acc_id where a.username =? )";

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

    public void deleteCourseRegister(String userName,int semesterID, int courseID){
       String sql ="WITH ids_to_delete AS (\n" +
               "    SELECT r.id\n" +
               "    FROM registercourse r\n" +
               "    JOIN student s ON r.student_id = s.id\n" +
               "    JOIN account a ON a.account_id = s.acc_id\n" +
               "    WHERE a.username = ?\n" +
               "    AND r.course_id = ?\n" +
               "    AND semester = ?\n" +
               ")\n" +
               "DELETE FROM registercourse\n" +
               "WHERE id IN (SELECT id FROM ids_to_delete);\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,userName);
            stm.setInt(2,courseID);
            stm.setInt(3,semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Course> getCoursePrequisite(int courseID){
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT pre_course_id FROM prequisite_course where course_id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1,courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = courseDBContext.getCourseByID(rs.getInt("pre_course_id"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public static void main(String[] args) throws SQLException {
        StudentDBContext s = new StudentDBContext();
        System.out.println(s.getMajorID("student40"));
    }

    public boolean checkCoursePassOrNot( String username, int courseID){
        String sql = "select isPass from total t join student s on t.student_id = s.id join account a on a.account_id = s.acc_id where isPass =1 and a.username =? and t.course_id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setInt(2,courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }


    public boolean checkCourseCanRegister(String username, int courseID) throws SQLException {
        StudentDBContext studentDBContext = new StudentDBContext();
        ArrayList<Course> coursePre = studentDBContext.getCoursePrequisite(courseID);
        for (Course course : coursePre) {
            if (!studentDBContext.checkCoursePassOrNot(username, course.getId())) {
                return false;
            }
        }
        return true;
    }
    public int getMajorID ( String username){
        int majorID = 0;

        String sql = "select major_id from student s join account a on s.acc_id = a.account_id where a.username =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                majorID = rs.getInt("major_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return majorID;
    }






}
