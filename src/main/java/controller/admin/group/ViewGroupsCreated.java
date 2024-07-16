package controller.admin.group;

import com.google.gson.Gson;
import dal.GroupDBContext;
import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Group;
import model.Semester;
import util.GetCurrentTerm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(value = "/admin/viewGroup")
public class ViewGroupsCreated extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupDBContext gdbc = new GroupDBContext();


        SemesterDBContext sdbc = new SemesterDBContext();
        try {
            Semester semester = sdbc.get(currentSemester);
            Semester nextSemester = sdbc.get(semester.getNextSemesterID());
            req.setAttribute("currentSemester", semester);
            req.setAttribute("nextSemester", nextSemester);
            ArrayList<Group> groups = gdbc.getGroupBySemester(currentSemester);
            req.setAttribute("semesters", sdbc.list());
            req.setAttribute("groups", groups);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("../views/admin/group/viewGroupCreate.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        GroupDBContext gdbc = new GroupDBContext();
       String id = req.getParameter("semesterId");
        Map<String,Object> responseData = new HashMap<>();
        int semesterId = Integer.parseInt(id);
        ArrayList<Group> groups = gdbc.getGroupBySemester(semesterId);
        responseData.put("groups", groups);
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);
    }
}
