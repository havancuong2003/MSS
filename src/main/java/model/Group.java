package model;

import java.util.ArrayList;

public class Group implements IEntity{
    private int id;
    private String name;
    private String link;
    private Semester semester;
    private Course course;
    private Teacher teacher;
    private ArrayList<Student> students;
    private boolean lock;
    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }



    public Group(int id, String name, String link, Semester semester, Course course, Teacher teacher, ArrayList<Student> students) {
        this.id = id;
        this.name = name;
        this.link = link;
        this.semester = semester;
        this.course = course;
        this.teacher = teacher;
        this.students = students;
    }

    public Group() {
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public boolean isLock() {
        return lock;
    }

    public void setLock(boolean lock) {
        this.lock = lock;
    }
}
