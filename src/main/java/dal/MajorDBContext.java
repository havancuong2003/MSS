package dal;

import model.Major;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MajorDBContext extends DBContext<Major> {
    public ArrayList<Major> listAllMajor(){
        ArrayList<Major> majors = new ArrayList<>();
        try {
            String sql = "select id,code,detail from major";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Major major = new Major();
                major.setId(rs.getInt("id"));
                major.setCode(rs.getString("code"));
                major.setDetail(rs.getString("detail"));
                majors.add(major);
            }
        } catch (SQLException e) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return majors;
    }



    @Override
    public ArrayList<Major> list() {
        return null;
    }

    @Override
    public void insert(Major entity) {

    }

    @Override
    public void update(Major entity) {

    }

    @Override
    public void delete(Major entity) {

    }

    @Override
    public Major get(int id) throws SQLException {
        return null;
    }
}
