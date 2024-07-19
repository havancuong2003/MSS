package controller.exercise;

import com.google.gson.Gson;
import dal.BankQuestionDBContext;
import dal.ExerciseDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "manageBankQuestion", value = "/staff/manage-bank-question")
public class ManageBankQuestion extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ExerciseDBContext edao = new ExerciseDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        String question_id = request.getParameter("question_id");
        String status = request.getParameter("status");
        String status_question = request.getParameter("status_question");
        String indexPage = request.getParameter("page");
        String type_question = request.getParameter("type_question");
        String search = request.getParameter("search");
        String course_id = request.getParameter("course_id");
        course_id = "1";
        if(type_question == null){
            type_question = "0";
        }
        if (status_question == null){
            status_question = "0";
        }
        List<BankQuestion> listQuestion = new ArrayList<>();
        int count =0;
        int endPage =0;
        if (indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<BankAnswer> listAnswer = new ArrayList<>();
        if(question_id != null && status != null){
            BankQuestion bankquestion = bdao.getBankQuestionById(question_id);
            if (status.equals("view")){
                listAnswer = bdao.getListAnswerByQuestionId(question_id);
                Gson gson = new Gson();
                BankQuestionAndBankAnswer bankQuestionAndBankAnswer = new BankQuestionAndBankAnswer(bankquestion,listAnswer);
                String jsonResponse = gson.toJson(bankQuestionAndBankAnswer);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonResponse);
                return;
            } else {
                bdao.deleteQuestion(bankquestion.getQuestion());
            }
        }
        if(search == null || search.trim().isEmpty() ){
            if(type_question.equals("0")&&status_question.equals("0")){
                count = bdao.getTotalBankQuestion(course_id);
                endPage = count/10;
                listQuestion = bdao.pagingBankQuestion(index,course_id);
            } else {
                if(status_question.equals("0")&& !type_question.equals("0")){
                    count = bdao.getTotalBankQuestionByTypeQuestion(course_id,type_question);
                    endPage = count/10;
                    listQuestion = bdao.pagingBankQuestionByTypeQuestion(index,course_id,type_question);
                }
            }
        } else {
            search = search.trim();
            count = bdao.getTotalBankQuestionBySearch(course_id,search);
            endPage = count/10;
            listQuestion = bdao.pagingListBankQuestionBySearch(index,search,course_id);
        }


        if(count % 10 != 0){
            endPage++;
        }
        if(listQuestion.size() == 0){
            request.setAttribute("mess_list_question", "no data...");
        }
        request.setAttribute("searchtxt",search);
        request.setAttribute("status_question",status_question);
        request.setAttribute("type_question", type_question);
        request.setAttribute("tag",index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listQuestion", listQuestion);
        request.getRequestDispatcher("/views/exercise/managebankquestion.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
