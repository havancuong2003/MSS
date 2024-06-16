package controller.teacher;

import dal.CourseDBContext;
import dal.TeacherDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse;
import model.MarkData;

import java.io.IOException;
import java.util.ArrayList;

    @WebServlet(name = "ListStudentPoint", value = "/teacherpoint")
public class ListStudentPointController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherDBContext tdb=new TeacherDBContext();
        ArrayList<MarkData> markList = tdb.getCourseList();
        req.setAttribute("markList", markList);
        req.getRequestDispatcher("/views/teacher/listpointforstudent.jsp").forward(req, resp);
    }
}
