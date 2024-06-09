package util;

import dal.CourseDBContext;
import dal.GroupDBContext;
import model.Course;
import model.Student;

import java.sql.SQLException;
import java.util.ArrayList;

public class CreateGroupHelper {
    private static String currentTerm = GetCurrentTerm.currentTerm;
    private static int totalStudentPerGroup = 3;

    public static void main(String[] args) throws SQLException {
        allocateClasses();
    }

    public static void allocateClasses() throws SQLException {
        CourseDBContext cdb = new CourseDBContext();
        ArrayList<Course> courses = cdb.getCourseList();

        for (Course course : courses) {
            allocateClassesForCourse(course);
        }
    }


    private static void allocateClassesForCourse(Course course) throws SQLException {
        GroupDBContext gdbc = new GroupDBContext();

        // get list student register course
        ArrayList<Student> students = gdbc.getStudentRegister(course.getId(), currentTerm);

        // Total of student
        int totalStudents = students.size();

        //calculate total class need to create
        int totalClasses = calculateClass(totalStudents);

        // current index of student
        int currentIndex = 0;


        for (int i = 0; i < totalClasses; i++) {
            ArrayList<Student> classStudents = new ArrayList<>();
            // create group and return this id
            int classID = gdbc.getIDAfterCreateGroup(course.getId(), 1);

            for (int j = 0; j < totalStudentPerGroup && currentIndex < totalStudents; j++) {
// add student into group
                gdbc.createEnrollGroup(classID, students.get(currentIndex).getId());
                classStudents.add(students.get(currentIndex));
                currentIndex++;
            }

        }
    }


    private static int calculateClass(int totalStudents) {
        return (int) Math.ceil(totalStudents * 1.0 / totalStudentPerGroup);
    }
}
