package model;

public class PrequisiteCourse implements IEntity{

    private int id;
    private Course course;
    private Course preCourse;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Course getPreCourse() {
        return preCourse;
    }

    public void setPreCourse(Course preCourse) {
        this.preCourse = preCourse;
    }
}
