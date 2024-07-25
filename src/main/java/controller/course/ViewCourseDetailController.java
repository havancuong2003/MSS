package controller.course;

import dal.GradeItemDBContext;
import dal.GradeCategoryDBContext;
import dal.CourseDBContext;
import model.Assessment;
import model.Category;
import model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="viewCourse", value = "/admin/viewCourse")
public class ViewCourseDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id")) ;
        CourseDBContext cdb = new CourseDBContext();
        Course course = cdb.getCourseByID(id);
        if (course == null||course.getDetail()==null||course.getCode()==null) {
            req.setAttribute("exist",false);
            req.setAttribute("ms","Course does not exist. View course failed!");
            req.getRequestDispatcher("../views/course/detail.jsp").forward(req,resp);
            return;
        }
        GradeCategoryDBContext cateDB = new GradeCategoryDBContext();
        ArrayList<Category> categories = cateDB.getAllCategory();
        ArrayList<Category> cate = new ArrayList<>();
        for (Category c : categories){
            if (c.getCourse().getId()==id) {
                cate.add(c);
            }
        }
        GradeItemDBContext assDB = new GradeItemDBContext();
        for (Category c :cate ){
            ArrayList<Assessment> assessments = assDB.getAssessment(c.getId());
            c.setAssessments(assessments);
            c.setCount(assessments.size());
            c.setFitemID(assessments.get(0).getId());
        }
        req.setAttribute("course",course);
        req.setAttribute("cates", cate);
        req.setAttribute("id",id);
        req.setAttribute("exist",true);
        req.getRequestDispatcher("../views/course/detail.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
