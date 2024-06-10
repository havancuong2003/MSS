package dal;

import com.mysql.cj.jdbc.Blob;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ApplicationDBContext extends DBContext<Application> {
    public List<Application_category> getApplicationCategory() {
        ArrayList<Application_category> listApplicationCategory = new ArrayList<>();
        try {
            String sql = "select * from application_category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application_category p = new Application_category();
                p.setCategory_id(rs.getInt(1));
                p.setDescription(rs.getString(2));
                listApplicationCategory.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listApplicationCategory;
    }
    public List<Application_status> getApplicationStatusCategory() {
        ArrayList<Application_status> listApplicationStatusCategory = new ArrayList<>();
        try {
            String sql = "select * from status_category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application_status p = new Application_status();
                p.setStatus_id(rs.getInt(1));
                p.setDescription(rs.getString(2));
                listApplicationStatusCategory.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listApplicationStatusCategory;
    }

    public void insertApplication(String reason, String student_id, String category_id) {
        String sql = "INSERT INTO application (reason, student_id, category_id,status_id) VALUES (?, ?, ?,1)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, reason);
            statement.setString(2, student_id);
            statement.setString(3, category_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //    public List<Application> getApplication() {
//        ArrayList<Application> listApplication = new ArrayList<>();
//        try {
//            String sql = "SELECT * " +
//                    "FROM application a " +
//                    "JOIN application_category ac ON a.category_id = ac.category_id " +
//                    "JOIN student s ON a.student_id = s.student_id " +
//                    "JOIN account acc ON s.account_id = acc.account_id";
//
//            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                Application a = new Application();
//                a.setApplication_id(rs.getInt("application_id"));
//                a.setReason(rs.getString("reason"));
//                a.setStatus(rs.getInt("status"));
//                Application_category ac = new Application_category();
//                ac.setCategory_id(rs.getInt("category_id"));
//                ac.setDescription(rs.getString("description"));
//                a.setApplicationCategory(ac);
//                Student s = new Student();
//                s.setStudent_id(rs.getInt("student_id"));
//                account acc = new account();
//                acc.setAccount_id(rs.getInt("account_id"));
//                acc.setUsername(rs.getString("username"));
//                acc.setPassword(rs.getString("password"));
//                acc.setFullname(rs.getString("fullname"));
//                acc.setPhone(rs.getString("phone"));
//                acc.setEmail(rs.getString("email"));
//                acc.setDate_of_birth(rs.getDate("date_of_birth"));
//                acc.setAddress(rs.getString("address"));
//                acc.setPhoto((Blob) rs.getBlob("photo"));
//                acc.setGender(rs.getString("gender"));
//                s.setAccount(acc);
//                a.setStudent(s);
//                listApplication.add(a);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return listApplication;
//    }
    public Application getApplicationById(String appication_id) {
        try {
            String sql = "SELECT * " +
                    "FROM application a " +
                    "JOIN application_category ac ON a.category_id = ac.category_id " +
                    "JOIN student s ON a.student_id = s.id " +
                    "JOIN account acc ON s.acc_id = acc.account_id " +
                    "JOIN status_category sc ON a.status_id = sc.status_id " +
                    "WHERE a.application_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, appication_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


    public int getTotalApplication() {
        try {
            String sql = "SELECT COUNT(*) FROM application";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Application> pagingApplication (int index) {
        List<Application> listApplication = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM application a " +
                "JOIN application_category ac ON a.category_id = ac.category_id " +
                "JOIN student s ON a.student_id = s.id " +
                "JOIN account acc ON s.acc_id = acc.account_id " +
                "JOIN status_category sc ON a.status_id = sc.status_id " +
                "ORDER BY CASE WHEN a.status_id = 1 THEN 0 ELSE 1 END , a.application_id DESC " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                listApplication.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listApplication;
    }

    public int getTotalApplicationByUserName(String username){
        try {
            String sql = "SELECT COUNT(*) " +
                    "FROM application a " +
                    "JOIN application_category ac ON a.category_id = ac.category_id " +
                    "JOIN student s ON a.student_id = s.id " +
                    "JOIN account acc ON s.acc_id = acc.account_id " +
                    "WHERE acc.username LIKE ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + username + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Application> pagingApplicationByUserName (int index,String username) {
        List<Application> listApplication = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM application a " +
                "JOIN application_category ac ON a.category_id = ac.category_id " +
                "JOIN student s ON a.student_id = s.id " +
                "JOIN account acc ON s.acc_id = acc.account_id " +
                "JOIN status_category sc ON a.status_id = sc.status_id " +
                "WHERE acc.username LIKE ? " +
                "ORDER BY CASE WHEN a.status_id = 1 THEN 0 ELSE 1 END , a.application_id DESC " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + username + "%");
            statement.setInt(2, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                listApplication.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listApplication;
    }

    public int getTotalApplicationByCategory(String category_id){
        try {
            String sql = "SELECT COUNT(*) " +
                    "FROM application a " +
                    "JOIN application_category ac ON a.category_id = ac.category_id " +
                    "JOIN student s ON a.student_id = s.id " +
                    "JOIN account acc ON s.acc_id = acc.account_id " +
                    "WHERE a.category_id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Application> pagingApplicationByCategory (int index,String category_id) {
        List<Application> listApplication = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM application a " +
                "JOIN application_category ac ON a.category_id = ac.category_id " +
                "JOIN student s ON a.student_id = s.id " +
                "JOIN account acc ON s.acc_id = acc.account_id " +
                "JOIN status_category sc ON a.status_id = sc.status_id " +
                "WHERE a.category_id = ? " +
                "ORDER BY a.application_id " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category_id);
            statement.setInt(2, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                listApplication.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listApplication;
    }

    public int getTotalApplicationByStatus(String status_id){
        try {
            String sql = "SELECT COUNT(*) " +
                    "FROM application a " +
                    "JOIN application_category ac ON a.category_id = ac.category_id " +
                    "JOIN student s ON a.student_id = s.id " +
                    "JOIN account acc ON s.acc_id = acc.account_id " +
                    "JOIN status_category sc ON a.status_id = sc.status_id " +
                    "WHERE a.status_id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Application> pagingApplicationByStatus (int index,String status) {
        List<Application> listApplication = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM application a " +
                "JOIN application_category ac ON a.category_id = ac.category_id " +
                "JOIN student s ON a.student_id = s.id " +
                "JOIN account acc ON s.acc_id = acc.account_id " +
                "JOIN status_category sc ON a.status_id = sc.status_id " +
                "WHERE a.status_id = ? " +
                "ORDER BY a.application_id " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                listApplication.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listApplication;
    }

    public int getTotalApplicationByStatusAndCategory(String status_id, String category_id){
        try {
            String sql = "SELECT COUNT(*) " +
                    "FROM application a " +
                    "JOIN application_category ac ON a.category_id = ac.category_id " +
                    "JOIN student s ON a.student_id = s.id " +
                    "JOIN account acc ON s.acc_id = acc.account_id " +
                    "JOIN status_category sc ON a.status_id = sc.status_id " +
                    "WHERE a.status_id = ? AND a.category_id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status_id);
            statement.setString(2, category_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Application> pagingApplicationByStatusAndCategory (int index,String status,String category_id) {
        List<Application> listApplication = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM application a " +
                "JOIN application_category ac ON a.category_id = ac.category_id " +
                "JOIN student s ON a.student_id = s.id " +
                "JOIN account acc ON s.acc_id = acc.account_id " +
                "JOIN status_category sc ON a.status_id = sc.status_id " +
                "WHERE a.status_id = ? AND a.category_id = ? " +
                "ORDER BY a.application_id " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2,category_id);
            statement.setInt(3, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Application a = new Application();
                a.setApplication_id(rs.getInt("application_id"));
                a.setReason(rs.getString("reason"));
                Application_status as = new Application_status();
                as.setStatus_id(rs.getInt("status_id"));
                as.setDescription(rs.getString("status_description"));
                a.setApplicationStatus(as);
                Application_category ac = new Application_category();
                ac.setCategory_id(rs.getInt("category_id"));
                ac.setDescription(rs.getString("description"));
                a.setApplicationCategory(ac);
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                s.setAccount(acc);
                a.setStudent(s);
                listApplication.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listApplication;
    }

    public void editApplicationStatus(String application_id) {

        String sql = "UPDATE application " +
                "SET status_id = 2 " +
                "WHERE application_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, application_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editApplicationReject(String application_id) {

        String sql = "UPDATE application " +
                "SET status_id = 3 " +
                "WHERE application_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, application_id);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
        ApplicationDBContext dao = new ApplicationDBContext();
        List<Application_category> list = dao.getApplicationCategory();
        for (Application_category application_category : list) {
            System.out.println(application_category.getDescription());
        }
    }

    @Override
    public ArrayList<Application> list() {
        return null;
    }

    @Override
    public void insert(Application entity) {

    }

    @Override
    public void update(Application entity) {

    }

    @Override
    public void delete(Application entity) {

    }

    @Override
    public Application get(int id) throws SQLException {
        return null;
    }
}
