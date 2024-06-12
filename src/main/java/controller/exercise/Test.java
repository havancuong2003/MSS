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
    private static int indexquestion = 0;
    private static ArrayList<Integer> listanswer = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PracticeDBContext context = new PracticeDBContext();
        questionDetail = context.getAllQuestionDetailByExerciseIdAndCourseId(1, 1);
        for (int i = 0; i < questionDetail.size(); i++ ){
            listanswer.add(0);
        }
        req.setAttribute("choosenAnswer", listanswer.get(indexquestion));
        req.setAttribute("question", questionDetail.get(indexquestion));
        req.setAttribute("size", questionDetail.size());
        req.setAttribute("current", indexquestion);
        req.getRequestDispatcher("views/exercise/taketest.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        int choosenAnswer = Integer.parseInt(request.getParameter("choosenAnswer"));
        if(option.equals("finish")){
            listanswer.set(indexquestion, choosenAnswer);
            int result = Result();
            request.setAttribute("size", questionDetail.size());
            request.setAttribute("result", result);
            listanswer.clear();
            indexquestion = 0;
            request.getRequestDispatcher("result").forward(request, response);
        }
        if (option.equals("next")) {
            listanswer.set(indexquestion, choosenAnswer);
            if(indexquestion == questionDetail.size() - 1){
                request.setAttribute("msg", "There is no more question");
            }else{
                indexquestion++;
            }
        }else{
            listanswer.set(indexquestion, choosenAnswer);
            if(indexquestion == 0){
                request.setAttribute("msg", "There is no question owr ddanwfg trc");
            }else{
                indexquestion--;
            }
        }
        request.setAttribute("choosenAnswer", listanswer.get(indexquestion));
        request.setAttribute("size", questionDetail.size());
        request.setAttribute("current", indexquestion);
        request.setAttribute("question", questionDetail.get(indexquestion));
        request.setAttribute("listanswer", listanswer);
        request.getRequestDispatcher("views/exercise/practice.jsp").forward(request, response);

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
