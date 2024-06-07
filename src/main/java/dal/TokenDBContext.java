package dal;

import model.Token;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;

public class TokenDBContext extends DBContext<Token> {
    public TokenDBContext() {
        super();
    }

    @Override
    public ArrayList<Token> list() {
        return null;
    }

    @Override
    public void insert(Token entity) {

    }

    @Override
    public void update(Token entity) {

    }

    @Override
    public void delete(Token entity) {

    }

    @Override
    public Token get(int id) throws SQLException {
        return null;
    }

    public void saveToken(String email , String token, long expirationTime) throws SQLException {
        String query = "INSERT INTO password_reset_tokens (email, token, expiration_time) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, token);
            statement.setLong(3, expirationTime);
            statement.executeUpdate();
        }
    }

    public void cleanupExpiredTokens(long currentTime) throws SQLException {
        String query = "DELETE FROM password_reset_tokens WHERE expiration_time < ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, currentTime);
            statement.executeUpdate();
        }
    }

    public String getToken(String email) {
        String query = "SELECT token FROM password_reset_tokens where email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("token");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String> getEmailExistToken(){
        String query ="SELECT email FROM password_reset_tokens";
        ArrayList<String> result = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    result.add(resultSet.getString("email"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;

    }
    public long getExpirationTimeForEmail(String email){
        long expirationTime = 0;
        String sql ="select expiration_time from password_reset_tokens  WHERE (email = ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getLong("expiration_time");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expirationTime;
    }
}

