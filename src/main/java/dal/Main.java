package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(1);
        System.out.println(timePeriods);
     }



}



