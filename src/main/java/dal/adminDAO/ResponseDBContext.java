package dal.adminDAO;

import dal.DBContext;
import model.Response;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ResponseDBContext extends DBContext<Response> {
    public void insertResponse(String response, String application_id) {
        String sql = "INSERT INTO response (response, application_id) VALUES (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, response);
            statement.setString(2, application_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Response getResponseByApplicationId(String application_id) {
        String sql = "SELECT * FROM response WHERE application_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, application_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Response response = new Response();
                response.setResponse_id(rs.getInt(1));
                response.setResponse(rs.getString(2));
                response.setApplication_id(rs.getInt(3));
                return response;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
