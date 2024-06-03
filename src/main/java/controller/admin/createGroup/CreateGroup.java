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
import model.Student;
import model.TimeSlot;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/createGroup")
public class CreateGroup extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        req.getRequestDispatcher("../views/admin/createGroup/createGroup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


}
