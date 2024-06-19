package model;

import java.sql.*;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
public class Session implements IEntity {
    private int id;
    private Group group;
    private Room room;
    private Date date;
    private Teacher teacher;

    private Slot slot ;
    private boolean taken;
    private boolean isChange;
    private boolean lock;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public boolean isTaken() {
        return taken;
    }

    public void setTaken(boolean taken) {
        this.taken = taken;
    }

    public boolean isChange() {
        return isChange;
    }

    public void setChange(boolean change) {
        isChange = change;
    }

    public boolean isLock() {
        return lock;
    }

    public void setLock(boolean lock) {
        this.lock = lock;
    }

    public void updateLockStatus() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime sessionEnd = LocalDateTime.of(date.toLocalDate(), slot.getEndTime().toLocalTime());
        if (taken && now.isAfter(sessionEnd.plus(1, ChronoUnit.DAYS))) {
            lock = true;
        } else if (now.isBefore(sessionEnd)) {
            lock = true;
        } else {
            lock = false;
        }
    }
}
