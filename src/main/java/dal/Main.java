package dal;


import model.Course;
import model.Teacher;
import model.Term;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
       CurriculumDBContext cdb = new CurriculumDBContext();
        CurriculumDBContext c = new CurriculumDBContext();
        for (Term term : c.getTermForCurriculum(1)) {
            System.out.println("Term ID: " + term.getId());
            System.out.println("Term Detail: " + term.getTermDetail());
            System.out.println("Number of Courses: " + term.getCourses().size());
            System.out.println("Courses:");
            for (Course course : term.getCourses()) {
                System.out.println(" - Course ID: " + course.getId());
            }
            System.out.println("------------------------");
        }
     GroupDBContext g = new GroupDBContext();
//      g.deleteEnrollment(1);
//      g.deleteGroup(1);
//      g.setIsCreateIsFalse(1);
        Teacher t = g.getTeacherByID("teacher1");
        System.out.println(t.getId());

    }


}


