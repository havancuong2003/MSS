package dal;

import model.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TestDBContext extends DBContext<Account> {
    @Override
    public ArrayList<Account> list() {
        return null;
    }

    @Override
    public void insert(Account entity) {

    }

    @Override
    public void update(Account entity) {

    }

    @Override
    public void delete(Account entity) {

    }

    @Override
    public Account get(int id) throws SQLException {
        return null;
    }

    public ArrayList<Answer> getAllAnswerByQuestionId(int questionId)  {
        ArrayList<Answer> answers = new ArrayList<>();
        try {
            String sql = "Select * from answer where question_id = ? order by answer_id asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer ans = new Answer();
                ans.setAnswerid(rs.getInt("answer_id"));
                ans.setAnswer(rs.getString("answer"));
                ans.setStatus(rs.getInt("status"));
                answers.add(ans);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answers;
    }

    public ArrayList<History> getAllHistoryByStIdAndCourseId(int accId, int courseId)  {
        ArrayList<History> list = new ArrayList<>();
        try {
            String sql = "select h.* from history h\n" +
                    "join student s on s.id = h.student_id\n" +
                    "join account a on a.account_id = s.acc_id\n" +
                    "where a.account_id = ? and h.exercise_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accId);
            stm.setInt(2, courseId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                History his = new History();
                his.setId(rs.getInt(1));
                his.setScore(rs.getInt(2));
                his.setDate_submit(rs.getDate(3));
                list.add(his);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean checkTestExist(int account_id, int exercise_id)  {
        ArrayList<History> list = new ArrayList<>();
        try {
            String sql = "select * from history h\n" +
                    "join student st on st.id = h.student_id\n" +
                    "join account ac on ac.account_id = st.acc_id\n" +
                    "join exercise ex on ex.exercise_id = h.exercise_id\n" +
                    "where ac.account_id = ? \n" +
                    "and h.exercise_id = ? \n" +
                    "and ex.get_score = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            stm.setInt(2, exercise_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                History his = new History();
                his.setId(rs.getInt(1));
                list.add(his);
            }
            if(list.size() != 0) {
                return false;
            }
            return true;

        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Question> getAllQuestionByExerciseIdAndCourseId(int exerciseId, int courseId)  {
        ArrayList<Question> questions = new ArrayList<>();
        try {
            String sql = "select * from question where exercise_id = ? and course_id = ? order by question_id asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, exerciseId);
            stm.setInt(2, courseId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setQuestion_id(rs.getInt("question_id"));
                question.setQuestion(rs.getString("question"));
                question.setType_question(rs.getInt("type_question"));
                questions.add(question);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questions;
    }


    // kieu du lieuj ketes howpj twuf ansswer vaf quesstion
    public ArrayList<QuestionDetail> getAllQuestionDetailByExerciseIdAndCourseId(int exerciseId, int courseId){
        ArrayList<QuestionDetail> questionDetailList = new ArrayList<>();
        ArrayList<Question> questionlist = getAllQuestionByExerciseIdAndCourseId(exerciseId, courseId);
        for (Question question : questionlist) {
            QuestionDetail questionDetail = new QuestionDetail();
            questionDetail.setQuestionId(question.getQuestion_id());
            questionDetail.setQuestionDetail(question.getQuestion());
            ArrayList<Answer> answerlist = getAllAnswerByQuestionId(question.getQuestion_id());
            if(answerlist.size()> 3){
                questionDetail.setAnswers(answerlist);
                questionDetailList.add(questionDetail);
            }else {
                continue;
            }

        }

        return questionDetailList;
    }

    public static void main(String[] args) {
        TestDBContext testDBContext = new TestDBContext();
        ArrayList<Question> questions = testDBContext.getAllQuestionByExerciseIdAndCourseId(123458  , 3);
        for (Question question : questions) {
            System.out.println(question.getQuestion_id());
        }
    }

    // phaan xuwr insert lis lichj suwr
    public int insertHistory(int score, Date dateSubmit, String timeInterval, String studentId, int exerciseId) {
        int historyId = -1;
        try {
            String sql = "INSERT INTO history (score, date_submit, time_interval, student_id, exercise_id) " +
                    "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stm.setInt(1, score);
            stm.setDate(2, dateSubmit);
            stm.setString(3, timeInterval);
            stm.setString(4, studentId);
            stm.setInt(5, exerciseId);
            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    historyId = rs.getInt(1);
                }
                rs.close();
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return historyId;
    }

    public void insertQuestionSubmission(int questionId, int answerId, int historyId) {
        try {
            String sql = "INSERT INTO question_submission (question_id, answer_id, history_id) " +
                    "VALUES (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            stm.setInt(2, answerId);
            stm.setInt(3, historyId);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertQuestionSubmission(int questionId, int historyId) {
        try {
            String sql = "INSERT INTO question_submission (question_id, history_id) " +
                    "VALUES (?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            stm.setInt(2, historyId);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getStudentIdByAccountId(int accId)  {

        try {
            String sql = "select * from student where acc_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

//    public static void main(String[] args) {
//        TestDBContext context = new TestDBContext();
//        String stid = context.getStudentIdByAccountId(16);
//        System.out.println(stid);
//    }


    // xu li in ra lich su
    public ArrayList<QuestionSubmission> getAllQuestionSubmissionByHistory(int historyId)  {
        ArrayList<QuestionSubmission> questionSubmissions = new ArrayList<>();
        try {
            String sql = "select qs.*, q.question from question_submission qs \n" +
                    "join question q on q.question_id = qs.question_id\n" +
                    "where history_id = ? \n" +
                    "order by question_id asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, historyId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                QuestionSubmission questionSubmission = new QuestionSubmission();
                Question question = new Question();
                Answer answer = new Answer();
                question.setQuestion(rs.getString(5));
                question.setQuestion_id(rs.getInt(2));
                questionSubmission.setQuestion(question);
                answer.setAnswerid(rs.getInt(3));
                questionSubmission.setAnswer(answer);
                questionSubmissions.add(questionSubmission);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questionSubmissions;
    }

    public int getScoreByHistory(int historyId)  {
        int score = 0;
        try {
            String sql = "Select score from history where history_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, historyId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(TestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return score;
    }
}
