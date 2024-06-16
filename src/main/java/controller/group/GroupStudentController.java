package controller.group;

import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

@WebServlet("/student/groupList")
public class GroupStudentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupDBContext groupDBContext = new GroupDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        req.setAttribute("groups", groupDBContext.getGroupForStudent(1, account.getUsername()));
        req.getRequestDispatcher("../views/group/groupStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
