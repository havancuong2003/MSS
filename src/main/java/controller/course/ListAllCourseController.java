package controller.course;

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
}
