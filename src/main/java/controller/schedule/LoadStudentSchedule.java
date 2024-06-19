package controller.schedule;

import com.google.gson.Gson;
import dal.AccountDBContext;
import dal.AttendanceDBContext;
import dal.SlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Attendance;
import model.Slot;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/loadStudentSchedule")
public class LoadStudentSchedule extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String days = req.getParameter("days");
        String fday = req.getParameter("fday");
        String lday = req.getParameter("lday");
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String[] dayArr = days.split(",");
        ArrayList<Date> date = new ArrayList<>();
        for (int i = 0; i < dayArr.length; i++) {
            date.add(java.sql.Date.valueOf(dayArr[i]));
        }
        AttendanceDBContext attDB = new AttendanceDBContext();
        SlotDBContext sldb =  new SlotDBContext();
        AccountDBContext accdb = new AccountDBContext();
        Account acc = (Account) req.getSession().getAttribute("account");
        ArrayList<Attendance> attendances = attDB.getAttendanceForStudent(accdb.getIdUserByAccountId(acc.getId()), java.sql.Date.valueOf(fday), java.sql.Date.valueOf(lday));
        ArrayList<Slot> slots = sldb.getSlots();
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("attendances", attendances);
        responseData.put("slots", slots);
        responseData.put("date", date);
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
