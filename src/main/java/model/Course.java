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
    private boolean isChecked;

    public boolean isChecked() {
        return isChecked;
    }

    public void setChecked(boolean checked) {
        isChecked = checked;
    }

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
    private ArrayList<Course> prerequisiteCourses;
    private String descriptionPrerequisiteCourses;

    public Course(int id, String code, String detail, boolean status, String description, ArrayList<Course> prerequisiteCourses,String descriptionPrerequisiteCourses) {
        this.id = id;
        this.code = code;
        this.detail = detail;
        this.status = status;
        this.description = description;
        this.prerequisiteCourses = prerequisiteCourses;
        this.descriptionPrerequisiteCourses = descriptionPrerequisiteCourses;
    }

    public Course() {
    }

    public String getDescriptionPrerequisiteCourses() {
        return descriptionPrerequisiteCourses;
    }

    public void setDescriptionPrerequisiteCourses(String descriptionPrerequisiteCourses) {
        this.descriptionPrerequisiteCourses = descriptionPrerequisiteCourses;
    }



    public ArrayList<Course> getPrerequisiteCourses() {
        return prerequisiteCourses;
    }

    public void setPrerequisiteCourses(ArrayList<Course> prerequisiteCourses) {
        this.prerequisiteCourses = prerequisiteCourses;
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
