package model;

public class Total  implements IEntity{
    private int id ;
    private Student student;
    private Group group;
    private float avarage_mark ;
    private boolean pass;

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

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public float getAvarage_mark() {
        return avarage_mark;
    }

    public void setAvarage_mark(float avarage_mark) {
        this.avarage_mark = avarage_mark;
    }

    public boolean isPass() {
        return pass;
    }

    public void setPass(boolean pass) {
        this.pass = pass;
    }
}
