package dal;


import model.Course;
import model.Teacher;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
     StudentDBContext studentDBContext = new StudentDBContext();
     ArrayList<Course> c = studentDBContext.getAllCourseRegisterForStudent(3,1,"student1");
     for (Course course : c) {
         System.out.println(course.getCode());
     }
    }


}


