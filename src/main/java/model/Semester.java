package model;

import java.util.Date;


public class Semester implements IEntity{
    private int id;
    private String detail;
    private Date start;
    private Date end;
    private int isCreate;

    private int nextSemesterID;
    private int totalCourseRegisterForNextSemester;

    public int getTotalCourseRegisterForNextSemester() {
        return totalCourseRegisterForNextSemester;
    }

    public void setTotalCourseRegisterForNextSemester(int totalCourseRegisterForNextSemester) {
        this.totalCourseRegisterForNextSemester = totalCourseRegisterForNextSemester;
    }

    public int getNextSemesterID() {
        return nextSemesterID;
    }

    public void setNextSemesterID(int nextSemesterID) {
        this.nextSemesterID = nextSemesterID;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }



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

    public Semester(int id, String detail, Date start, Date end, int isCreate, int totalCourseRegisterForNextSemester) {
        this.id = id;
        this.detail = detail;
        this.start = start;
        this.end = end;
        this.isCreate = isCreate;
        this.totalCourseRegisterForNextSemester = totalCourseRegisterForNextSemester;
    }

    public int getIsCreate() {
        return isCreate;
    }

    public void setIsCreate(int isCreate) {
        this.isCreate = isCreate;
        this.start = start;
        this.end = end;
        this.nextSemesterID = nextSemesterID;
        this.totalCourseRegisterForNextSemester = totalCourseRegisterForNextSemester;
    }
}
