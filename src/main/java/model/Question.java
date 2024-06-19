package model;

public class Question {
    private int questionid;
    private String question;
    private int typequestion;
    private int exerciseid;
    private int courseid;
    private int status;

    public Question() {
    }

    public Question(int questionid, int exerciseid, String question, int typequestion, int courseid, int status) {
        this.questionid = questionid;
        this.exerciseid = exerciseid;
        this.question = question;
        this.typequestion = typequestion;
        this.courseid = courseid;
        this.status = status;
    }

    public int getQuestionid() {
        return questionid;
    }

    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getTypequestion() {
        return typequestion;
    }

    public void setTypequestion(int typequestion) {
        this.typequestion = typequestion;
    }

    public int getExerciseid() {
        return exerciseid;
    }

    public void setExerciseid(int exerciseid) {
        this.exerciseid = exerciseid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
