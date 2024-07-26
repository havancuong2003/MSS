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

@WebServlet("/loadSearchGrade")
public class LoadSearchUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String input = req.getParameter("search");
        AccountDBContext adb = new AccountDBContext();
        Account acc = adb.getIdBySearchGradeInput(input);
        Map<String, Object> responseData = new HashMap<>();
        TotalDBContext tDB = new TotalDBContext();
        if (acc.getRole_id() == 4){
            Student s = adb.getStudentByAccId(acc.getId(), acc.getRole_id());
            responseData.put("role", "student");
            responseData.put("student", s);
            SemesterDBContext seDB = new SemesterDBContext();
            responseData.put("semester", seDB.getSemesterForStudent(s.getId()));
            String sesid = req.getParameter("sesid");
            GroupDBContext gDB = new GroupDBContext();
            MarkDBContext mDB = new MarkDBContext();
            if (sesid != null){
                int ses = Integer.parseInt(sesid);
                ArrayList<Group> groups = gDB.getGroupForStudentBySidAndSemester(s.getId(), ses);
                responseData.put("groups", groups);
            }
            String groupid = req.getParameter("gid");
            if (groupid != null){
                int gid = Integer.parseInt(groupid);
                ArrayList<Mark> marks = mDB.getMarkForStudent(s.getId(), gid, Integer.parseInt(sesid));
                responseData.put("marks", marks);
                Total total = tDB.getTotalBySidAndGid(s.getId(), gid);
                responseData.put("total", total);
            }
        }else {
            Teacher t = adb.getTeacherByAccId(acc.getId(), acc.getRole_id());
            responseData.put("role", "teacher");
            responseData.put("teacher", t);
            SemesterDBContext seDB = new SemesterDBContext();
            responseData.put("semester", seDB.getSemesterForTeacher(t.getTid()));
            String sesid = req.getParameter("sesid");
            GroupDBContext gDB = new GroupDBContext();
            MarkDBContext mDB = new MarkDBContext();
            if (sesid!=null){
                int ses = Integer.parseInt(sesid);
                ArrayList<Group> groups = gDB.getGroupForTeacherByTidSemester(t.getTid(), ses);
                responseData.put("groups", groups);
            }
            String gid = req.getParameter("gid");
            responseData.put("test", gid);
            if (gid!=null){
                int g = Integer.parseInt(gid);
                ArrayList<Mark> marks = mDB.getMarkForTeacherByTidSemesterGid(t.getTid(), Integer.parseInt(sesid),g);
                responseData.put("marks", marks);

            }
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
