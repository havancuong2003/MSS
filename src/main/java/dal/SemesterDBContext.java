package dal;

import model.Response;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SemesterDBContext extends DBContext<Response>{
    public void insertSemester(String detail, Date start, Date startBL5, Date end, int isCreate ) {
        String sql = "INSERT INTO semester(detail, start, startBL5, end, isCreate) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, detail);
            statement.setDate(2, start);
            statement.setDate(3, startBL5);
            statement.setDate(4, end);
            statement.setInt(5, isCreate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        SemesterDBContext context = new SemesterDBContext();
//        context.insertSemester("hello", "2024-07-31", "2024-07-31", "2024-07-31", 1);
//    }

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
