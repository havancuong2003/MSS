package model;


import java.sql.Date;
import java.util.ArrayList;

public class Exercise implements IEntity {
    private int exerciseId;
    private String exerciseName;
    private Date timeStart;
    private Date timeEnd;
    private int status;
    private int question_number;
    private float exercise_time;
    private int get_score;
    private int group_id;
    private int grade_category;
    private Teacher teacher;
    private Course course;

    public ArrayList<History> getHistories() {
        return histories;
    }

    public void setHistories(ArrayList<History> histories) {
        this.histories = histories;
    }

    private ArrayList<History> histories;

    public Exercise() {
    }

    public int getQuestion_number() {
        return question_number;
    }

    public void setQuestion_number(int question_number) {
        this.question_number = question_number;
    }

    public float getExercise_time() {
        return exercise_time;
    }

    public void setExercise_time(float exercise_time) {
        this.exercise_time = exercise_time;
    }

    public int getGet_score() {
        return get_score;
    }

    public void setGet_score(int get_score) {
        this.get_score = get_score;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public int getGrade_category() {
        return grade_category;
    }

    public void setGrade_category(int grade_category) {
        this.grade_category = grade_category;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public Date getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Date timeStart) {
        this.timeStart = timeStart;
    }

    public Date getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Date timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}
