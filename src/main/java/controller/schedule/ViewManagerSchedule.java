package controller.schedule;

import com.google.gson.Gson;
import dal.AccountDBContext;
import dal.TeacherDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Teacher;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/manager/schedule")
public class ViewManagerSchedule extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        AccountDBContext adb = new AccountDBContext();
        req.setAttribute("role", adb.getRoleByRoleID(account.getRole_id()));
        req.getRequestDispatcher("../views/schedule/managerSchedule.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String search = req.getParameter("search");
        TeacherDBContext tdb = new TeacherDBContext();
        ArrayList<Teacher> teachers = tdb.searchTeacherByAccountFullNameOrId(search);
        Gson gson = new Gson();
        String json = gson.toJson(teachers);
        resp.getWriter().write(json);
    }
}
