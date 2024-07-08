package controller.student;

import com.google.gson.Gson;
import dal.ChangeGroupDBContext;
import dal.GroupDBContext;
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
        ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
        GroupDBContext gdb = new GroupDBContext();

        String id = req.getParameter("requestId");

        cgdb.deleteRequired(id);

        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");


        ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(), currentSemester);
        ArrayList<ChangeGroup> allRequiredFromSomeOne = cgdb.getAllRequiredToSwap(account.getUsername(), currentSemester);


        Map<String, Object> responseData = new HashMap<>();



        responseData.put("allRequiredFromSomeOne", allRequiredFromSomeOne);
        responseData.put("allRequired", allRequired);
        responseData.put("groups",gdb.getGroupForStudent(3,account.getUsername()));
        String json = new Gson().toJson(responseData);

        resp.getWriter().write(json);

    }
}
