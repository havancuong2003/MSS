package dal;


import model.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        AttendanceDBContext attdb = new AttendanceDBContext();

        ArrayList<Attendance> attendances = attdb.getAttendancesForTeacher(3);
        attendances.get(2).getSession().updateLockStatus();
        System.out.println(attendances.get(2).getSession().isLock());
     }



}



