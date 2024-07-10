package dal;

import model.BankAnswer;
import model.BankQuestion;
import model.IEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BankQuestionDBContext extends DBContext<BankQuestion> {
    public List<BankQuestion> getListBankQuestionByTypeQuesion (String type_question) {
        List<BankQuestion> listBankQuestion = new ArrayList<>();
        String sql = "SELECT * FROM bank_question q\n" +
                "where type_question = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, type_question);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion bankQuestion = new BankQuestion();
                bankQuestion.setBank_question_id(rs.getInt("bank_question_id"));
                bankQuestion.setQuestion(rs.getString("question"));
                bankQuestion.setType_question(rs.getInt("type_question"));
                bankQuestion.setCreated_by(rs.getString("created_by"));
                bankQuestion.setCourse_id(rs.getInt("course_id"));
                bankQuestion.setStatus(rs.getInt("status"));
                listBankQuestion.add(bankQuestion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listBankQuestion;
    }

    public BankQuestion getBankQuestionById (String bank_question_id) {
        String sql = "SELECT * " +
                "FROM bank_question " +
                "WHERE bank_question_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, bank_question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion q = new BankQuestion();
                q.setBank_question_id(rs.getInt("bank_question_id"));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                q.setCreated_by(rs.getString("created_by"));
                q.setCourse_id(rs.getInt("course_id"));
                return q;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }

    public List<BankAnswer> getListBankAnswerByQuestionId (String bank_question_id) {
        List<BankAnswer> listAnswer = new ArrayList<>();
        String sql = "SELECT * FROM bank_answer ba\n" +
                "JOIN bank_question bq ON ba.bank_question_id = bq.bank_question_id " +
                "where bq.bank_question_id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, bank_question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankAnswer bankAnswer = new BankAnswer();
                bankAnswer.setBank_answer_id(rs.getInt("bank_answer_id"));
                bankAnswer.setAnswer(rs.getString("answer"));
                bankAnswer.setStatus(rs.getInt("status"));
                BankQuestion bankQuestion = new BankQuestion();
                bankQuestion.setBank_question_id(rs.getInt("bank_question_id"));
                bankQuestion.setQuestion(rs.getString("question"));
                bankQuestion.setType_question(rs.getInt("type_question"));
                bankQuestion.setCreated_by(rs.getString("created_by"));
                bankQuestion.setCourse_id(rs.getInt("course_id"));
                bankAnswer.setBankQuestion(bankQuestion);
                listAnswer.add(bankAnswer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listAnswer;
    }
    public int getTotalBankQuestion(String course_id) {
        try {
            String sql = "SELECT COUNT(*) FROM bank_question WHERE course_id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,course_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<BankQuestion> pagingBankQuestion (int index, String course_id) {
        List<BankQuestion> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM bank_question q\n" +
                "WHERE course_id = ? " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setInt(2, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion bq = new BankQuestion();
                bq.setBank_question_id(rs.getInt("bank_question_id"));
                bq.setQuestion(rs.getString("question"));
                bq.setType_question(rs.getInt("type_question"));
                bq.setCreated_by(rs.getString("created_by"));
                bq.setCourse_id(rs.getInt("course_id"));
                listQuestion.add(bq);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

    public int getTotalBankQuestionByTypeQuestion(String course_id,String type_question) {
        try {
            String sql = "SELECT COUNT(*) FROM bank_question WHERE course_id = ? AND type_question = ? ";
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

    public List<BankQuestion> pagingBankQuestionByTypeQuestion (int index, String course_id,String type_question) {
        List<BankQuestion> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM bank_question q\n" +
                "WHERE course_id = ? AND type_question = ? " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2,type_question);
            statement.setInt(3, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion bq = new BankQuestion();
                bq.setBank_question_id(rs.getInt("bank_question_id"));
                bq.setQuestion(rs.getString("question"));
                bq.setType_question(rs.getInt("type_question"));
                bq.setCreated_by(rs.getString("created_by"));
                bq.setCourse_id(rs.getInt("course_id"));
                listQuestion.add(bq);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }
    public int getTotalBankQuestionBySearch(String course_id,String search) {
        try {
            String sql = "SELECT COUNT(*) FROM bank_question WHERE course_id = ? AND question like ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, "%"+search+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<BankQuestion> pagingListBankQuestionBySearch(int index,String question,String course_id) {
        List<BankQuestion> listQuestion = new ArrayList<>();
        String sql = "SELECT * FROM bank_question q\n" +
                "WHERE q.course_id = ?  AND q.question like ? " +
                "ORDER BY q.bank_question_id DESC " +
                "LIMIT 5 OFFSET ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, course_id);
            statement.setString(2, "%" + question + "%");
            statement.setInt(3, (index-1)*5);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion bankQuestion = new BankQuestion();
                bankQuestion.setBank_question_id(rs.getInt(1));
                bankQuestion.setQuestion(rs.getString(2));
                bankQuestion.setType_question(rs.getInt(3));
                bankQuestion.setCreated_by(rs.getString(4));
                bankQuestion.setCourse_id(rs.getInt(5));
                bankQuestion.setStatus(rs.getInt(6));
                listQuestion.add(bankQuestion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listQuestion;
    }

//    public int getTotalBankQuestionByTypeQuestion(String type_question,String exercise_id) {
//        try {
//            String sql = "SELECT COUNT(*) FROM question WHERE type_question = ? AND exercise_id = ?";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setString(1, type_question);
//            statement.setString(2, exercise_id);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()){
//                return rs.getInt(1);
//            }
//        }  catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;
//    }
    public BankQuestion getBankQuestionByQuestion (String question) {
        String sql = "SELECT * " +
                "FROM bank_question " +
                "WHERE question like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankQuestion q = new BankQuestion();
                q.setBank_question_id(rs.getInt("bank_question_id"));
                q.setQuestion(rs.getString("question"));
                q.setType_question(rs.getInt("type_question"));
                q.setCreated_by(rs.getString("created_by"));
                q.setCourse_id(rs.getInt("course_id"));
                return q;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }

    public void insertQuestionBank(String question,int type_question,String created_by,int course_id) {
        String sql = "INSERT INTO bank_question (question,type_question,created_by,course_id,status) " +
                "VALUES (?, ?, ?,?,0)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.setInt(2, type_question);
            statement.setString(3, created_by);
            statement.setInt(4, course_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getBankQuestion_id() {
        String sql = "SELECT bank_question_id FROM bank_question ORDER BY bank_question_id DESC LIMIT 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("bank_question_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void insertAnswerBank(String answer,int status,int bank_question_id) {
        String sql = "INSERT INTO bank_answer (answer,status,bank_question_id) " +
                "VALUES (?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, answer);
            statement.setInt(2, status);
            statement.setInt(3, bank_question_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteQuestion(String question) {
        String sql = "DELETE FROM bank_question WHERE question like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<BankAnswer> getListAnswerByQuestionId (String question_id) {
        List<BankAnswer> listAnswer = new ArrayList<>();
        String sql = "SELECT * FROM bank_answer q\n" +
                "where bank_question_id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BankAnswer answer = new BankAnswer();
                answer.setBank_answer_id(rs.getInt("bank_answer_id"));
                answer.setAnswer(rs.getString("answer"));
                answer.setStatus(rs.getInt("status"));
                listAnswer.add(answer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  listAnswer;
    }


    @Override
    public ArrayList<BankQuestion> list() {
        return null;
    }

    @Override
    public void insert(BankQuestion entity) {

    }

    @Override
    public void update(BankQuestion entity) {

    }

    @Override
    public void delete(BankQuestion entity) {

    }

    @Override
    public BankQuestion get(int id) throws SQLException {
        return null;
    }
}
