package controller.curriculum;

import dal.CurriculumDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Term;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/student/viewCurriculum")
public class CurriculumController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CurriculumDBContext c = new CurriculumDBContext();
        try {
       ArrayList<Term> curriculum = c.getTermForCurriculum(1);
        req.setAttribute("terms", curriculum);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("../views/curriculum/curriculum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
