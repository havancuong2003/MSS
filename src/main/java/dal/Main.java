package dal;


import model.Course;
import model.Session;
import model.Teacher;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        AttendanceDBContext attdb = new AttendanceDBContext();
        System.out.println(attdb.getAttendancesForTeacher(1).get(0).isPresent());
    }


}


