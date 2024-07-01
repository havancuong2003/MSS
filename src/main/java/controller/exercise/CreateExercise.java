package controller.exercise;

import com.google.gson.Gson;
import dal.BankQuestionDBContext;
import dal.ExerciseDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
@WebServlet(name = "createExercise", value = "/teacher/create-exercise")
@MultipartConfig()
public class CreateExercise extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ExerciseDBContext dao = new ExerciseDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        Teacher teacher = dao.getTeacher("t1");
        String teacherId = teacher.getTid();
        String teacher_id = String.valueOf(teacherId);
        List<Exercise> listExercise = dao.getListExercise();
        List<Grade_category> listGradeCategory = dao.getListGradeCategory("1");
        List<String> exerciseNames = listExercise.stream()
                .map(Exercise::getExerciseName) // assuming getName() method exists
                .collect(Collectors.toList());
        int basicBankQuestion = bdao.getTotalBankQuestionByTypeQuestion("101","1");
        int lowBankQuestion = bdao.getTotalBankQuestionByTypeQuestion("101","2");
        int highBankQuestion = bdao.getTotalBankQuestionByTypeQuestion("101","3");
        System.out.println("basic : " + basicBankQuestion);
        System.out.println("low : " + lowBankQuestion);
        System.out.println("high : " + highBankQuestion);
        request.setAttribute("basicBankQuestion", basicBankQuestion);
        request.setAttribute("lowBankQuestion", lowBankQuestion);
        request.setAttribute("highBankQuestion", highBankQuestion);
        request.setAttribute("listGradeCategory", listGradeCategory);
        request.setAttribute("listExercise", listExercise);
        request.setAttribute("exerciseNames", new Gson().toJson(exerciseNames));
        request.setAttribute("teacher_id",teacher_id);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("/views/exercise/exercise.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // git commit practice code
        Random random = new Random();
        ExerciseDBContext dao = new ExerciseDBContext();
        String randomExercise = request.getParameter("random");
        String course_id = request.getParameter("course_id");
        course_id = "1";
        String teacher_id = request.getParameter("teacher_id");
        int ramdonNumber =  100000 + random.nextInt(900000);
        String exercise_id = String.valueOf(ramdonNumber);
        if(randomExercise != null && randomExercise.equals("1")){
            System.out.println("Join success");
            BankQuestionDBContext bankDAO = new BankQuestionDBContext();
            String random_exerciseName = request.getParameter("random_exerciseName");
            String random_basicQuestion = request.getParameter("random_basicQuestion");
            int numBasicQuestion = Integer.parseInt(random_basicQuestion);
            String random_lowQuestion = request.getParameter("random_lowQuestion");
            int numLowQuestion = Integer.parseInt(random_lowQuestion);
            String random_highQuestion = request.getParameter("random_highQuestion");
            int numHighQuestion = Integer.parseInt(random_highQuestion);
            String random_exerciseTime = request.getParameter("random_exerciseTime");
            String random_exerciseType = request.getParameter("random_exerciseType");
            String random_gradeCategory = request.getParameter("random_gradeCategory");
            List<Question> listQuestion = new ArrayList<>();
            int numQuestion = numBasicQuestion + numHighQuestion + numLowQuestion;
            List<BankQuestion> listBasicBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("1");
            List<BankQuestion> listLowBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("2");
            List<BankQuestion> listHighBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("3");
            if(random_exerciseName != null && random_exerciseTime != null && random_exerciseType != null) {
                System.out.println("join 2");
                if(random_exerciseType.equals("2")){
                    System.out.println("create success");
                    dao.insertExerciseNotGetMark(exercise_id, random_exerciseName.trim(), teacher_id, course_id, String.valueOf(numQuestion), random_exerciseTime, random_exerciseType, "1");
                } else {
                    System.out.println("create success");
                    dao.insertExerciseGetMark(exercise_id, random_exerciseName.trim(), teacher_id, course_id, String.valueOf(numQuestion), random_exerciseTime, random_exerciseType, "1",random_gradeCategory);
                }
            }

            Exercise ex = dao.getExerciseById(exercise_id);
            if(ex != null){
                addRandomQuestions(listBasicBankQuestion,numBasicQuestion,exercise_id,course_id);
                addRandomQuestions(listLowBankQuestion,numLowQuestion,exercise_id,course_id);
                addRandomQuestions(listHighBankQuestion,numHighQuestion,exercise_id,course_id);
                String indexPage = request.getParameter("page");
                int count =0;
                int endPage =0;
                if (indexPage == null){
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);
                QuestionDBContext qdao = new QuestionDBContext();
                count = qdao.getTotalQuestion(exercise_id);
                endPage = count/5;
                listQuestion = qdao.pagingQuestionByExercise_id(index, exercise_id);
                if(count % 5 != 0){
                    endPage++;
                }
                HttpSession session = request.getSession();
                session.setAttribute("exercise_id", exercise_id);
                request.setAttribute("type_question","0");
                request.setAttribute("tag",index);
                request.setAttribute("endPage", endPage);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("listQuestionSize",listQuestion.size());
                request.setAttribute("numQuestion",numQuestion);
                request.setAttribute("firstLoad",true);
                request.setAttribute("exercise_id", exercise_id);
                request.getRequestDispatcher("/views/exercise/managequestion.jsp").forward(request, response);
            } else {
                System.out.println("Fail to create exercise");
            }
        } else {
            String exercise_name = request.getParameter("excercise_name");
            String question_number = request.getParameter("question_number");
            String exercise_time = request.getParameter("exercise_time");
            String exercise_type = request.getParameter("exercise_type");
            String grade_category = request.getParameter("grade_category");
            if(exercise_name != null && teacher_id != null && question_number != null && exercise_time != null && exercise_type != null && grade_category != null){
                if(!exercise_type.equals("2")){
                    dao.insertExerciseGetMark(exercise_id, exercise_name.trim(), teacher_id,"1",question_number.trim(),exercise_time.trim(),exercise_type,"1",grade_category);
                } else {
                    dao.insertExerciseNotGetMark(exercise_id, exercise_name.trim(), teacher_id,"1",question_number.trim(),exercise_time.trim(),exercise_type,"1");
                }
                Exercise ex = dao.getExerciseById(exercise_id);
                if(ex != null){
                    HttpSession session = request.getSession();
                    session.setAttribute("exercise_id", exercise_id);
                    request.setAttribute("listQuestionSize",0);
                    request.setAttribute("numQuestion",Integer.parseInt(question_number));
                    request.setAttribute("type_question","0");
                    request.setAttribute("firstLoad",true);
                    request.setAttribute("exercise_id", exercise_id);
                    request.getRequestDispatcher("/views/exercise/managequestion.jsp").forward(request, response);
                }
            }
        }

    }

    public void addRandomQuestions(List<BankQuestion> bankQuestions,int numQuestions,String exercise_id,String course_id){
        QuestionDBContext dao = new QuestionDBContext();
        Collections.shuffle(bankQuestions);
        for(int i = 0; i < numQuestions && i < bankQuestions.size(); i++){
            BankQuestion bankQuestion = bankQuestions.get(i);
            System.out.println(bankQuestion.getType_question());
            dao.insertQuestionFromBank(bankQuestion.getQuestion(),String.valueOf(bankQuestion.getType_question()),exercise_id,course_id);
        }
    }
}
