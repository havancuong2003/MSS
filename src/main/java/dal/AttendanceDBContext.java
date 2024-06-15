package dal;

import model.Attendance;

import java.sql.SQLException;
import java.util.ArrayList;

public class AttendanceDBContext extends DBContext<Attendance> {

    @Override
    public ArrayList<Attendance> list() {
        return null;
    }

    @Override
    public void insert(Attendance entity) {

    }

    @Override
    public void update(Attendance entity) {

    }

    @Override
    public void delete(Attendance entity) {

    }

    @Override
    public Attendance get(int id) throws SQLException {
        return null;
    }
}
