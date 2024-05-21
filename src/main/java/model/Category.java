package model;

import java.util.ArrayList;

public class Category implements IEntity{
    private int id;
    private String categoryName;
    private Course course;
    private ArrayList<Assessment> assessments;
    private int count;
    private int fitemID;

    public int getFitemID() {
        return fitemID;
    }

    public void setFitemID(int fitemID) {
        this.fitemID = fitemID;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public ArrayList<Assessment> getAssessments() {
        return assessments;
    }

    public void setAssessments(ArrayList<Assessment> assessments) {
        this.assessments = assessments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}
