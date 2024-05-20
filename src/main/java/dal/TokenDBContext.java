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

    public void saveToken(int accid, String token, long expirationTime) throws SQLException {
        String query = "INSERT INTO password_reset_tokens (accid, token, expiration_time) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, accid);
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

    public String getToken(String username) {
        String query = " SELECT token FROM password_reset_tokens WHERE accid =\n" +
                "       (SELECT account_id FROM account WHERE username =?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
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
}

