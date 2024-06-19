package controller.exercise;

import dal.PracticeDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Exercise;
import model.History;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="detailassignment",value = "/detailassignment")
public class DetailAssignment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        PracticeDBContext db = new PracticeDBContext();
        ArrayList<Exercise> listExercise = db.getAllExerciseByCourseId(courseId);
        for (int i = 0; i < listExercise.size(); i++){
            ArrayList<History> hs = db.getAllHistoryByExerciseId(listExercise.get(i).getExerciseId());
            listExercise.get(i).setHistories(hs);
        }
        req.setAttribute("listExercise", listExercise);
        req.getRequestDispatcher("/views/exercise/detailassignment.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
