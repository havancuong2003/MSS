package model;

import java.sql.Time;

public class Slot implements IEntity {
    private int id;
    private String detail;
    private Time startTime;
    private Time endTime;

    public Slot() {

    }

    public Slot(String detail, Time startTime, Time endTime) {
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

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }
}