package controller.student;

import com.google.gson.Gson;
import dal.ChangeGroupDBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
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

@WebServlet("/student/acceptChange")
public class AcceptChange extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("application/json");
//        resp.setCharacterEncoding("UTF-8");
        ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
        GroupDBContext gdb = new GroupDBContext();
        StudentDBContext sdb = new StudentDBContext();
//


//
//
//        for (ChangeGroup changeGroup : allRequiredFromSomeOne) {
//
//        }
//
//        Map<String, Object> responseData = new HashMap<>();
//        responseData.put("allRequired", allRequired);
//        responseData.put("allRequiredFromSomeOne", allRequiredFromSomeOne);
//        String json = new Gson().toJson(responseData);
//
//        resp.getWriter().write(json);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Xử lý logic chấp nhận hoặc từ chối yêu cầu ở đây

        // Ví dụ: Lấy dữ liệu từ request
        String requestId = req.getParameter("requestId");
        String action = req.getParameter("action" + requestId);
        String fromStudentId = req.getParameter("fromST" + requestId);
        String fromGroupId = req.getParameter("fromGr" + requestId);
        String toStudentId = req.getParameter("toSt" + requestId);
        String toGroupId = req.getParameter("toGr" + requestId);

        cgdb.changeGroup(fromStudentId, Integer.parseInt(fromGroupId), toStudentId, Integer.parseInt(toGroupId), Integer.parseInt(requestId));
        cgdb.deleteRequired(requestId);
        // Trả về dữ liệu JSON nếu cần
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");


        ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(), currentSemester);
        Map<String, Object> responseData = new HashMap<>();

        ArrayList<ChangeGroup> allRequiredFromSomeOne = cgdb.getAllRequiredToSwap(account.getUsername(), currentSemester);

        responseData.put("allRequiredFromSomeOne", allRequiredFromSomeOne);
        responseData.put("allRequired", allRequired);
        responseData.put("groups",gdb.getGroupForStudent(1,account.getUsername()));
        String json = new Gson().toJson(responseData);

        resp.getWriter().write(json);

    }
}
