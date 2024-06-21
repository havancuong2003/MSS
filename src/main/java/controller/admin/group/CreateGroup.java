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
import util.CreateGroupHelper;
import util.GetCurrentTerm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/createGroup")
public class CreateGroup extends HttpServlet {

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
            req.setAttribute("isCreate", gdbc.getStatusCreateGroup(semester.getNextSemesterID()));
            req.setAttribute("registers", gdbc.getInfoRegisterCourse(nextSemester.getId()));


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        req.getRequestDispatcher("../views/admin/group/createGroup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String isCreate = req.getParameter("isCreate");
        String studentPerGroup_raw = req.getParameter("studentPerGroup");

        try {
            int studentPerGroup = Integer.parseInt(studentPerGroup_raw);
            if (isCreate.equals("true")) {
                GroupDBContext g = new GroupDBContext();
                SemesterDBContext s = new SemesterDBContext();
                Semester semester = s.get(currentSemester);
                g.deleteEnrollment(semester.getNextSemesterID());
                g.deleteGroup(semester.getNextSemesterID());
                g.setIsCreateIsFalse(semester.getNextSemesterID());
                CreateGroupHelper.allocateClasses(studentPerGroup);
            } else {

                CreateGroupHelper.allocateClasses(studentPerGroup);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("viewGroup");
    }


}
