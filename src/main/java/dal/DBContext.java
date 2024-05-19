package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import io.github.cdimascio.dotenv.Dotenv;
import model.IEntity;

public abstract class DBContext<T extends IEntity> {

    protected Connection connection;

    public DBContext() {
        Dotenv dotenv = Dotenv.load();
        try {
            String user = dotenv.get("DB_USERNAME");
            String pass = dotenv.get("DB_PASSWORD");
            String url = dotenv.get("DB_URL");

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract ArrayList<T> list();

    public abstract void insert(T entity);

    public abstract void update(T entity);

    public abstract void delete(T entity);

    public abstract T get(int id) throws SQLException;
}
