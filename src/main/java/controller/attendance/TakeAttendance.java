package controller.attendance;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Attendance;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/teacher/takeAttendance")
public class TakeAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("sesid"));
        AttendanceDBContext attdb = new AttendanceDBContext();
        ArrayList<Attendance> attendances = attdb.getAttendancesForTeacher(sesid);
        req.setAttribute("lock", attendances.get(0).getSession().isLock());
        req.setAttribute("sesid", sesid);
        req.setAttribute("attendances", attendances);
        req.getRequestDispatcher("../views/attendance/attendance.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("sesid"));
        AttendanceDBContext attdb = new AttendanceDBContext();
        ArrayList<Attendance> attendances = attdb.getAttendancesForTeacher(sesid);
        SessionDBContext sesdb = new SessionDBContext();
        for (Attendance att : attendances) {
            String present = req.getParameter("present" + att.getStudent().getId());
            Boolean pre = present.equals("yes");
            String description = req.getParameter("description" + att.getStudent().getId());
            req.setAttribute("test", description);
            if (sesdb.getIsTakenSession(sesid)) {
                if (!description.equals(att.getDescription()) || pre != att.isPresent()) {
                    attdb.update(description, sesid, att.getStudent().getId(), pre);
                }
            } else {
                attdb.add(description, sesid, att.getStudent().getId(), pre);
            }
        }
        sesdb.updateIsTakenSession(sesid);
        ArrayList<Attendance> newAttendances = attdb.getAttendancesForTeacher(sesid);
        req.setAttribute("sesid", sesid);
        req.setAttribute("attendances", newAttendances);
        req.getRequestDispatcher("../views/attendance/attendance.jsp").forward(req, resp);
    }
}
