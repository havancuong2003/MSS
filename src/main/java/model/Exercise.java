package model;


import java.sql.Date;
import java.util.ArrayList;

public class Exercise {
    private int exerciseId;
    private String exerciseName;
    private Date timeStart;
    private Date timeEnd;
    private int status;
    private String teacherId;
    private int courseId;

    public ArrayList<History> getHistories() {
        return histories;
    }

    public void setHistories(ArrayList<History> histories) {
        this.histories = histories;
    }

    private ArrayList<History> histories;

    public Exercise() {
    }

    public Exercise(int exerciseId, String exerciseName, Date timeStart, Date timeEnd, int status, String teacherId, int courseId) {
        this.exerciseId = exerciseId;
        this.exerciseName = exerciseName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.status = status;
        this.teacherId = teacherId;
        this.courseId = courseId;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public Date getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Date timeStart) {
        this.timeStart = timeStart;
    }

    public Date getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Date timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }
}
