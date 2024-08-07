package model;


import java.sql.Date;
import java.util.ArrayList;

public class Exercise implements IEntity {
    private int exerciseId;
    private String exerciseName;
    private int status;
    private int basic_question;
    private int low_question;
    private int high_question;
    private float exercise_time;
    private int get_score;
    private int group_id;
    private int grade_category;
    private int isRandom;
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

    public int getBasic_question() {
        return basic_question;
    }

    public void setBasic_question(int basic_question) {
        this.basic_question = basic_question;
    }

    public int getLow_question() {
        return low_question;
    }

    public void setLow_question(int low_question) {
        this.low_question = low_question;
    }

    public int getHigh_question() {
        return high_question;
    }

    public void setHigh_question(int high_question) {
        this.high_question = high_question;
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

    public Exercise(int exerciseId, String exerciseName, int status, int basic_question, int low_question, int high_question, float exercise_time, int get_score, int group_id, int grade_category, int isRandom, Teacher teacher, Course course, ArrayList<History> histories) {
        this.exerciseId = exerciseId;
        this.exerciseName = exerciseName;
        this.status = status;
        this.basic_question = basic_question;
        this.low_question = low_question;
        this.high_question = high_question;
        this.exercise_time = exercise_time;
        this.get_score = get_score;
        this.group_id = group_id;
        this.grade_category = grade_category;
        this.isRandom = isRandom;
        this.teacher = teacher;
        this.course = course;
        this.histories = histories;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public int getIsRandom() {
        return isRandom;
    }

    public void setIsRandom(int isRandom) {
        this.isRandom = isRandom;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}
