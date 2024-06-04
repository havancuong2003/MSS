package controller.exercise;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Question;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet(name="practice",value = "/practice")
public class Practice extends HttpServlet {
    private static ArrayList<Question> questions = new ArrayList<>();
    private static int indexquestion = 0;
    private static ArrayList<Integer> listanswer = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        questions.add(new Question(1, "What is the capital of France?", "Berlin", "Madrid", "Paris", "Rome", "C", "Paris is the capital of France."));
        questions.add(new Question(2, "What is 2 + 2?", "3", "4", "5", "6", "B", "2 + 2 is 4."));
        questions.add(new Question(3, "What is the largest planet in our solar system?", "Earth", "Mars", "Jupiter", "Saturn", "C", "Jupiter is the largest planet in our solar system."));req.setAttribute("questions", questions.get(indexquestion));
        questions.add(new Question(4, "What is the capital of Japan?", "Beijing", "Seoul", "Tokyo", "Bangkok", "C", "Tokyo is the capital of Japan."));
        questions.add(new Question(5, "What is the largest ocean in the world?", "Atlantic", "Arctic", "Indian", "Pacific", "D", "The Pacific Ocean is the largest ocean in the world."));
        questions.add(new Question(6, "What is the chemical symbol for water?", "H", "O", "W", "H2O", "D", "The chemical symbol for water is H2O."));
        questions.add(new Question(7, "Which planet is known as the Red Planet?", "Mercury", "Venus", "Mars", "Neptune", "C", "Mars is known as the Red Planet."));
        questions.add(new Question(8, "What is the main component of air?", "Oxygen", "Carbon dioxide", "Nitrogen", "Hydrogen", "C", "The main component of air is Nitrogen."));
//        questions.add(new Question(9, "Who wrote the play 'Romeo and Juliet'?", "William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain", "A", "William Shakespeare wrote the play 'Romeo and Juliet'."));
//        questions.add(new Question(10, "What is the largest mammal in the world?", "Elephant", "Giraffe", "Blue whale", "Lion", "C", "The largest mammal in the world is the Blue whale."));
//        questions.add(new Question(11, "What is the hardest natural substance on Earth?", "Diamond", "Gold", "Platinum", "Silver", "A", "Diamond is the hardest natural substance on Earth."));
//        questions.add(new Question(12, "Which country is known as the Land of the Rising Sun?", "China", "South Korea", "Japan", "Vietnam", "C", "Japan is known as the Land of the Rising Sun."));
//        questions.add(new Question(13, "What is the chemical symbol for gold?", "Au", "Ag", "G", "H2O", "A", "The chemical symbol for gold is Au."));
        for (int i = 0; i < questions.size(); i++ ){
            listanswer.add(0);
        }
        if(questions.size() > 13){
            questions = new ArrayList<>(questions.subList(0, 13));
            listanswer = new ArrayList<>(listanswer.subList(0, 13));
        }
        req.setAttribute("choosenAnswer", listanswer.get(indexquestion));
        req.setAttribute("question", questions.get(indexquestion));
        req.setAttribute("size", questions.size());
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
            request.setAttribute("size", questions.size());
            request.setAttribute("result", result);
            request.getRequestDispatcher("result").forward(request, response);
        }
        if (option.equals("next")) {
            listanswer.set(indexquestion, choosenAnswer);
            if(indexquestion == questions.size() - 1){
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
        request.setAttribute("size", questions.size());
        request.setAttribute("current", indexquestion);
        request.setAttribute("question", questions.get(indexquestion));
        request.getRequestDispatcher("views/exercise/practice.jsp").forward(request, response);

    }


    public static int Result(){
        int result  = 0;
        int answer = 0;
        for (int i = 0; i < questions.size(); i++){
            answer = 0;
            switch (questions.get(i).getAnswerTrue()){
                case "A":
                    answer = 1;
                    break;
                case "B":
                    answer = 2;
                    break;
                case "C":
                    answer = 3;
                    break;
                case "D":
                    answer = 4;
                    break;
            }
            if(listanswer.get(i) == answer){
                result += 1;
            }
        }

        return result;
    }

}
