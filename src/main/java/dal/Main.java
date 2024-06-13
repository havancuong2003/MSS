package dal;


import model.Course;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
       StudentDBContext s = new StudentDBContext();
        ArrayList<Course> allCourseRegisterForStudent = s.getCoursesRegistered("student1",1);
        for (Course course : allCourseRegisterForStudent) {
            System.out.println(course.getCode());
        }

    }


}


