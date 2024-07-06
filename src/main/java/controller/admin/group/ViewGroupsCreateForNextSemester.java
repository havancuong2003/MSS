package controller.admin.group;

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

@WebServlet(value = "/admin/viewGroup")
public class ViewGroupsCreateForNextSemester extends HttpServlet {
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
            ArrayList<Group> groups = gdbc.getGroupBySemester(nextSemester.getId());
            req.setAttribute("groups", groups);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("../views/admin/group/viewGroupCreate.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
