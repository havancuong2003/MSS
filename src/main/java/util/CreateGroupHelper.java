package util;

import dal.CourseDBContext;
import dal.GroupDBContext;
import dal.SemesterDBContext;
import model.Course;
import model.Semester;
import model.Student;

import java.sql.SQLException;
import java.util.ArrayList;

public class CreateGroupHelper {
    private static int currentSemester = GetCurrentTerm.currentSemester;
//    private static int totalStudentPerGroup = 3;

    public static void main(String[] args) throws SQLException {
        GroupDBContext gdbc = new GroupDBContext();
      //  allocateClasses();
       // gdbc.setCreateGroupInSemester(1);
    }

    public static void allocateClasses(int totalStudentPerGroup) throws SQLException {
        CourseDBContext cdb = new CourseDBContext();
        ArrayList<Course> courses = cdb.getCourseList();
        int semesterIDCurrent = currentSemester;
        GroupDBContext gdbc = new GroupDBContext();
        SemesterDBContext sdbc = new SemesterDBContext();
        Semester currentSemester = sdbc.get(semesterIDCurrent);
        for (Course course : courses) {
            allocateClassesForCourse(course, totalStudentPerGroup,currentSemester.getNextSemesterID());
        }

        gdbc.setCreateGroupInSemester(currentSemester.getNextSemesterID());
    }


    private static void allocateClassesForCourse(Course course,int totalStudentPerGroup, int nextSemester) throws SQLException {
        GroupDBContext gdbc = new GroupDBContext();

        // get list student register course
        ArrayList<Student> students = gdbc.getStudentRegister(course.getId(), nextSemester);

        // Total of student
        int totalStudents = students.size();

        //calculate total class need to create
        int totalClasses = calculateClass(totalStudents, totalStudentPerGroup);

        // current index of student
        int currentIndex = 0;


        for (int i = 0; i < totalClasses; i++) {
            ArrayList<Student> classStudents = new ArrayList<>();
            // create group and return this id
            int classID = gdbc.getIDAfterCreateGroup(course.getId(), nextSemester);

            for (int j = 0; j < totalStudentPerGroup && currentIndex < totalStudents; j++) {
// add student into group
                gdbc.createEnrollGroup(classID, students.get(currentIndex).getId());
                classStudents.add(students.get(currentIndex));
                currentIndex++;
            }

        }
    }


    private static int calculateClass(int totalStudents, int totalStudentPerGroup) {
        return (int) Math.ceil(totalStudents * 1.0 / totalStudentPerGroup);
    }
}
