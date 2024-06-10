package model;


import java.util.Date;


public class TimePeriods implements IEntity {
    private int id;
    private Date startChangeClass;
    private Date endChangeClass;
    private Date startRegister;
    private Date endRegister;
    private String status;
    private Semester semester;

    public TimePeriods(int id, Date startChangeClass, Date endChangeClass, Date startRegister, Date endRegister, String status, Semester semester) {
        this.id = id;
        this.startChangeClass = startChangeClass;
        this.endChangeClass = endChangeClass;
        this.startRegister = startRegister;
        this.endRegister = endRegister;
        this.status = status;
        this.semester = semester;
    }

    public TimePeriods() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartChangeClass() {
        return startChangeClass;
    }

    public void setStartChangeClass(Date startChangeClass) {
        this.startChangeClass = startChangeClass;
    }

    public Date getEndChangeClass() {
        return endChangeClass;
    }

    public void setEndChangeClass(Date endChangeClass) {
        this.endChangeClass = endChangeClass;
    }

    public Date getStartRegister() {
        return startRegister;
    }

    public void setStartRegister(Date startRegister) {
        this.startRegister = startRegister;
    }

    public Date getEndRegister() {
        return endRegister;
    }

    public void setEndRegister(Date endRegister) {
        this.endRegister = endRegister;
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
