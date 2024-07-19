package controller.student;

import com.google.gson.Gson;
import dal.ChangeGroupDBContext;
import dal.GroupDBContext;
import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ChangeGroup;
import model.Semester;
import util.GetCurrentTerm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/student/deleteRequest")
public class RemoveRequest extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        try {
            ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
            GroupDBContext gdb = new GroupDBContext();
            SemesterDBContext sdb = new SemesterDBContext();

            Semester semester = sdb.get(currentSemester);

            String id = req.getParameter("requestId");

            cgdb.deleteRequired(id);

            HttpSession session = req.getSession();
            Account account = (Account) session.getAttribute("account");


            ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(), semester.getNextSemesterID());
            ArrayList<ChangeGroup> allRequiredFromSomeOne = cgdb.getAllRequiredToSwap(account.getUsername(), semester.getNextSemesterID());


            Map<String, Object> responseData = new HashMap<>();


            responseData.put("allRequiredFromSomeOne", allRequiredFromSomeOne);
            responseData.put("allRequired", allRequired);
            responseData.put("groups", gdb.getGroupForStudent(1, account.getUsername()));
            String json = new Gson().toJson(responseData);

            resp.getWriter().write(json);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
