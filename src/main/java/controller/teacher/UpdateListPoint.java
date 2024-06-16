package controller.teacher;

import dal.TeacherDBContext;
import dal.UpdatePointDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MarkData;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UpdateListPoint", value = "/updatelistpoint")

public class UpdateListPoint extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UpdatePointDBContext udb=new UpdatePointDBContext();
        MarkData markData=udb.getMarkDatabyId(id);
        req.setAttribute("markData",markData);
        req.getRequestDispatcher("views/teacher/updatelistpoint.jsp").forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String studentId = req.getParameter("studentid");
        String gradeCategoryName = req.getParameter("gradecategoryname");
        float gradeItemWeight = Float.parseFloat(req.getParameter("gradeitemweight"));
        float grade = Float.parseFloat(req.getParameter("grade"));
        String courseCode = req.getParameter("coursecode");
        String gradeItemName = req.getParameter("gradeitemname");
        MarkData m=new MarkData(id,studentId,gradeCategoryName, gradeItemWeight, grade, courseCode, gradeItemName);
        UpdatePointDBContext udb=new UpdatePointDBContext();
        udb.updateMarkData(m);
        resp.sendRedirect("teacherpoint");
    }
    }
