package controller.exercise;

import dal.PracticeDBContext;
import dal.TestDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Answer;
import model.QuestionDetail;
import model.QuestionSubmission;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name="viewhistorytest",value = "/student/viewhistorytest")
public class ViewHistoryTest extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// lấy ds các câu hỏi và câu trả lời đã nộp
        int historyId = Integer.parseInt(req.getParameter("historyId"));
        TestDBContext db = new TestDBContext();
        ArrayList<QuestionSubmission> questionSubmissions = db.getAllQuestionSubmissionByHistory(historyId);
        for (QuestionSubmission question: questionSubmissions ){
            ArrayList<Answer> ans = db.getAllAnswerByQuestionId(question.getQuestion().getQuestion_id());
            question.setAnswers(ans);
        }
        int score = db.getScoreByHistory(historyId);
        req.setAttribute("score", score);
        req.setAttribute("questionSubmissions",questionSubmissions);
        req.setAttribute("size", questionSubmissions.size());
        req.getRequestDispatcher("../views/exercise/viewhistorytest.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }
}
