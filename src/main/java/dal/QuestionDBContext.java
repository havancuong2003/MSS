package dal;

import model.Course;
import model.Exercise;
import model.Question;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QuestionDBContext extends DBContext<Question> {
    public int getTotalQuestion(String exercise_id) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE exercise_id like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingQuestionByExercise_id (int index, String exercise_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " +
                "WHERE q.exercise_id = ? " +
                "ORDER BY q.question_id DESC " +
                "LIMIT 5 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setInt(2, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                q.setStatus(rs.getInt(6));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt("exercise_id"));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public void insertQuestionFromBank(String question,String type_question,String exercise_id,String course_id) {
        String sql = "INSERT INTO question (question,type_question,exercise_id,course_id,status) " +
                "VALUES (?, ?, ?,?,2)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.setString(2, type_question);
            statement.setString(3, exercise_id);
            statement.setString(4, course_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public ArrayList<Question> list() {
        return null;
    }

    @Override
    public void insert(Question entity) {

    }

    @Override
    public void update(Question entity) {

    }

    @Override
    public void delete(Question entity) {

    }

    @Override
    public Question get(int id) throws SQLException {
        return null;
    }
}
