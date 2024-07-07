package controller.student;

import dal.ChangeGroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ChangeGroup;
import util.GetCurrentTerm;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/student/changeGroup")
public class ChangeGroupController extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(),currentSemester);
        req.setAttribute("allRequired", allRequired);
        req.setAttribute("sizeRequired", allRequired.size());
        req.setAttribute("s",currentSemester);

        req.getRequestDispatcher("../views/Student/changeGroup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
