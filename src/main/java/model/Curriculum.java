package model;

import java.util.ArrayList;

public class  Curriculum implements IEntity{

    private Major major;
    private int term;
    private Course course;
    private String description;
    private ArrayList<Term> terms;

    public Curriculum( Major major, ArrayList<Term> terms) {
        this.major = major;
        this.terms = terms;
    }

    public Curriculum() {
    }

    public ArrayList<Term> getTerms() {
        return terms;
    }

    public void setTerms(ArrayList<Term> terms) {
        this.terms = terms;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }


}
