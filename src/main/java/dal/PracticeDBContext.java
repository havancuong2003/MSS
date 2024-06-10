package dal;

import model.Account;
import model.Answer;
import model.Question;
import model.QuestionDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PracticeDBContext  extends DBContext<Account>{
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
            String sql = "Select * from answer where question_id = ?";
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
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answers;
    }

    public ArrayList<Question> getAllQuestionByExerciseIdAndCourseId(int exerciseId, int courseId)  {
        ArrayList<Question> questions = new ArrayList<>();
        try {
            String sql = "select * from question where exercise_id = ? and course_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, exerciseId);
            stm.setInt(2, courseId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setQuestionid(rs.getInt("question_id"));
                question.setQuestion(rs.getString("question"));
                question.setTypequestion(rs.getInt("type_question"));
                questions.add(question);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questions;
    }

    public ArrayList<QuestionDetail> getAllQuestionDetailByExerciseIdAndCourseId(int exerciseId, int courseId){
        ArrayList<QuestionDetail> questionDetailList = new ArrayList<>();
        ArrayList<Question> questionlist = getAllQuestionByExerciseIdAndCourseId(exerciseId, courseId);
        for (Question question : questionlist) {
            QuestionDetail questionDetail = new QuestionDetail();
            questionDetail.setQuestionId(question.getQuestionid());
            questionDetail.setQuestionDetail(question.getQuestion());
            ArrayList<Answer> answerlist = getAllAnswerByQuestionId(question.getQuestionid());
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
        PracticeDBContext context = new PracticeDBContext();
        ArrayList<Question> quiz = context.getAllQuestionByExerciseIdAndCourseId(1,1);
        System.out.println(quiz.get(2).getQuestion());
    }

}
