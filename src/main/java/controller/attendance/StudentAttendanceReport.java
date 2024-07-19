package controller.attendance;

import com.google.gson.Gson;
import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Attendance;
import model.Group;
import model.Mark;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/student/attendancereport")
public class StudentAttendanceReport extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) req.getSession().getAttribute("account");
        AccountDBContext accDB = new AccountDBContext();
        String sid = accDB.getIdUserByAccountId(acc.getId());
        SemesterDBContext seDB = new SemesterDBContext();
        req.setAttribute("semester", seDB.getSemesterForStudent(sid));
        req.getRequestDispatcher("/views/attendance/studentAttendanceReport.jsp").forward(req, resp);
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
        AttendanceDBContext aDB = new AttendanceDBContext();
        if (sesid != null) {
            int ses = Integer.parseInt(sesid);
            ArrayList<Group> groups = gDB.getGroupForStudentBySidAndSemester(sid, ses);
            responseData.put("groups", groups);
        }
        String groupid = req.getParameter("gid");
        if (groupid != null) {
            int gid = Integer.parseInt(groupid);
            ArrayList<Attendance> attendances = aDB.getAttendanceReportForStudent(sid, gid);
            responseData.put("attendances", attendances);
        }

        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);

    }
}

