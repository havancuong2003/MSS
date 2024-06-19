package controller.curriculum;

import com.google.gson.Gson;
import com.fasterxml.jackson.databind.ObjectMapper;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "LoadCourse", value = "/loadCourse")
public class LoadCourseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String codeCourse = req.getParameter("codeCourse");
//        String mid = req.getParameter("mid");
        CourseDBContext cdb = new CourseDBContext();
        PrintWriter out = resp.getWriter();
        ArrayList<Course> courses = cdb.searchCourse(codeCourse);
        Gson gson = new Gson();
        String JsonString = gson.toJson(courses);
        resp.getWriter().write(JsonString);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
