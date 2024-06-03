package dal;

import model.Account;
import model.Group;
import model.Student;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class GroupDBContext extends DBContext<Group> {

    @Override
    public ArrayList<Group> list() {
        return null;
    }

    @Override
    public void insert(Group entity) {

    }

    @Override
    public void update(Group entity) {

    }

    @Override
    public void delete(Group entity) {

    }

    @Override
    public Group get(int id) throws SQLException {
        return null;
    }

    public ArrayList<Student> getStudentRegister(int courseID, String detail) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "select student_id from registercourse r join semester s on r.semester = s.id where course_id = ? and detail = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            stm.setString(2, detail);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Student s = getStudentByID(rs.getString("student_id"));
                students.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }

    public Student getStudentByID(String id) {
        String sql = "select id,acc_id,current_term from student where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("id"));
               student.setAccount(getAccountByID(rs.getInt("acc_id")));
               student.setCurrentTerm(rs.getString("current_term"));
                return student;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public Account getAccountByID(int id) {
        Account a = null;
        String sql = "select account_id,username,password,fullname,phone,email,date_of_birth,address,role_id,gender from `account` where account_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullname(rs.getString("fullname"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setDob(rs.getDate("date_of_birth"));
                a.setAddress(rs.getString("address"));
                a.setRole_id(rs.getInt("role_id"));
                a.setGender(rs.getBoolean("gender"));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return a;
    }

    public Group createEnrollGroup(int gID, String sID) {
       Group g = null;
       String sql ="insert into enrollment(group_id,student_id) values(?,?)";

       try {
           PreparedStatement stm = connection.prepareStatement(sql);
           stm.setInt(1, gID);
           stm.setString(2, sID);
           stm.executeUpdate();
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
       return g;
    }

    public int getIDAfterCreateGroup(int courseID, int semester) {
        String sql = "insert into `group` (course_id, semester_id) values (?, ?)";
        int newId = -1;
        try {
            // Chỉ định truy vấn để trả về các khóa được tạo ra
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, courseID);
            stm.setInt(2, semester);

            // Thực thi truy vấn
            stm.executeUpdate();

            // Lấy khóa được sinh ra
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                newId = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newId;
    }

}
