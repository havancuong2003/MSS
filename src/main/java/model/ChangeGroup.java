package model;

public class ChangeGroup implements IEntity{
    private int id;
    private Student fromStudent;
    private Student toStudent;
    private Group fromGroup;
    private Group toGroup;
    private String status;
    private Semester semester;

    public ChangeGroup() {
    }

    public ChangeGroup(int id, Student fromStudent, Student toStudent, Group fromGroup, Group toGroup, String status,Semester semester) {
        this.id = id;
        this.fromStudent = fromStudent;
        this.toStudent = toStudent;
        this.fromGroup = fromGroup;
        this.toGroup = toGroup;
        this.status = status;
        this.semester = semester;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getFromStudent() {
        return fromStudent;
    }

    public void setFromStudent(Student fromStudent) {
        this.fromStudent = fromStudent;
    }

    public Student getToStudent() {
        return toStudent;
    }

    public void setToStudent(Student toStudent) {
        this.toStudent = toStudent;
    }

    public Group getFromGroup() {
        return fromGroup;
    }

    public void setFromGroup(Group fromGroup) {
        this.fromGroup = fromGroup;
    }

    public Group getToGroup() {
        return toGroup;
    }

    public void setToGroup(Group toGroup) {
        this.toGroup = toGroup;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }
}
