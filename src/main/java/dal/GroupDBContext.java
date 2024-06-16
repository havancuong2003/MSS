package dal;

import model.Account;
import model.Group;
import model.Student;
import model.Teacher;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class GroupDBContext extends DBContext<Group> {
    private final CourseDBContext courseDBContext = new CourseDBContext();

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

    public ArrayList<Student> getStudentRegister(int courseID, int semesterID) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "select student_id from registercourse r join semester s on r.semester = s.id where course_id = ? and s.id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            stm.setInt(2, semesterID);
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
                a.setAid(rs.getInt("account_id"));
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
        String sql = "insert into enrollment(group_id,student_id) values(?,?)";

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

    public void setCreateGroupInSemester(int id) {
        String sql = "UPDATE semester SET isCreate = 1 WHERE (id = ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean getStatusCreateGroup(int semesterID) {
        String sql = "select isCreate from semester where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getBoolean("isCreate");
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteEnrollment(int semesterID) {
        String sql = "delete from enrollment where group_id in (select id from `group` where semester_id =?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteGroup(int semesterID) {
        String sql = "delete from `group` where semester_id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void setIsCreateIsFalse(int semesterID) {
        String sql = "UPDATE semester SET isCreate = 0 WHERE (id = ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Group> getGroupBySemester(int semesterID) {
        ArrayList<Group> groups = new ArrayList<>();
        String sql = "select * from `group` where semester_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCourse(courseDBContext.getCourseByID(rs.getInt("course_id")));
                g.setTeacher(getTeacherByID(rs.getString("pic")));
                groups.add(g);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return groups;
    }

    public Teacher getTeacherByID(String tid) {
        Teacher t = null;
        String sql = "select * from account a join teacher t on t.acc_id = a.account_id where t.id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, tid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                t = new Teacher();
                t.setAid(rs.getInt("id"));
                t.setAccount(getAccountByID(rs.getInt("acc_id")));
                return t;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return t;
    }

    public ArrayList<String> getInfoRegisterCourse(int semesterID) {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT student_id,code FROM registercourse r join course c on c.id =r.course_id where r.semester =? order by student_id;";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String student_id = rs.getString("student_id");
                String code = rs.getString("code");
                list.add(student_id + ";" + code);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public ArrayList<Group> getGroupForStudent(int semesterID, String username) {
        ArrayList<Group> list = new ArrayList<>();
        String sql = "SELECT e.group_id,g.course_id FROM enrollment e join `group` g on g.id=e.group_id join student s on s.id=e.student_id join account a on a.account_id=s.acc_id where g.semester_id=? and a.username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            stm.setString(2, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("group_id"));
                g.setCourse(courseDBContext.getCourseByID(rs.getInt("course_id")));
                list.add(g);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

//    public Group getGroupByID(int groupID) {
//        Group g = null;
//        String sql = "select * from `group` where id = ?";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, groupID);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                g = new Group();
//                g.setId(rs.getInt("id"));
//                g.setCourse(courseDBContext.getCourseByID(rs.getInt("course_id")));
//                g.setTeacher(getTeacherByID(rs.getString("pic")));
//                g.setName(rs.getString("name"));
//                g.setLink(rs.getString("link"));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return g;
//    }

    public String getRole(int roleID) {
        String sql = "select description from role where id=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString("description");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public Group getGroupInfo(int groupID) {
        Group g = null;
        String sql = "SELECT distinct e.group_id,e.Detail,g.name,g.link,g.semester_id,g.course_id,g.PIC FROM enrollment e join `group` g on g.id=e.group_id where group_id=?\n" ;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                g = new Group();
                g.setId(rs.getInt("group_id"));
                g.setCourse(courseDBContext.getCourseByID(rs.getInt("course_id")));
                g.setTeacher(getTeacherByID(rs.getString("pic")));
                g.setName(rs.getString("name"));
                g.setLink(rs.getString("link"));
                g.setStudents(getStudentForGroupByGroupID(groupID));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return g;
    }

    public ArrayList<Student> getStudentForGroupByGroupID(int groupID) {
        String sql = "select student_id from enrollment where group_id=?";
        ArrayList<Student> list = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(getStudentByID(rs.getString("student_id")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void main(String[] args) {
        GroupDBContext dao = new GroupDBContext();
        Teacher teacher =   dao.getTeacherByID("t1");
        System.out.println(teacher.getUsername());
    }

}
