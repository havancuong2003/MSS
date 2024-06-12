package model;

import java.util.ArrayList;

public class Term implements IEntity {
    private int id;
    private String termDetail;
    private ArrayList<Course> courses;
    private Major major;

    public Term(int id, String termDetail, ArrayList<Course> courses, Major major) {
        this.id = id;
        this.termDetail = termDetail;
        this.courses = courses;
        this.major = major;
    }

    public Term() {
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTermDetail() {
        return termDetail;
    }

    public void setTermDetail(String termDetail) {
        this.termDetail = termDetail;
    }

    public ArrayList<Course> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<Course> courses) {
        this.courses = courses;
    }
}