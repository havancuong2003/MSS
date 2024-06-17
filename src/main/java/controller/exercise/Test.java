package controller.exercise;

import dal.PracticeDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.QuestionDetail;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="test",value = "/test")
public class Test extends HttpServlet {
    private static ArrayList<QuestionDetail> questionDetail = new ArrayList<>();
    private static ArrayList<Integer> listanswer = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PracticeDBContext context = new PracticeDBContext();
        int exerciseId = Integer.parseInt(req.getParameter("exerciseId"));
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        questionDetail = context.getAllQuestionDetailByExerciseIdAndCourseId(exerciseId, courseId);
        for (int i = 0; i < questionDetail.size(); i++ ){
            listanswer.add(0);
        }
        req.setAttribute("questionDetails",questionDetail);
        req.setAttribute("size", questionDetail.size());
        req.setAttribute("listanswer", listanswer);
        req.getRequestDispatcher("views/exercise/taketest.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("questionIndex") != null && request.getParameter("choosenAnswer") != null){
            int questionIndex = Integer.parseInt(request.getParameter("questionIndex"));
            int choosenAnswer = Integer.parseInt(request.getParameter("choosenAnswer"));
            listanswer.set(questionIndex, choosenAnswer);
        }

        String option = request.getParameter("option");

        if (option != null && option.equals("finish")) {
            int result = Result();
            request.setAttribute("size", questionDetail.size());
            request.setAttribute("result", result);
            listanswer.clear();
            request.getRequestDispatcher("result").forward(request, response);
        }

    }


    public static int Result(){
        int result  = 0;
        int answer = 0;
        for (int i = 0; i < questionDetail.size(); i++) {
            int actual = listanswer.get(i);
            for(int j = 0; j < questionDetail.get(i).getAnswers().size(); j++){
                if(questionDetail.get(i).getAnswers().get(j).getStatus() == 1 && (j + 1) == actual){
                    result = result + 1;
                }
            }
        }
        return result;
    }
}
