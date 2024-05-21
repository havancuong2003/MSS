package dal;
import java.sql.*;
import model.Account;
import model.IEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDBContext extends DBContext<Account> {
    @Override
    public ArrayList<Account> list() {
        return null;
    }

    @Override
    public void insert(Account entity) {

    }

    @Override
    public void update(Account entity) {

    }

    @Override
    public void delete(Account entity) {

    }

    @Override
    public Account get(int id) throws SQLException {
        return null;
    }


    public Account getAccount(String username,String password) throws SQLException {
        Account a = null;
        try {
            String sql = "select account_id,username,password,fullname,phone,email,date_of_birth,address,photo,gender from Account where username = ? and password  =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullname(rs.getString("fullname"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setDob(rs.getDate("date_of_birth"));
                a.setAddress(rs.getString("address"));
                a.setAvatar(rs.getString("photo"));
                a.setGender(rs.getBoolean("gender"));
            }
            return a;
        }
        catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    public void changePassword(String email, String password) {

        String query = "UPDATE account SET password = ? WHERE email = ?;";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public ArrayList<String> getEmail(){
        String sql = "Select email from account";
        ArrayList<String> result = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
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
}
