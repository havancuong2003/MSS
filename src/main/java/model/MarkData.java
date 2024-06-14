package model;

public class MarkData implements IEntity {
    private int id;
    private String studentId;
    private String gradeCategoryName;
    private float gradeItemWeight;
    private float grade;
    private String courseCode;
    private String gradeItemName;

    public MarkData() {

    }

    public MarkData(int id, String studentId, String gradeCategoryName, float gradeItemWeight, float grade, String courseCode, String gradeItemName) {
        this.id = id;
        this.studentId = studentId;
        this.gradeCategoryName = gradeCategoryName;
        this.gradeItemWeight = gradeItemWeight;
        this.grade = grade;
        this.courseCode = courseCode;
        this.gradeItemName = gradeItemName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getGradeCategoryName() {
        return gradeCategoryName;
    }

    public void setGradeCategoryName(String gradeCategoryName) {
        this.gradeCategoryName = gradeCategoryName;
    }

    public float getGradeItemWeight() {
        return gradeItemWeight;
    }

    public void setGradeItemWeight(float gradeItemWeight) {
        this.gradeItemWeight = gradeItemWeight;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getGradeItemName() {
        return gradeItemName;
    }

    public void setGradeItemName(String gradeItemName) {
        this.gradeItemName = gradeItemName;
    }
}