package dal;


import model.*;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {

        TotalDBContext tdb = new TotalDBContext();
        System.out.println(tdb.count(3));
        MarkDBContext mdb = new MarkDBContext();
        System.out.println(mdb.countMarkOfStudent(3, "s2"));
    }
}







