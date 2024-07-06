package model;

public class Mark implements IEntity{
    private int id;
    private Student student;
    private Assessment gradeItem;
    private Float grade;
    private Semester semester;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Assessment getGradeItem() {
        return gradeItem;
    }

    public void setGradeItem(Assessment gradeItem) {
        this.gradeItem = gradeItem;
    }

    public Float getGrade() {
        return grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }
}
