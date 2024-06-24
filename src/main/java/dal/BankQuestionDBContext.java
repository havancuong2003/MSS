package dal;

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
