package model;

public class Question implements IEntity {
    private int question_id;
    private String question;
    private int type_question;
    private Exercise exercise;
    private Course course;
    private int status;
    public Question() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Question(int question_id, String question, int type_question, Exercise exercise, Course course, int status) {
        this.question_id = question_id;
        this.question = question;
        this.type_question = type_question;
        this.exercise = exercise;
        this.course = course;
        this.status = status;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getType_question() {
        return type_question;
    }

    public void setType_question(int type_question) {
        this.type_question = type_question;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }
}
