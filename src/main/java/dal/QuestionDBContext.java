package dal;

import com.mysql.cj.jdbc.Blob;
import model.*;

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
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setInt(2, (index-1)*10);
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
    public int getTotalQuestionByTypeQuestion(String type_question,String exercise_id) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE type_question = ? AND exercise_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, type_question);
            statement.setString(2, exercise_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public List<Question> pagingQuestionByTypeQuestion (int index, String type_question,String exercise_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " +
                "WHERE q.type_question = ? AND q.exercise_id = ? " +
                "ORDER BY q.question_id " +
                "LIMIT 10 OFFSET ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, type_question);
            statement.setString(2, exercise_id);
            statement.setInt(3, (index - 1) * 10);
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
        return listQuestion;
    }
    public void insertQuestion(String question,String type_question,String exercise_id,String course_id) {
        String sql = "INSERT INTO question (question,type_question,exercise_id,course_id,status) " +
                "VALUES (?, ?, ?,?,0)";
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
    public int getQuestion_id() {
        String sql = "SELECT question_id FROM question ORDER BY question_id DESC LIMIT 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("question_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public void editQuestionStatus(int question_id) {
        String sql = "UPDATE question " +
                "SET status = 1 " +
                "WHERE question_id like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void editQuestionStatusForBank(int question_id) {
        String sql = "UPDATE question " +
                "SET status = 2 " +
                "WHERE question_id like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void insertAnswer(String answer,String question_id) {
        String sql = "INSERT INTO answer (answer,status,question_id) " +
                "VALUES (?, 0, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, answer);
            statement.setString(2, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void editAnswerStatus(String answer) {
        String sql = "UPDATE answer " +
                "SET status = 1 " +
                "WHERE answer like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, answer);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Question getQuestionById (String question_id) {
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "where q.question_id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                return q;

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }
    public List<Answer> getListAnswerByQuestionId (String question_id) {
        List<Answer> listAnswer = new ArrayList<>();
        String sql = "SELECT * FROM answer q\n" +
                "where question_id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Answer answer = new Answer();
                answer.setAnswerid(rs.getInt("answer_id"));
                answer.setAnswer(rs.getString("answer"));
                answer.setStatus(rs.getInt("status"));
                listAnswer.add(answer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listAnswer;
    }
    public List<Answer> getListCorrectAnswerByQuestionId (String question_id) {
        List<Answer> listAnswer = new ArrayList<>();
        String sql = "SELECT * FROM answer q\n" +
                "where question_id = ? AND status = 1 ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Answer answer = new Answer();
                answer.setAnswerid(rs.getInt("answer_id"));
                answer.setAnswer(rs.getString("answer"));
                answer.setStatus(rs.getInt("status"));
                listAnswer.add(answer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listAnswer;
    }
    public void insertQuestionAfterUpdate(String question_id,String question,String type_question,String exercise_id,String course_id) {
        String sql = "INSERT INTO question (question_id,question,type_question,exercise_id,course_id,status) " +
                "VALUES (?,?, ?, ?,?,0)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            statement.setString(2, question);
            statement.setString(3, type_question);
            statement.setString(4, exercise_id);
            statement.setString(5, course_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    public List<Question> getAllListQuestion () {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " ;

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
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

    public int getTotalQuestionBySearch(String question,String exercise_id) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE question like ? AND exercise_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + question +"%");
            statement.setString(2, exercise_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingQuestionBySearch (int index,String question,String exercise_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " +
                "WHERE q.question like ? AND q.exercise_id = ? " +
                "ORDER BY q.question_id " +
                "LIMIT 10 OFFSET ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + question + "%");
            statement.setString(2, exercise_id);
            statement.setInt(3, (index - 1) * 10);
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
        return listQuestion;
    }
    public void deleteQuestion(String question_id) {
        String sql = "DELETE FROM question WHERE question_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Question> getListQuestionByExerciseId (String exercise_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " +
                "WHERE q.exercise_id = ? " ;

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
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
    public List<Question> getListQuestionByExerciseIdAndTypeQuestion (String exercise_id,String type_question) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM question q " +
                "JOIN exercise e ON q.exercise_id = e.exercise_id " +
                "JOIN course c ON q.course_id = c.id " +
                "WHERE q.exercise_id = ? AND q.type_question = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, exercise_id);
            statement.setString(2, type_question);
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
    public Question getQuestion(String question, String exercise_id) {
        String sql = "SELECT * FROM question q JOIN course c ON q.course_id = c.id where question like ? and q.exercise_id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.setString(2, exercise_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(10));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                return q;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAnswerFromBank(String answer,int question_id,int status) {
        String sql = "INSERT INTO answer (answer,status,question_id) " +
                "VALUES (?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, answer);
            statement.setInt(2,status);
            statement.setInt(3, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void refuseQuestion(int question_id) {
        String sql = "UPDATE question " +
                "SET status = 0 " +
                "WHERE question_id like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalPublicQuestion(String course_id) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE course_id like ? AND status = 1 ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingListPublicQuestionByCourseId (int index, String course_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "WHERE q.course_id = ? AND q.status = 1 " +
                "ORDER BY CASE WHEN q.status = 1 THEN 0 ELSE 1 END, q.question_id DESC " +
                "LIMIT 10 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setInt(2, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public int getTotalPublicQuestionByTypeQuestion(String course_id,String type_question) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE course_id like ? AND type_question = ? AND status = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, type_question);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingListPublicQuestionByTypeQuestion (int index,String type_question,String course_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "WHERE q.course_id = ? AND q.type_question = ? AND q.status = 1\n " +
                "ORDER BY CASE WHEN q.status = 1 THEN 0 ELSE 1 END, q.question_id " +
                "LIMIT 10 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, type_question);
            statement.setInt(3, (index-1)*10);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public int getTotalQuestionByStatusQuestion(String course_id,String status_question) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE course_id like ? AND status = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, status_question);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingListQuestionBankByStatusQuestion(int index,String type_question,String course_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "WHERE q.course_id = ?  AND q.status = ? " +
                "ORDER BY CASE WHEN q.status = 1 THEN 0 ELSE 1 END, q.question_id " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, type_question);
            statement.setInt(3, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public int getTotalQuestionByStatusAndTypeQuestion(String course_id,String status_question,String type_question) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE course_id like ? AND status = ? AND type_question = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, status_question);
            statement.setString(3, type_question);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingListQuestionBankByStatusAndTypeQuestion(int index,String type_question,String course_id,String status_question) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "WHERE q.course_id = ?  AND q.status = ? AND type_question = ? " +
                "ORDER BY CASE WHEN q.status = 1 THEN 0 ELSE 1 END, q.question_id " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, status_question);
            statement.setString(3, type_question);
            statement.setInt(4, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public int getTotalPublicQuestionBySearch(String course_id,String question) {
        try {
            String sql = "SELECT COUNT(*) FROM question WHERE course_id like ? AND question like ? AND status = 1 ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, "%"+question+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Question> pagingListPublicQuestionBySearch(int index,String question,String course_id) {
        List<Question> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM question q\n" +
                "LEFT JOIN exercise e ON q.exercise_id = e.exercise_id\n" +
                "LEFT JOIN course c ON q.course_id = c.id\n" +
                "LEFT JOIN teacher t ON e.teacher_id = t.id\n" +
                "LEFT JOIN account acc ON t.acc_id = acc.account_id\n" +
                "WHERE q.course_id = ?  AND q.question like ? AND q.status =1 " +
                "ORDER BY CASE WHEN q.status = 1 THEN 0 ELSE 1 END, q.question_id DESC " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, "%" + question + "%");
            statement.setInt(3, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt(1));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                Exercise ex = new Exercise();
                ex.setExerciseId(rs.getInt(4));
                ex.setExerciseName(rs.getString("exercise_name"));
                ex.setStatus(rs.getInt(11));
                Teacher teacher = new Teacher();
                teacher.setTid(rs.getString("teacher_id"));
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
                ex.setTeacher(teacher);
                q.setExercise(ex);
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setDetail(rs.getString("detail"));
                c.setStatus(rs.getBoolean(17));
                q.setCourse(c);
                q.setStatus(rs.getInt(6));
                listQuestion.add(q);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public static void main(String[] args) {
        QuestionDBContext dao = new QuestionDBContext();
        System.out.println(dao.getTotalPublicQuestion(""));
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
