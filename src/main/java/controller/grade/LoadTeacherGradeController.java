package controller.grade;

import com.google.gson.Gson;
import dal.AccountDBContext;
import dal.GroupDBContext;
import dal.MarkDBContext;
import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Group;
import model.Mark;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/loadTeacherGrade")
public class LoadTeacherGradeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) req.getSession().getAttribute("account");
        AccountDBContext accDB = new AccountDBContext();
        String tid = accDB.getIdUserByAccountId(acc.getId());
        Map<String, Object> responseData = new HashMap<>();
        String sesid = req.getParameter("sesid");
        GroupDBContext gDB = new GroupDBContext();
        MarkDBContext mDB = new MarkDBContext();
        if (sesid!=null){
            int ses = Integer.parseInt(sesid);
            ArrayList<Group> groups = gDB.getGroupForTeacherByTidSemester(tid, ses);
            responseData.put("groups", groups);
        }
        String gid = req.getParameter("gid");
            responseData.put("test", gid);
        if (gid!=null){
            int g = Integer.parseInt(gid);
            boolean locked = gDB.lockedGroup(g);
            responseData.put("locked", locked);
            ArrayList<Mark> marks = mDB.getMarkForTeacherByTidSemesterGid(tid, Integer.parseInt(sesid),g);
            responseData.put("marks", marks);
        }
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
