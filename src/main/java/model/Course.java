package model;

import java.util.ArrayList;

public class Course implements IEntity{
    private int id;
    private String code ;
    private String detail;
    private boolean status;
    private String description;
    private int credit;
    private ArrayList<Integer> preCourseID;
    private String preCoursesString;

    public String getPreCoursesString() {
        return preCoursesString;
    }

    public void setPreCoursesString(String preCoursesString) {
        this.preCoursesString = preCoursesString;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }



    public ArrayList<Integer> getPreCourseID() {
        return preCourseID;
    }

    public void setPreCourseID(ArrayList<Integer> preCourseID) {
        this.preCourseID = preCourseID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
