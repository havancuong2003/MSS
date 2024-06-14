package model;

public class Major implements IEntity{

    private int id;
    private String code;
    private String detail;
    public Major() {
    }

    public Major(String code, String detail) {
        this.code = code;
        this.detail = detail;
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
