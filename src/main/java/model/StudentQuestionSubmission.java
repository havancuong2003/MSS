package model;

public class StudentQuestionSubmission {
    private int id;
    private Question question;
    private Answer answer;
    private History history;

    public StudentQuestionSubmission() {}

    public StudentQuestionSubmission(int id, Question question, Answer answer, History history) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.history = history;
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
}
