package model;


import java.util.Date;


public class TimePeriods implements IEntity{
    private int id;
    private Date startChangeClass;
    private Date endChangeClass;
    private Date startRegister;
    private Date endRegister;
    private String status;
    private String description;

    public TimePeriods(int id, Date startChangeClass, Date endChangeClass, Date startRegister, Date endRegister, String status, String description) {
        this.id = id;
        this.startChangeClass = startChangeClass;
        this.endChangeClass = endChangeClass;
        this.startRegister = startRegister;
        this.endRegister = endRegister;
        this.status = status;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
