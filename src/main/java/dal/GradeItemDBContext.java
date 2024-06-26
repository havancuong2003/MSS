package dal;

import model.Assessment;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GradeItemDBContext extends DBContext<Assessment> {
    public void add(Assessment assessment, int id) {
        try {
            String sql = "insert into grade_item(`name`,`grade_categoryid`,`weight`) values(?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, assessment.getItem());
            stm.setInt(2, id);
            stm.setFloat(3, assessment.getWeight());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(GradeItemDBContext.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public ArrayList<Assessment> getAssessment(int id) {
        ArrayList<Assessment> assessments = new ArrayList<>();
        try {
            String sql = "select a.id,a.name,a.weight from grade_item a inner join grade_category c on a.grade_categoryid = c.id where c.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Assessment ass = new Assessment();
                ass.setId(rs.getInt("id"));
                ass.setItem(rs.getString("name"));
                ass.setWeight(rs.getFloat("weight"));
                assessments.add(ass);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return assessments;
    }

    @Override
    public ArrayList<Assessment> list() {
        return null;
    }

    @Override
    public void insert(Assessment entity) {

    }

    @Override
    public void update(Assessment entity) {

    }

    @Override
    public void delete(Assessment entity) {

    }

    @Override
    public Assessment get(int id) {
        return null;
    }
}
