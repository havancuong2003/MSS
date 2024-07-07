package model;

import java.sql.Date;

public class Semester implements IEntity{
    private int id;
    private String detail;
    private Date start;
    private Date startBL5;
    private Date end;
    private int isCreate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Semester() {
    }

    public Semester(int id, String detail, Date start, Date startBL5, Date end, int isCreate) {
        this.id = id;
        this.detail = detail;
        this.start = start;
        this.startBL5 = startBL5;
        this.end = end;
        this.isCreate = isCreate;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getStartBL5() {
        return startBL5;
    }

    public void setStartBL5(Date startBL5) {
        this.startBL5 = startBL5;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public int getIsCreate() {
        return isCreate;
    }

    public void setIsCreate(int isCreate) {
        this.isCreate = isCreate;
    }
}
