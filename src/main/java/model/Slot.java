package model;
import java.sql.*;

import java.sql.Time;

public class Slot implements IEntity {
    private int id;
    private String detail;
    private Time startTime;
    private Time endTime;

    public Slot() {

    }

    public Slot(int id, String detail, Time startTime, Time endTime) {
        this.id=id;
        this.detail = detail;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }
}
