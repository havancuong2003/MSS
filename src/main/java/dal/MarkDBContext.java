package dal;

import model.*;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class MarkDBContext extends DBContext<Mark> {

    public ArrayList<Mark> getMarkForStudent(String sid, int groupid, int semesterId) {
        ArrayList<Mark> marks = new ArrayList<>();
        try {
            String sql = "select gc.name as catename, gi.name as itemname,gc.id as cateid, gi.id as itemid, gi.weight, m.grade from swp391.group g inner join enrollment en on g.id = en.group_id\n" +
                    "inner join semester se on se.id = g.semester_id\n" +
                    "inner join course co on co.id = g.course_id\n" +
                    "inner join grade_category gc on gc.course_id = co.id\n" +
                    "inner join grade_item gi on gi.grade_categoryid = gc.id\n" +
                    "left join mark m on m.grade_item_id = gi.id and m.student_id = en.student_id \n" +
                    "where en.student_id = ? and g.semester_id = ? and g.id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, semesterId);
            stm.setInt(3, groupid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mark ma = new Mark();
                Category c = new Category();
                Assessment a = new Assessment();
                c.setId(rs.getInt("cateid"));
                c.setCategoryName(rs.getString("catename"));
                a.setId(rs.getInt("itemid"));
                a.setItem(rs.getString("itemname"));
                a.setWeight(rs.getFloat("weight"));
                Float grade = (Float) rs.getObject("grade");
                ma.setGrade(grade);
                a.setCategory(c);
                ma.setGradeItem(a);
                marks.add(ma);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return marks;
    }

    public ArrayList<Mark> getMarkForTeacherByTidSemesterGid(String tid, int semesterId, int groupid) {
        ArrayList<Mark> marks = new ArrayList<>();
        try {
            String sql = "select stu.id, acc.fullname, gc.id as cateid, gc.name as catename, gi.id as itemid , \n" +
                    "gi.name as itemname, gi.weight , m.grade\n" +
                    "from swp391.group g inner join semester se on se.id = g.semester_id\n" +
                    "inner join enrollment en on g.id = en.group_id\n" +
                    "inner join course co on co.id = g.course_id\n" +
                    "inner join grade_category gc on gc.course_id = co.id\n" +
                    "inner join grade_item gi on gi.grade_categoryid = gc.id\n" +
                    "inner join student stu on stu.id = en.student_id\n" +
                    "left join mark m on m.grade_item_id = gi.id and m.student_id = en.student_id \n" +
                    "inner join account acc on acc.account_id = stu.acc_id\n" +
                    "where g.PIC = ? and g.semester_id = ? and g.id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, tid);
            stm.setInt(2, semesterId);
            stm.setInt(3, groupid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mark m = new Mark();
                Category c = new Category();
                Assessment a = new Assessment();
                Student s = new Student();
                Account a1 = new Account();
                c.setId(rs.getInt("cateid"));
                c.setCategoryName(rs.getString("catename"));
                a.setId(rs.getInt("itemid"));
                a.setItem(rs.getString("itemname"));
                a.setWeight(rs.getFloat("weight"));
                Float grade = (Float) rs.getObject("grade");
                m.setGrade(grade);
                a.setCategory(c);
                m.setGradeItem(a);
                s.setId(rs.getString("id"));
                a1.setFullname(rs.getString("fullname"));
                s.setAccount(a1);
                m.setStudent(s);
                marks.add(m);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return marks;
    }

    public int getGradeItemByItemAndGroup(int gid, String name){
        int id = 0;
        try {
            String sql = "select gi.id from swp391.group g inner join grade_category gc on gc.course_id = g.course_id \n" +
                    "inner join grade_item gi on gi.grade_categoryid = gc.id\n" +
                    "where g.id = ? and gi.name = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setString(2, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }

    public boolean checkMarkExist(String sid, int itemid, int groupid){
        boolean check = false;
        try {
            String sql = "select * from mark where student_id = ? and grade_item_id = ? and group_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, itemid);
            stm.setInt(3, groupid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                check = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;
    }

    public void insertMark(String sid, Float grade, int itemId, int gid){
        try {
            String sql = "insert into mark(student_id, grade, grade_item_id, group_id) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setFloat(2, grade);
            stm.setInt(3, itemId);
            stm.setInt(4, gid);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateMark(String sid, Float grade, int itemId, int gid){
        try {
            String sql = "update mark set grade = ? where student_id = ? and grade_item_id = ? and group_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, grade);
            stm.setString(2, sid);
            stm.setInt(3, itemId);
            stm.setInt(4, gid);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Mark> list() {
        return null;
    }

    @Override
    public void insert(Mark entity) {

    }

    @Override
    public void update(Mark entity) {

    }

    @Override
    public void delete(Mark entity) {

    }

    @Override
    public Mark get(int id) throws SQLException {
        return null;
    }
}
