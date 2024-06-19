package model;

import java.util.ArrayList;

public class QuestionDetail {
    private int questionId;
    private String questionDetail;
    private ArrayList<Answer> answers;
    private String type;

    public QuestionDetail() { }

    public QuestionDetail(int questionId, String questionDetail, ArrayList<Answer> answers, String type) {
        this.questionId = questionId;
        this.questionDetail = questionDetail;
        this.answers = answers;
        this.type = type;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionDetail() {
        return questionDetail;
    }

    public void setQuestionDetail(String questionDetail) {
        this.questionDetail = questionDetail;
    }

    public ArrayList<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Answer> answers) {
        this.answers = answers;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
