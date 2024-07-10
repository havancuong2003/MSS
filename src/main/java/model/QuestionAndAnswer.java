package model;

import java.util.List;

public class QuestionAndAnswer {
    private Question question;
    private List<Answer> listAnswer;


    public QuestionAndAnswer() {
    }

    public QuestionAndAnswer(Question question, List<Answer> listAnswer) {
        this.question = question;
        this.listAnswer = listAnswer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public List<Answer> getListAnswer() {
        return listAnswer;
    }

    public void setListAnswer(List<Answer> listAnswer) {
        this.listAnswer = listAnswer;
    }
}
