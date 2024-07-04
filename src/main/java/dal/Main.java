package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        AccountDBContext adb = new AccountDBContext();
        System.out.println(adb.getIdBySearchGradeInput("s").getId());
     }



}



