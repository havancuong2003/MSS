package model;

import java.util.ArrayList;

public class Student implements IEntity
{

    private String id;
    private Account account;
    private String currentTerm;
    private ArrayList<Attendance> attendances = new ArrayList<>();

    private Major major;
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

    public Student(String id, Account account, String currentTerm, Major major) {
        this.id = id;
        this.account = account;
        this.currentTerm = currentTerm;
        this.major = major;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
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
