package model;

public class Teacher extends Account implements IEntity{

    private String id;
    private Account account;

    public Teacher(String id, Account account) {
        this.id = id;
        this.account = account;
    }

    public Teacher() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
