package controller.curriculum;

import dal.MajorDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddCourseToCurriculum", value = "/addCourseToCurriculum")
public class AddCourseToCurriculumController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rawMajorId = req.getParameter("major");
        if (rawMajorId == null || rawMajorId.isEmpty()) {
            req.setAttribute("ms", "You have to choose a major first!");
        }else {
            int majorId = Integer.parseInt(rawMajorId);
            req.setAttribute("mid", majorId);
        }
        MajorDBContext mdb = new MajorDBContext();
        req.setAttribute("majors", mdb.listAllMajor());
        req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
