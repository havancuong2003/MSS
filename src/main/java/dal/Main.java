package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {

       GroupDBContext gdb = new GroupDBContext();
        System.out.println(gdb.lockedGroup(1));
        }
     }







