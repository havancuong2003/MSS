package model;

public class Answer {
    private int answerid;
    private String answer;
    private int status;
    private QuestionDetail question;

    public Answer() {
    }

    public Answer(int answerid, QuestionDetail question, int status, String answer) {
        this.answerid = answerid;
        this.question = question;
        this.status = status;
        this.answer = answer;
    }

    public int getAnswerid() {
        return answerid;
    }

    public String getAnswer() {
        return answer;
    }

    public int getStatus() {
        return status;
    }

    public QuestionDetail getQuestion() {
        return question;
    }

    public void setAnswerid(int answerid) {
        this.answerid = answerid;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setQuestion(QuestionDetail question) {
        this.question = question;
    }
}
