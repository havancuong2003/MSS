package dal;

import java.sql.*;

import model.Account;
import model.Role;
import model.Student;
import model.Teacher;

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

    public Account getIdBySearchGradeInput(String search){
        Account a = new Account();
        try {
        String sql = "select acc.account_id, acc.role_id from account acc left join student stu on stu.acc_id = acc.account_id \n" +
                "left join teacher t on t.acc_id = acc.account_id inner join role r on r.id = acc.role_id\n" +
                "where acc.fullname like ? or t.id like ? or stu.id like ? limit 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+search+"%");
            stm.setString(2, "%"+search+"%");
            stm.setString(3, "%"+search+"%");
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                a.setId(rs.getInt("account_id"));
                a.setRole_id(rs.getInt("role_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return a;
    }

    public Student getStudentByAccId(int id, int role_id) {
        Student s = new Student();
        Account acc = new Account();
        Role r = new Role();
        try {
        String sql ="select r.description, r.id as roleid, acc.fullname, stu.id from account acc inner join student stu on stu.acc_id = acc.account_id \n" +
                "inner join role r on r.id = acc.role_id\n" +
                "where acc.account_id = ?;";
            PreparedStatement stm  = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                r.setDescription(rs.getString("description"));
                r.setId(rs.getInt("roleid"));
                acc.setFullname(rs.getString("fullname"));
                s.setId(rs.getString("id"));
                acc.setRole(r);
                s.setAccount(acc);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return s;
    }

    public Teacher getTeacherByAccId(int id, int role_id) {
        Teacher t = new Teacher();
        Account acc = new Account();
        Role r = new Role();
        try {
        String sql ="select r.description, r.id as roleid, acc.fullname, t.id from account acc \n" +
                "inner join teacher t on t.acc_id = acc.account_id inner join role r on r.id = acc.role_id\n" +
                "where acc.account_id = ?;";
            PreparedStatement stm  = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                r.setDescription(rs.getString("description"));
                r.setId(rs.getInt("roleid"));
                acc.setFullname(rs.getString("fullname"));
                t.setTid(rs.getString("id"));
                acc.setRole(r);
                t.setAccount(acc);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return t;
    }


    public Account getAccount(String username, String password) throws SQLException {
        Account a = null;
        try {
            String sql = "select account_id,username,password,fullname,phone,email,date_of_birth,address,photo,gender,role_id from Account where username = ? and password  =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
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
                a.setRole_id(rs.getInt("role_id"));
            }
            return a;
        } catch (SQLException ex) {
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
    public int insertAccount(String username, String password, String fullname, String phone, String email, int role_id, int gender) {
        String query = "INSERT INTO `account` (`username`, `password`, `fullname`, `phone`, `email`, `role_id`, `gender`, `status`) VALUES (?, ?, ?, ?, ?, ?, ?, 'active')";
        try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setString(4, phone);
            statement.setString(5, email);
            statement.setInt(6, role_id);
            statement.setInt(7, gender);
//            statement.setString(8, status);

            statement.executeUpdate();

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Assuming accountid is the first column of the generated keys
                } else {
                    throw new SQLException("Creating account failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Indicate an error occurred
        }
    }

    public String insertStudent(int acc_id, int current_term, int major_id) {
        String query = "INSERT INTO `student` (acc_id`, `current_term`, `major_id`) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, acc_id);
            statement.setInt(2, current_term);
            statement.setInt(3, major_id);

            statement.executeUpdate();

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getString(1); // Assuming `id` is the first column of the generated keys
                } else {
                    throw new SQLException("Creating student failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Indicate an error occurred
        }
    }


    public void updateAccountStatus(int accountId, String status) {
        String query = "UPDATE `account` SET `status` = ? WHERE `account_id` = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setInt(2, accountId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT account_id, username, password, fullname, phone, email, gender, role_id, status FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullname(rs.getString("fullname"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setGender(rs.getBoolean("gender"));
                a.setRole_id(rs.getInt("role_id"));
                a.setStatus(rs.getString("status"));
                accounts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public ArrayList<Account> getAllAccountByName(String searchName) {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT account_id, username, password, fullname, phone, email, gender, role_id, status FROM Account Where username like '%"+ searchName +"%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("account_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFullname(rs.getString("fullname"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setGender(rs.getBoolean("gender"));
                a.setRole_id(rs.getInt("role_id"));
                a.setStatus(rs.getString("status"));
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

    public String getRoleByRoleID(int role_id) {
        String query = "SELECT description FROM role WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, role_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("description");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getIdUserByAccountId(int id) {
        try {
            String sql = "SELECT COALESCE(s.id, t.id) AS role_id\n" +
                    "FROM account a\n" +
                    "LEFT JOIN student s ON a.account_id = s.acc_id\n" +
                    "LEFT JOIN teacher t ON a.account_id = t.acc_id\n" +
                    "WHERE a.account_id = ?;";
            PreparedStatement stm = null;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString("role_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}



