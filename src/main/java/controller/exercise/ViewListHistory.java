package controller.exercise;

import dal.TestDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Answer;
import model.History;
import model.QuestionSubmission;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="viewlisthistory",value = "/student/viewlisthistory")
public class ViewListHistory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String exerciseId = req.getParameter("exerciseId");
        String exName = req.getParameter("exName");
        TestDBContext con = new TestDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        ArrayList<History> list = con.getAllHistoryByStIdAndCourseId(account.getId() , Integer.parseInt(exerciseId));
        req.setAttribute("list", list);
        req.setAttribute("exName", exName);
        req.getRequestDispatcher("../views/exercise/listHistory.jsp").forward(req, resp);

    }
}
