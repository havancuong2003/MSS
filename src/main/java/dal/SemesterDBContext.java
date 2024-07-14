package dal;

import model.Answer;
import model.Response;
import model.Semester;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SemesterDBContext extends DBContext<Response>{
    public void insertSemester(String detail, Date start, Date end, int isCreate ) {
        String sql = "INSERT INTO semester(detail, start, end, isCreate) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, detail);
            statement.setDate(2, start);
            statement.setDate(3, end);
            statement.setInt(4, isCreate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkDetailExists(String detail) {
        String sql = "SELECT COUNT(*) FROM semester WHERE detail = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, detail);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count == 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteSemester(int semesterId) {
        String sql = "DELETE FROM semester WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, semesterId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; // returns true if one or more rows were affected
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            return false; // returns false if an exception occurs
        }
    }

    public ArrayList<Semester> getAlSemesterBySearchName(String searchname)  {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select * from semester where detail like '%" + searchname + "%' order by start asc";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester semester = new Semester();
                semester.setDetail(rs.getString(2));
                semester.setId(rs.getInt(1));
                semester.setStart(rs.getDate(3));
                semester.setEnd(rs.getDate(4));
                semester.setIsCreate(rs.getInt(5));
                semesters.add(semester);
            }
            return semesters;
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        SemesterDBContext context = new SemesterDBContext();

        System.out.println(context.getAlSemesterBySearchName("").get(1).getDetail());
    }

    public void updateSemester(Semester semester) {

        try {
            String sql = "UPDATE semester SET detail = ?, start = ?, end = ?, isCreate = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semester.getDetail());
            stm.setDate(2, semester.getStart());
            stm.setDate(3, semester.getEnd());
            stm.setInt(4, semester.getIsCreate());
            stm.setInt(5, semester.getId());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Response> list() {
        return null;
    }

    @Override
    public void insert(Response entity) {

    }

    @Override
    public void update(Response entity) {

    }

    @Override
    public void delete(Response entity) {

    }

    @Override
    public Response get(int id) throws SQLException {
        return null;
    }
}
