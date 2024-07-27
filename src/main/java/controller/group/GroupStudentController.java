package controller.group;

import dal.ExerciseDBContext;
import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Exercise;
import util.GetCurrentTerm;

import java.io.IOException;

@WebServlet("/student/groupList")
public class GroupStudentController extends HttpServlet {
    private  final int currentSemester = GetCurrentTerm.currentSemester;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupDBContext groupDBContext = new GroupDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        req.setAttribute("groups", groupDBContext.getGroupForStudentById(currentSemester, account.getId()));
        req.getRequestDispatcher("../views/group/groupStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String groupId = req.getParameter("groupId");
        String groupName = req.getParameter("groupName");
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        ExerciseDBContext con = new ExerciseDBContext();
        if(!groupId.isEmpty() && groupId != null) {
            req.setAttribute("exercises", con.getListExercise(groupId));
        }
        req.setAttribute("groupId", groupId);
        req.setAttribute("groupName", groupName);
        req.getRequestDispatcher("../views/exercise/listExercise.jsp").forward(req, resp);


    }
}
