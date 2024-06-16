package model;

import java.sql.Blob;
import java.util.Date;

public class Teacher extends Account implements IEntity{

    private int id;
    private Account account;

    public Teacher(int id, Account account) {
        this.id = id;
        this.account = account;
    }


    public Teacher() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
