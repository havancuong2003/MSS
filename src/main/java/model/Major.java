package model;


import java.util.ArrayList;

public class Major implements IEntity{

    private int id;
    private String code;
    private String detail;
    private ArrayList<Term> terms;
    
    public Major() {
    }

    public Major(int id, String code, String detail, ArrayList<Term> terms) {
        this.id = id;
        this.code = code;
        this.detail = detail;
        this.terms = terms;
    }

    public ArrayList<Term> getTerms() {
        return terms;
    }

    public void setTerms(ArrayList<Term> terms) {
        this.terms = terms;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
