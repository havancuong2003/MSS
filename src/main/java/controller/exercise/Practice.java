package controller.exercise;

import dal.PracticeDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Answer;
import model.QuestionDetail;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="practice",value = "/practice")
public class Practice extends HttpServlet {
    private static ArrayList<QuestionDetail> questionDetail = new ArrayList<>();
    private static int indexquestion = 0;
    private static ArrayList<Integer> listanswer = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        questionDetail.add(new QuestionDetail(1, "What is the capital of France?", "Berlin", "Madrid", "Paris", "Rome", "C", "Paris is the capital of France."));
//        questionDetail.add(new QuestionDetail(2, "What is 2 + 2?", "3", "4", "5", "6", "B", "2 + 2 is 4."));
//        questionDetail.add(new QuestionDetail(3, "What is the largest planet in our solar system?", "Earth", "Mars", "Jupiter", "Saturn", "C", "Jupiter is the largest planet in our solar system."));req.setAttribute("questionDetail", questionDetail.get(indexquestion));
//        questionDetail.add(new QuestionDetail(4, "What is the capital of Japan?", "Beijing", "Seoul", "Tokyo", "Bangkok", "C", "Tokyo is the capital of Japan."));
//        questionDetail.add(new QuestionDetail(5, "What is the largest ocean in the world?", "Atlantic", "Arctic", "Indian", "Pacific", "D", "The Pacific Ocean is the largest ocean in the world."));
//        questionDetail.add(new QuestionDetail(6, "What is the chemical symbol for water?", "H", "O", "W", "H2O", "D", "The chemical symbol for water is H2O."));
//        questionDetail.add(new QuestionDetail(7, "Which planet is known as the Red Planet?", "Mercury", "Venus", "Mars", "Neptune", "C", "Mars is known as the Red Planet."));
//        questionDetail.add(new QuestionDetail(8, "What is the main component of air?", "Oxygen", "Carbon dioxide", "Nitrogen", "Hydrogen", "C", "The main component of air is Nitrogen."));
//        questionDetail.add(new QuestionDetail(9, "Who wrote the play 'Romeo and Juliet'?", "William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain", "A", "William Shakespeare wrote the play 'Romeo and Juliet'."));
//        questionDetail.add(new QuestionDetail(10, "What is the largest mammal in the world?", "Elephant", "Giraffe", "Blue whale", "Lion", "C", "The largest mammal in the world is the Blue whale."));
//        questionDetail.add(new QuestionDetail(11, "What is the hardest natural substance on Earth?", "Diamond", "Gold", "Platinum", "Silver", "A", "Diamond is the hardest natural substance on Earth."));
//        questionDetail.add(new QuestionDetail(12, "Which country is known as the Land of the Rising Sun?", "China", "South Korea", "Japan", "Vietnam", "C", "Japan is known as the Land of the Rising Sun."));
//        questionDetail.add(new QuestionDetail(13, "What is the chemical symbol for gold?", "Au", "Ag", "G", "H2O", "A", "The chemical symbol for gold is Au."));

        PracticeDBContext context = new PracticeDBContext();
        questionDetail = context.getAllQuestionDetailByExerciseIdAndCourseId(1, 1);
        for (int i = 0; i < questionDetail.size(); i++ ){
            listanswer.add(0);
        }
//        if(questionDetail.size() > 13){
//            questionDetail = new ArrayList<>(questionDetail.subList(0, 13));
//            listanswer = new ArrayList<>(listanswer.subList(0, 13));
//        }
        req.setAttribute("choosenAnswer", listanswer.get(indexquestion));
        req.setAttribute("question", questionDetail.get(indexquestion));
        req.setAttribute("size", questionDetail.size());
        req.setAttribute("current", indexquestion);
        req.getRequestDispatcher("views/exercise/practice.jsp").forward(req, resp);
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
