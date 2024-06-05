package dal;

import model.Account;
import model.Course;
import model.Student;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        CourseDBContext cdb = new CourseDBContext();
        System.out.println(cdb.searchByCode("p").get(0).getCode());
    }


}
