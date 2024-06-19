package model;

import java.util.ArrayList;

public class QuestionSubmission {
    private int id;
    private Question question;
    private Answer answer;
    private History history;
    private ArrayList<Answer> answers;

    public QuestionSubmission() {

    }

    public QuestionSubmission(Question question, Answer answer, History history) {

    }

    public QuestionSubmission(int id, Question question, Answer answer, History history, ArrayList<Answer> answers) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.history = history;
        this.answers = answers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public ArrayList<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Answer> answers) {
        this.answers = answers;
    }
}
