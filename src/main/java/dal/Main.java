package dal;


import model.Course;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        CurriculumDBContext c = new CurriculumDBContext();
        ArrayList<Course> courseForCurriculum = c.getCourseForCurriculum(4, 1);
        for (Course course : courseForCurriculum) {
           for (Course prerequisiteCourse : course.getPrerequisiteCourses()) {
               System.out.println(prerequisiteCourse.getCode()+" --- "+course.getCode());
           }
        }

    }


}


