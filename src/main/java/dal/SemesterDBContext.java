package dal;

import model.Semester;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class SemesterDBContext extends DBContext<Semester> {
    public ArrayList<Semester> getSemesterForStudent(String sid) {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select distinct se.id, se.detail from swp391.group gr inner join enrollment en on en.group_id = gr.id \n" +
                    "inner join semester se on se.id = gr.semester_id where en.student_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                semesters.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return semesters;
    }

    public ArrayList<Semester> getSemesterForTeacher(String tid) {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "select distinct s.id, s.detail from swp391.group g inner join semester s on g.semester_id = s.id\n" +
                    "where g.PIC = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, tid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester s = new Semester();
                s.setId(rs.getInt("id"));
                s.setDetail(rs.getString("detail"));
                semesters.add(s);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return semesters;
    }

    @Override
    public ArrayList<Semester> list() {
        return null;
    }

    @Override
    public void insert(Semester entity) {

    }

    @Override
    public void update(Semester entity) {

    }

    @Override
    public void delete(Semester entity) {

    }

    @Override
    public Semester get(int id) throws SQLException {
        Semester semester = null;
        String sql = "select * from semester where id = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            semester = new Semester();
            semester.setId(rs.getInt("id"));
            semester.setStart(rs.getDate("start"));
            semester.setEnd(rs.getDate("end"));
            semester.setDetail(rs.getString("detail"));
            semester.setNextSemesterID(getNextSemester());
            semester.setTotalCourseRegisterForNextSemester(rs.getInt("totalCourse"));
        }
        return semester;
    }
    public  int getCurrentSemester(){
        String sql ="SELECT id FROM semester WHERE ? BETWEEN `start` AND `end`";
        Date now = new Date();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(now.getTime()));
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    public int getNextSemester(){
        int currentSemesterID = getCurrentSemester();
        String sql ="SELECT id \n" +
                "FROM semester \n" +
                "WHERE id > ?\n" +
                "ORDER BY id \n" +
                "LIMIT 1;\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentSemesterID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    public void setTotalCourseRegisterForNextSemester(int number,int semesterID){
        String sql ="UPDATE `semester` SET `totalCourse` = ? WHERE (`id` = ?);\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, number);
            stm.setInt(2, semesterID);
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        SemesterDBContext s = new SemesterDBContext();
        Semester ss = s.get(1);
        System.out.println(ss.getId()+" "+ss.getStart()+" "+ss.getEnd()+" "+ss.getDetail()+" "+ss.getNextSemesterID()+"\n"+ss.getTotalCourseRegisterForNextSemester());
    }


    }

