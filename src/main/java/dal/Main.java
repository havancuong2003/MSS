package dal;


import model.Course;
import model.Session;
import model.Teacher;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        SessionDBContext sdb = new SessionDBContext();
        System.out.println(sdb.getSessionForTeacher("t1",java.sql.Date.valueOf("2024-06-10"),java.sql.Date.valueOf("2024-06-16")).get(0).getSlot().getId());
    }


}


