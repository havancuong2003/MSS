package controller.attendance;

import dal.AttendanceDBContext;
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
        req.setAttribute("sesid", sesid);
        req.setAttribute("attendances", attendances);
        req.getRequestDispatcher("../views/attendance/attendance.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
