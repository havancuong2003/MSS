package model;

public class BankQuestion implements IEntity {
    private int bank_question_id;
    private String question;
    private int type_question;
    private String created_by;
    private int course_id;
    private int status;
    public BankQuestion() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public BankQuestion(int bank_question_id, String question, int type_question, String created_by, int course_id, int status) {
        this.bank_question_id = bank_question_id;
        this.question = question;
        this.type_question = type_question;
        this.created_by = created_by;
        this.course_id = course_id;
        this.status = status;
    }

    public int getBank_question_id() {
        return bank_question_id;
    }

    public void setBank_question_id(int bank_question_id) {
        this.bank_question_id = bank_question_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getType_question() {
        return type_question;
    }

    public void setType_question(int type_question) {
        this.type_question = type_question;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
