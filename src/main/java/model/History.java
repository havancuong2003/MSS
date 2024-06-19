package model;

import java.util.Date;

public class History {
    private int id;
    private int score;
    private Date date_submit;
    private String time_interval;
    private Student student;
    private int exercise_id;
    private int grape_item_id;

    public History() {
    }

    public History(int id, int score, Date date_submit, String time_interval, Student student, int exercise_id, int grape_item_id) {
        this.id = id;
        this.score = score;
        this.date_submit = date_submit;
        this.time_interval = time_interval;
        this.student = student;
        this.exercise_id = exercise_id;
        this.grape_item_id = grape_item_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getDate_submit() {
        return date_submit;
    }

    public void setDate_submit(Date date_submit) {
        this.date_submit = date_submit;
    }

    public String getTime_interval() {
        return time_interval;
    }

    public void setTime_interval(String time_interval) {
        this.time_interval = time_interval;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getExercise_id() {
        return exercise_id;
    }

    public void setExercise_id(int exercise_id) {
        this.exercise_id = exercise_id;
    }

    public int getGrape_item_id() {
        return grape_item_id;
    }

    public void setGrape_item_id(int grape_item_id) {
        this.grape_item_id = grape_item_id;
    }
}
