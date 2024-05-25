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


    public Account getAccount(String username, String password) throws SQLException {
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
                a.setAvatar(rs.getBlob("photo"));
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

    public ArrayList<String> getEmail() {
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

    //    LinhNTD 5/22/2024
    public void insertAccount(String username, String password, String fullname, String phone, String email, int role_id, int gender) {
        String query = "INSERT INTO `account` (`username`, `password`, `fullname`, `phone`, `email`, `role_id`, `gender`) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setString(4, phone);
            statement.setString(5, email);
            statement.setInt(6, role_id);
            statement.setInt(7, gender);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT username, password, fullname, phone, email, gender, role_id FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullname(rs.getString("fullname"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setGender(rs.getBoolean("gender"));
                a.setRole_id(rs.getInt("role_id"));
                accounts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public boolean isUsernameExists(String username) {
        String query = "SELECT COUNT(*) FROM account WHERE username = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM account WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneExists(String phonenumber) {
        String query = "SELECT COUNT(*) FROM account WHERE phone = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, phonenumber);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
