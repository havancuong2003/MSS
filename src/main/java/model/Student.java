package model;

import java.util.ArrayList;

public class Student implements IEntity
{

    private String id;
    private Account account;
    private String currentTerm;
    private ArrayList<Attendance> attendances = new ArrayList<>();

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

    public String getCurrentTerm() {
        return currentTerm;
    }

    public void setCurrentTerm(String currentTerm) {
        this.currentTerm = currentTerm;
    }

    public Student(String id, Account account, String currentTerm) {
        this.id = id;
        this.account = account;
        this.currentTerm = currentTerm;
    }

    public Student() {
    }

    public ArrayList<Attendance> getAttendances() {
        return attendances;
    }

    public void setAttendances(ArrayList<Attendance> attendances) {
        this.attendances = attendances;
    }
}
