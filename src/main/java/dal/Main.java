package dal;


import model.Course;
import model.Teacher;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
     GroupDBContext g = new GroupDBContext();
//      g.deleteEnrollment(1);
//      g.deleteGroup(1);
//      g.setIsCreateIsFalse(1);
        Teacher t = g.getTeacherByID("teacher1");
        System.out.println(t.getId());

    }


}


