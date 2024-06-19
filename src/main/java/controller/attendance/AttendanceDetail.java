package controller.attendance;

import dal.AccountDBContext;
import dal.AttendanceDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Attendance;

import java.io.IOException;

@WebServlet("/student/attendanceDetail")
public class AttendanceDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sesid = req.getParameter("id");
        AttendanceDBContext attdb = new AttendanceDBContext();
        AccountDBContext accdb = new AccountDBContext();
        Account acc = (Account) req.getSession().getAttribute("account");
        Attendance att = attdb.getAttendance(Integer.parseInt(sesid), accdb.getIdUserByAccountId(acc.getId()));
        req.setAttribute("attendance", att);
        req.getRequestDispatcher("../views/attendance/attendanceDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
