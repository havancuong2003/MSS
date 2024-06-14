package controller.curriculum;

import com.google.gson.Gson;
import dal.CourseDBContext;
import dal.CurriculumDBContext;
import dal.PrequisiteCourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Curriculum;
import model.PrequisiteCourse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "LoadCourseCur", value = "/loadCourseCur")
public class LoadCourseCurController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String codeCourse = req.getParameter("codeCourse");
        PrequisiteCourseDBContext pdb = new PrequisiteCourseDBContext();
        ArrayList<PrequisiteCourse> preList = pdb.getPrequisiteCourseList();
        CourseDBContext cdb = new CourseDBContext();
        ArrayList<Course> courses = cdb.searchCourse(codeCourse);
        for (Course c : courses) {
            String pre = "";
            for (PrequisiteCourse pc : preList) {
                if (c.getId() == pc.getCourse().getId()) {
                    pre+= pc.getPreCourse().getCode() + " ";
                }
            }
            c.setPreCoursesString(pre);
        }
        Gson gson = new Gson();
        String json = gson.toJson(courses);
        PrintWriter out = resp.getWriter();
        out.print(json);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
