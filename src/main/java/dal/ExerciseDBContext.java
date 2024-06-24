package dal;

import com.mysql.cj.jdbc.Blob;
import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExerciseDBContext extends DBContext<Exercise>{
    public List<Exercise> getListExercise() {
        List<Exercise> listExercise = new ArrayList<>();
        String sql = "SELECT * FROM exercise e JOIN course c on e.course_id = c.id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Exercise exercise = new Exercise();
                exercise.setExerciseId(rs.getInt("exercise_id"));
                exercise.setExerciseName(rs.getString("exercise_name"));
                exercise.setTimeStart(rs.getDate("time_start"));
                exercise.setTimeEnd(rs.getDate("time_end"));
                exercise.setQuestion_number(rs.getInt("question_number"));
                exercise.setExercise_time(rs.getFloat("exercise_time"));
                exercise.setGet_score(rs.getInt("get_score"));
                exercise.setGroup_id((rs.getInt("group_id")));
                Teacher t = new Teacher();
                t.setId(rs.getInt("teacher_id"));
                exercise.setTeacher(t);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean("status"));
                exercise.setCourse(c);
                listExercise.add(exercise);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listExercise;
    }

    public void insertExerciseGetMark(String exercise_id, String exercise_name, String teacher_id, String course_id,String question_number,String exercise_time,String get_score,String group_id,String grade_category) {
        LocalDateTime currentTime = LocalDateTime.now();
        String time = currentTime.toString();
        String sql = "INSERT INTO exercise (exercise_id,exercise_name,status,teacher_id,course_id,question_number,exercise_time,get_score,group_id,grade_category) VALUES (?,?,0,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setString(2, exercise_name);
            statement.setString(3, teacher_id);
            statement.setString(4, course_id);
            statement.setString(5, question_number);
            statement.setString(6, exercise_time);
            statement.setString(7, get_score);
            statement.setString(8, group_id);
            statement.setString(9, grade_category);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertExerciseNotGetMark(String exercise_id, String exercise_name, String teacher_id, String course_id,String question_number,String exercise_time,String get_score,String group_id) {

        String sql = "INSERT INTO exercise (exercise_id,exercise_name,status,teacher_id,course_id,question_number,exercise_time,get_score,group_id) VALUES (?,?,0,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setString(2, exercise_name);
            statement.setString(3, teacher_id);
            statement.setString(4, course_id);
            statement.setString(5, question_number);
            statement.setString(6, exercise_time);
            statement.setString(7, get_score);
            statement.setString(8, group_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Teacher getTeacher(String teacher_id) {
        String sql = "SELECT * FROM teacher t JOIN account a ON t.account_id = a.account_id WHERE t.teacher_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, teacher_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Teacher teacher = new Teacher();
                teacher.setId(rs.getInt("teacher_id"));
                Account acc = new Account();
                acc.setId(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setPhone(rs.getString("phone"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getDate("date_of_birth"));
                acc.setAddress(rs.getString("address"));
                acc.setAvatar((Blob) rs.getBlob("photo"));
                acc.setGender(rs.getBoolean("gender"));
                teacher.setAccount(acc);
                return teacher;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Grade_category> getListGradeCategory() {
        List<Grade_category> list = new ArrayList<>();
        String sql = "SELECT * FROM grade_category gc JOIN course c on gc.course_id = c.id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Grade_category gc = new Grade_category();
                gc.setId(rs.getInt("id"));
                gc.setName(rs.getString("name"));
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean("status"));
                gc.setCourse(c);
                list.add(gc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Exercise getExerciseById(String exericse_id) {
        String sql = "SELECT * FROM exercise e JOIN course c on e.course_id = c.id WHERE exercise_id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exericse_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Exercise exercise = new Exercise();
                exercise.setExerciseId(rs.getInt("exercise_id"));
                exercise.setExerciseName(rs.getString("exercise_name"));
                exercise.setTimeStart(rs.getDate("time_start"));
                exercise.setTimeEnd(rs.getDate("time_end"));
                exercise.setQuestion_number(rs.getInt("question_number"));
                exercise.setExercise_time(rs.getFloat("exercise_time"));
                exercise.setGet_score(rs.getInt("get_score"));
                exercise.setGroup_id((rs.getInt("group_id")));
                exercise.setGrade_category(rs.getInt("grade_category"));
                Teacher t = new Teacher();
                t.setId(rs.getInt("teacher_id"));
                exercise.setTeacher(t);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean("status"));
                exercise.setCourse(c);
                return  exercise;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Exercise> list() {
        return null;
    }

    @Override
    public void insert(Exercise entity) {

    }

    @Override
    public void update(Exercise entity) {

    }

    @Override
    public void delete(Exercise entity) {

    }

    @Override
    public Exercise get(int id) throws SQLException {
        return null;
    }
}
