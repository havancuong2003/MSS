package controller.admin.createGroup;

import dal.CourseDBContext;
import dal.GroupDBContext;
import dal.SlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Group;
import model.Student;
import model.TimeSlot;
import util.CreateGroupHelper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/createGroup")
public class CreateGroup extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupDBContext gdbc = new GroupDBContext();
        ArrayList<Group> groups = gdbc.getGroupBySemester(1);
        req.setAttribute("groups", groups);
        req.setAttribute("registers", gdbc.getInfoRegisterCourse(1));
        req.setAttribute("isCreate", gdbc.getStatusCreateGroup(1));
        req.getRequestDispatcher("../views/admin/createGroup/createGroup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String isCreate = req.getParameter("isCreate");
        try {
            if (isCreate.equals("true")) {
                GroupDBContext g = new GroupDBContext();
                g.deleteEnrollment(1);
                g.deleteGroup(1);
                g.setIsCreateIsFalse(1);
                CreateGroupHelper.allocateClasses();
            } else {

                CreateGroupHelper.allocateClasses();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("createGroup");
    }


}
