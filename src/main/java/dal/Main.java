package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        SemesterDBContext sdb = new SemesterDBContext();
        System.out.println(sdb.getSemesterForTeacher("t1").size());
     }



}



