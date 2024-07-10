package model;

import java.util.List;

public class BankQuestionAndBankAnswer {
    private BankQuestion bankQuestion;
    private List<BankAnswer> listBankAnswers;

    public BankQuestionAndBankAnswer() {
    }

    public BankQuestionAndBankAnswer(BankQuestion bankQuestion, List<BankAnswer> listBankAnswers) {
        this.bankQuestion = bankQuestion;
        this.listBankAnswers = listBankAnswers;
    }

    public BankQuestion getBankQuestion() {
        return bankQuestion;
    }

    public void setBankQuestion(BankQuestion bankQuestion) {
        this.bankQuestion = bankQuestion;
    }

    public List<BankAnswer> getListBankAnswers() {
        return listBankAnswers;
    }

    public void setListBankAnswers(List<BankAnswer> listBankAnswers) {
        this.listBankAnswers = listBankAnswers;
    }
}
