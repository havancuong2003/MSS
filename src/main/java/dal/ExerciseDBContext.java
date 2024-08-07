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
    public List<Exercise> getListExercise(String group_id) {
        List<Exercise> listExercise = new ArrayList<>();
        String sql = "SELECT * FROM exercise e JOIN course c on e.course_id = c.id WHERE group_id = ? AND e.status IN(0,1) ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Exercise exercise = new Exercise();
                exercise.setExerciseId(rs.getInt("exercise_id"));
                exercise.setExerciseName(rs.getString("exercise_name"));
//                exercise.setQuestion_number(rs.getInt("question_number"));
                exercise.setExercise_time(rs.getFloat("exercise_time"));
                exercise.setStatus(rs.getInt(3));
                exercise.setGet_score(rs.getInt("get_score"));
                exercise.setGroup_id((rs.getInt("group_id")));
                exercise.setGrade_category(rs.getInt("grade_category"));
                exercise.setIsRandom(rs.getInt("isRandom"));
                Teacher t = new Teacher();
                t.setTid(rs.getString("teacher_id"));
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

    public int getTotalExerciseByGroupId(String group_id) {
        try {
            String sql = "SELECT COUNT(*) FROM exercise WHERE group_id = ? AND  status IN (0,1) ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Exercise> pagingExerciseByGroupId (int index, String group_id) {
        List<Exercise> listExercise = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM exercise e " +
                "JOIN course c ON e.course_id = c.id " +
                "WHERE e.group_id = ? " +
                "AND e.status IN (0,1)\n" +
//                "ORDER BY e.exercise_id DESC " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            statement.setInt(2, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Exercise e = new Exercise();
                e.setExerciseId(rs.getInt("exercise_id"));
                e.setExerciseName(rs.getString("exercise_name"));
//                e.setQuestion_number(rs.getInt("question_number"));
                e.setExercise_time(rs.getFloat("exercise_time"));
                e.setGet_score(rs.getInt("get_score"));
                e.setGroup_id((rs.getInt("group_id")));
                e.setStatus(rs.getInt("status"));
                Teacher t = new Teacher();
                t.setTid(rs.getString("teacher_id"));
                e.setTeacher(t);
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setCode(rs.getString("code"));
                e.setCourse(c);
//                e.setQuestion_number(rs.getInt("question_number"));
                e.setGet_score(rs.getInt("get_score"));
                e.setGroup_id((rs.getInt("group_id")));
                e.setGrade_category(rs.getInt("grade_category"));
                e.setIsRandom(rs.getInt("isRandom"));
                listExercise.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listExercise;
    }

    public int getTotalExerciseByGetScore(String group_id,String get_score) {
        try {
            String sql = "SELECT COUNT(*) FROM exercise WHERE group_id = ? AND get_score = ? AND status IN (0,1) ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            statement.setString(2, get_score);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Exercise> pagingExerciseByGetScore (int index, String group_id,String get_score) {
        List<Exercise> listExercise = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM exercise e " +
                "JOIN course c ON e.course_id = c.id " +
                "WHERE e.group_id = ? AND e.get_score = ?" +
                "AND e.status IN (0,1)\n" +
//                "ORDER BY e.exercise_id DESC " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            statement.setString(2, get_score);
            statement.setInt(3, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Exercise e = new Exercise();
                e.setExerciseId(rs.getInt("exercise_id"));
                e.setExerciseName(rs.getString("exercise_name"));
                e.setStatus(rs.getInt("status"));
                Teacher t = new Teacher();
                t.setTid(rs.getString("teacher_id"));
                e.setTeacher(t);
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setCode(rs.getString("code"));
                e.setCourse(c);
//                e.setQuestion_number(rs.getInt("question_number"));
                e.setGet_score(rs.getInt("get_score"));
                e.setGroup_id((rs.getInt("group_id")));
                e.setGrade_category(rs.getInt("grade_category"));
                e.setIsRandom(rs.getInt("isRandom"));
                listExercise.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listExercise;
    }

    public int getTotalExerciseBySearch(String group_id,String searchtxt) {
        try {
            String sql = "SELECT COUNT(*) FROM exercise WHERE group_id = ? AND exercise_name like ? AND status IN(0,1) ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            statement.setString(2, "%" + searchtxt + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Exercise> pagingExerciseBySearch (int index, String group_id,String searchtxt) {
        List<Exercise> listExercise = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM exercise e " +
                "JOIN course c ON e.course_id = c.id " +
                "WHERE e.group_id = ? AND e.exercise_name like ?" +
                "AND e.status IN (0,1)\n" +
//                "ORDER BY e.exercise_id DESC " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, group_id);
            statement.setString(2, "%" + searchtxt + "%");
            statement.setInt(3, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Exercise e = new Exercise();
                e.setExerciseId(rs.getInt("exercise_id"));
                e.setExerciseName(rs.getString("exercise_name"));
                e.setStatus(rs.getInt("status"));
                Teacher t = new Teacher();
                t.setTid(rs.getString("teacher_id"));
                e.setTeacher(t);
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setCode(rs.getString("code"));
                e.setCourse(c);
//                e.setQuestion_number(rs.getInt("question_number"));
                e.setGet_score(rs.getInt("get_score"));
                e.setGroup_id((rs.getInt("group_id")));
                e.setGrade_category(rs.getInt("grade_category"));
                e.setIsRandom(rs.getInt("isRandom"));
                listExercise.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listExercise;
    }
    public void insertExerciseGetMark(String exercise_id, String exercise_name, String teacher_id, String course_id,String basicQuestion,String lowQuestion,String highQuestion,String exercise_time,String get_score,String group_id,String grade_category,String isRandom) {
        LocalDateTime currentTime = LocalDateTime.now();
        String time = currentTime.toString();
        String sql = "INSERT INTO exercise (exercise_id,exercise_name,status,teacher_id,course_id,basic_question,low_question,high_question,exercise_time,get_score,group_id,grade_category,isRandom) VALUES (?,?,0,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setString(2, exercise_name);
            statement.setString(3, teacher_id);
            statement.setString(4, course_id);
            statement.setString(5, basicQuestion);
            statement.setString(6,lowQuestion);
            statement.setString(7,highQuestion);
            statement.setString(8, exercise_time);
            statement.setString(9, get_score);
            statement.setString(10, group_id);
            statement.setString(11, grade_category);
            statement.setString(12, isRandom);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertExerciseNotGetMark(String exercise_id, String exercise_name, String teacher_id, String course_id,String basicQuestion,String lowQuestion,String highQuestion,String exercise_time,String get_score,String group_id,String isRandom) {

        String sql = "INSERT INTO exercise (exercise_id,exercise_name,status,teacher_id,course_id,basic_question,low_question,high_question,exercise_time,get_score,group_id,isRandom) VALUES (?,?,0,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setString(2, exercise_name);
            statement.setString(3, teacher_id);
            statement.setString(4, course_id);
            statement.setString(5, basicQuestion);
            statement.setString(6, lowQuestion);
            statement.setString(7, highQuestion);
            statement.setString(8, exercise_time);
            statement.setString(9, get_score);
            statement.setString(10, group_id);
            statement.setString(11, isRandom);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Teacher getTeacher(String teacher_id) {
        String sql = "SELECT * FROM teacher t JOIN account a ON t.acc_id = a.account_id WHERE t.id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, teacher_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("id"));
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

    public List<Grade_category> getListGradeCategory(String course_id) {
        List<Grade_category> list = new ArrayList<>();
        String sql = "SELECT * FROM grade_category gc JOIN course c on gc.course_id = c.id WHERE c.id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
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
        String sql = "SELECT * FROM exercise e JOIN course c on e.course_id = c.id WHERE e.exercise_id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exericse_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Exercise exercise = new Exercise();
                exercise.setExerciseId(rs.getInt("exercise_id"));
                exercise.setExerciseName(rs.getString("exercise_name"));
                exercise.setStatus(rs.getInt(3));
                exercise.setBasic_question(rs.getInt("basic_question"));
                exercise.setLow_question(rs.getInt("low_question"));
                exercise.setHigh_question(rs.getInt("high_question"));
                exercise.setExercise_time(rs.getFloat("exercise_time"));
                exercise.setGet_score(rs.getInt("get_score"));
                exercise.setGroup_id((rs.getInt("group_id")));
                exercise.setGrade_category(rs.getInt("grade_category"));
                exercise.setIsRandom(rs.getInt("isRandom"));
                Teacher t = new Teacher();
                t.setTid(rs.getString("teacher_id"));
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
    public void editExerciseStatusForDelete(String exercise_id) {
        String sql = "UPDATE exercise " +
                "SET status = 2 " +
                "WHERE exercise_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editExerciseStatusForPrevent(String exercise_id) {
        String sql = "UPDATE exercise " +
                "SET status = 1 " +
                "WHERE exercise_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editExerciseStatusForClose(String exercise_id) {
        String sql = "UPDATE exercise " +
                "SET status = 0 " +
                "WHERE exercise_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateExerciseNormalGetScore(String exercise_id,String exercise_name,String question_number,String exercise_time,String grade_category) {
        String sql = "UPDATE exercise " +
                "SET exercise_name = ?, " +
                "exercise_time = ?, " +
                "get_score = ?, " +
                "grade_category = ? " +
                "WHERE exercise_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_name);
            statement.setString(2, question_number);
            statement.setString(3, exercise_time);
            statement.setString(4, grade_category);
            statement.setString(5, exercise_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateExerciseNormalNotGetScore(String exercise_id,String exercise_name,String exercise_time,String get_score) {
        String sql = "UPDATE exercise " +
                "SET exercise_name = ?, " +
                "exercise_time = ?, " +
                "get_score = ?, " +
                "grade_category = NULL " +
                "WHERE exercise_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_name);
            statement.setString(2, exercise_time);
            statement.setString(3, get_score);
            statement.setString(4, exercise_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Group> getListGroup(String PIC,int semester_id) {
        List<Group> list = new ArrayList<>();
        String sql = "SELECT * FROM `group` WHERE PIC like ? AND semester_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, PIC);
            statement.setInt(2, semester_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Group group = new Group();
                group.setId(rs.getInt("id"));
                group.setName(rs.getString("name"));
//                group.setLink(rs.getString("link"));
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                group.setCourse(course);
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("PIC"));
                group.setTeacher(teacher);
                list.add(group);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Course> getListCourse() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM `course` WHERE status = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCode(rs.getString("code"));
                course.setDetail(rs.getString("detail"));
                course.setStatus(rs.getBoolean("status"));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public static void main(String[] args) {
        ExerciseDBContext dao = new ExerciseDBContext();
        dao.insertExerciseGetMark("123456","demo","t1","1","5","5","5","10","1","1","1","0");
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
