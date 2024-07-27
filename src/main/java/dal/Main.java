package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {

       TotalDBContext tdb = new TotalDBContext();
        System.out.println(tdb.getTotalBySidAndGid("s1",3).getAvarage_mark());
        }
     }







