package dal;

import com.mysql.cj.jdbc.Blob;
import model.Account;
import model.Teacher;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProfileDBContext extends DBContext<Account> {

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

    public Account getAccountByID(String account_id) {

        try {
            String sql = "select * from account where account_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, account_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(4));
                a.setPhone(rs.getString(5));
                a.setEmail(rs.getString(6));
                a.setDob(rs.getDate(7));
                a.setAddress(rs.getString(8));
                a.setRole_id(rs.getInt(9));
                a.setAvatar((Blob) rs.getBlob(10));
                a.setGender(rs.getBoolean(11));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByUserName(String username) {
        try {
            String sql = "select * from account where username like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(4));
                a.setPhone(rs.getString(5));
                a.setEmail(rs.getString(6));
                a.setDob(rs.getDate(7));
                a.setAddress(rs.getString(8));
                a.setRole_id(rs.getInt(9));
                a.setAvatar((Blob) rs.getBlob(10));
                a.setGender(rs.getBoolean(11));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Account getAccountByUserPhone(String phone) {
        try {
            String sql = "select * from account where phone = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, phone);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(4));
                a.setPhone(rs.getString(5));
                a.setEmail(rs.getString(6));
                a.setDob(rs.getDate(7));
                a.setAddress(rs.getString(8));
                a.setRole_id(rs.getInt(9));
                a.setAvatar((Blob) rs.getBlob(10));
                a.setGender(rs.getBoolean(11));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editUserName(String username, String account_id,String phone) {

        String sql = "UPDATE account " +
                "SET username = ?, phone = ? " +
                "WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, phone);
            st.setString(3, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editPhoneNumber(String phone, String account_id) {

        String sql = "UPDATE account " +
                "SET phone = ? " +
                "WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editEmail(String email, String account_id) {

        String sql = "UPDATE account " +
                "SET email = ? " +
                "WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editPassword(String password, String account_id) {

        String sql = "UPDATE account " +
                "SET password = ? " +
                "WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void insertPhoto(InputStream photo, String account_id) {
        String sql = "UPDATE account " +
                "SET photo = ? " +
                "WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (photo != null) {
                st.setBinaryStream(1, photo);
            }
            st.setString(2, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public InputStream getPhoto(String account_id) {
        InputStream inputStream = null;
        try {
            String sql = "SELECT photo FROM account WHERE account_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, account_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Blob blob = (Blob) rs.getBlob("photo");
                if (blob != null) {
                    inputStream = blob.getBinaryStream();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inputStream;

    }

    public Teacher getTeacherIdByAccountId(String account_id) {

        try {
            String sql = "select * from teacher where acc_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, account_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
               Teacher t = new Teacher();
               t.setTid(rs.getString(1));
               Account a = new Account();
               a.setId(rs.getInt(2));
               t.setAccount(a);
               return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<Account> getListAccount() {
        List<Account> listA = new ArrayList<>();
        try {
            String sql = "select * from account";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(4));
                a.setPhone(rs.getString(5));
                a.setEmail(rs.getString(6));
                a.setDob(rs.getDate(7));
                a.setAddress(rs.getString(8));
                a.setRole_id(rs.getInt(9));
                a.setAvatar((Blob) rs.getBlob(10));
                a.setGender(rs.getBoolean(11));
                listA.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listA;
    }
    public static void main(String[] args) {
        ProfileDBContext dao = new ProfileDBContext();
        Account a = dao.getAccountByUserPhone("0335545681");
        List<Account> list = dao.getListAccount();
        for (Account a1 : list) {
            System.out.println(a1.getId());
        }
//        System.out.println(a.getFullname());
    }


}
