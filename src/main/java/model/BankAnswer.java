package model;

public class BankAnswer {
    private int bank_answer_id;
    private String answer;
    private int status;
    private BankQuestion bankQuestion;

    public BankAnswer() {
    }

    public BankAnswer(int bank_answer_id, String answer, int status, BankQuestion bankQuestion) {
        this.bank_answer_id = bank_answer_id;
        this.answer = answer;
        this.status = status;
        this.bankQuestion = bankQuestion;
    }

    public int getBank_answer_id() {
        return bank_answer_id;
    }

    public void setBank_answer_id(int bank_answer_id) {
        this.bank_answer_id = bank_answer_id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public BankQuestion getBankQuestion() {
        return bankQuestion;
    }

    public void setBankQuestion(BankQuestion bankQuestion) {
        this.bankQuestion = bankQuestion;
    }
}
