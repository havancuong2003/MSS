package controller.grade;

import com.google.gson.Gson;
import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/student/viewgrade")
public class StudentViewGradeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) req.getSession().getAttribute("account");
        AccountDBContext accDB = new AccountDBContext();
        String sid = accDB.getIdUserByAccountId(acc.getId());
        SemesterDBContext seDB = new SemesterDBContext();
        req.setAttribute("semester", seDB.getSemesterForStudent(sid));
        req.getRequestDispatcher("/views/grade/studentGrade.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) req.getSession().getAttribute("account");
        AccountDBContext accDB = new AccountDBContext();
        String sid = accDB.getIdUserByAccountId(acc.getId());
        String sesid = req.getParameter("sesid");
        Map<String, Object> responseData = new HashMap<>();
        SemesterDBContext seDB = new SemesterDBContext();
        GroupDBContext gDB = new GroupDBContext();
        MarkDBContext mDB = new MarkDBContext();
        TotalDBContext tDB = new TotalDBContext();
        if (sesid != null){
            int ses = Integer.parseInt(sesid);
            ArrayList<Group> groups = gDB.getGroupForStudentBySidAndSemester(sid, ses);
            responseData.put("groups", groups);
        }
        String groupid = req.getParameter("gid");
        if (groupid != null){
            int gid = Integer.parseInt(groupid);
            ArrayList<Mark> marks = mDB.getMarkForStudent(sid, gid, Integer.parseInt(sesid));
            responseData.put("marks", marks);
            Total total = tDB.getTotalBySidAndGid(sid, gid);
            responseData.put("total", total);
        }

        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);

    }
}
