package dal;

import model.Total;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class TotalDBContext extends DBContext<Total> {

    public Total getTotalBySidAndGid(String sid, int gid) {
        try {
            String sql = "select * from total where student_id = ? and group_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Total t = new Total();
                t.setId(rs.getInt("id"));
                t.setAvarage_mark(rs.getFloat("average_mark"));
                t.setPass(rs.getBoolean("isPass"));
                t.setReason(rs.getString("reason"));
                return t;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public int count(int gid) {
        try {
            String sql = "select count(*) as count from `course` g inner join `group` c on c.course_id = g.id inner join grade_category gc on gc.course_id = g.id inner join grade_item gi on gi.grade_categoryid = gc.id\n" +
                    "where c.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public void insertTotal(String sid, int gid, float avarage, boolean pass, String reason) {
        String sql = "insert into total(student_id, group_id, average_mark, isPass, reason) values(?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, gid);
            //set avarage mark is a float with 2 number behind the dot
            stm.setFloat(3, avarage);
            stm.setBoolean(4, pass);
            stm.setString(5, reason);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTotal(int totalId, float avarage_mark, boolean isPass, String reason) {
        String sql = "update total set average_mark = ?, isPass = ?, reason = ? where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, avarage_mark);
            stm.setBoolean(2, isPass);
            stm.setString(3, reason);
            stm.setInt(4, totalId);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Total> list() {
        return null;
    }

    @Override
    public void insert(Total entity) {

    }

    @Override
    public void update(Total entity) {

    }

    @Override
    public void delete(Total entity) {

    }

    @Override
    public Total get(int id) throws SQLException {
        return null;
    }
}
