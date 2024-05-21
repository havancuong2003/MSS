package controller.course;

import dal.AssessmentDBContext;
import dal.CategoryDBContext;
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
import java.sql.Array;
import java.util.ArrayList;

@WebServlet(name="addCourse",value = "/addCourse")
public class AddCourseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/course/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String detail = req.getParameter("detail");
        Course course = new Course();
        course.setCode(code);
        course.setDetail(detail);
        int total = 0;
        AssessmentDBContext assDB = new AssessmentDBContext();
        CategoryDBContext catDB = new CategoryDBContext();
        CourseDBContext courseDB = new CourseDBContext();
        ArrayList<Course> courses = courseDB.getCourseList();
        for (Course c : courses) {
            if (c.getCode().equals(code)||c.getDetail().equals(detail)) {
                req.setAttribute("ms","This course already exists. Add course failed!");
                req.getRequestDispatcher("views/course/add.jsp").forward(req, resp);
                return;
            }
        }
        ArrayList<Category> categories = new ArrayList<>();
        ArrayList<Assessment> assessments = new ArrayList<>();
        for (int i = 1; i <= 20; i++) {
            String cate = req.getParameter("cate" + i);
            if (cate==null||cate.isEmpty()||cate.isBlank()) {
                break;
            }
            else {
                Category category = new Category();
                category.setCategoryName(cate);
                category.setCourse(course);
                categories.add(category);
                String[] asscates = req.getParameterValues("asscate" + i);
                String[] weicates = req.getParameterValues("weicate" + i);
                ArrayList<Integer> weis = new ArrayList<>();
                for (int j = 0; j < weicates.length; j++) {
                    weis.add(Integer.parseInt(weicates[j]));
                    Assessment ass = new Assessment();
                    ass.setCategory(category);
                    ass.setItem(asscates[j]);
                    ass.setWeight(weis.get(j));
                    assessments.add(ass);
                    total+=weis.get(j);
                }

            }
        }
        if (total!=100){
            req.setAttribute("ms","The total weight of assessment have to be equal to 1! Add course failed!");
        }else {
            courseDB.addCourse(course);
            ArrayList<Course> courses1 =  courseDB.getCourseList();
            int id =0;
            for (Course c : courses1) {
                if (c.getCode().equals(code)||c.getDetail().equals(detail)) {
                    id = c.getId();
                }
            }
            for(Category c : categories){
                catDB.add(c,id);
                ArrayList<Category> categories1 = catDB.getAllCategory();
                for(Assessment a : assessments){
                    int id1 = 0;
                    for (Category c1 : categories1) {
                        if (c1.getCategoryName().equals(a.getCategory().getCategoryName())){
                            id1 = c1.getId();
                        }
                    }
                    if (a.getCategory().getCategoryName().equals(c.getCategoryName())){
                        assDB.add(a,id1);
                    }
                }
            }
            req.setAttribute("ms", "Course added successfully!");
        }
        req.getRequestDispatcher("views/course/add.jsp").forward(req, resp);
    }
}
