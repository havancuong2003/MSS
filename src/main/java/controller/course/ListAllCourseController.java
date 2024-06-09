package controller.course;

import com.fasterxml.jackson.databind.ObjectMapper;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListAllCourse", value = "/listCourse")
public class ListAllCourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CourseDBContext dbContext = new CourseDBContext();
        ArrayList<Course> courses = dbContext.getCourseList();

        req.setAttribute("courses", courses);
        req.getRequestDispatcher("/views/course/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        CourseDBContext dbContext = new CourseDBContext();
        String searchCode = req.getParameter("searchCode");
        ArrayList<Course> courses = dbContext.searchByCode(searchCode);
        ObjectMapper objectMapper = new ObjectMapper();
        String JsonString = objectMapper.writeValueAsString(courses);
        resp.getWriter().write(JsonString);
    }
}