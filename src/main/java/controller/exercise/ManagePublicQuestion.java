package controller.exercise;

import com.google.gson.Gson;
import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Answer;
import model.Question;
import model.QuestionAndAnswer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "managePublicQuestion", value = "/staff/manage-public-question")
public class ManagePublicQuestion extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProfileDBContext dao = new ProfileDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int account_id = account.getId();
        String accountId = String.valueOf(account_id);
        Account acc = dao.getAccountByID(accountId);

        AccountDBContext adbc = new AccountDBContext();
        String role = adbc.getRoleByRoleID(account.getRole_id());
        request.setAttribute("role", role);
        ExerciseDBContext edao = new ExerciseDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        String question_id = request.getParameter("question_id");
        String status = request.getParameter("status");
        String status_question = request.getParameter("status_question");
        String indexPage = request.getParameter("page");
        String type_question = request.getParameter("type_question");
        String search = request.getParameter("search");
        String course_id = request.getParameter("course_id");
//        course_id = "1";
        if(type_question == null){
            type_question = "0";
        }
        if (status_question == null){
            status_question = "0";
        }
        List<Question> listQuestion = new ArrayList<>();
        int count =0;
        int endPage =0;
        if (indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Answer> listAnswer = new ArrayList<>();
        if(question_id != null && status != null){
            Question question = qdao.getQuestionById(question_id);
            if(status.equals("accept")){
                if(bdao.getBankQuestionByQuestion(question.getQuestion()) != null){

                } else {
                    qdao.editQuestionStatusForBank(question.getQuestion_id());
                    bdao.insertQuestionBank(question.getQuestion(),question.getType_question(),question.getExercise().getTeacher().getAccount().getFullname(),question.getCourse().getId());
                    int bank_question_id = bdao.getBankQuestion_id();
                    listAnswer = qdao.getListAnswerByQuestionId(question_id);
                    for(Answer a : listAnswer){
                        bdao.insertAnswerBank(a.getAnswer(),a.getStatus(),bank_question_id);
                    }
                }

            } else if (status.equals("view")){
                listAnswer = qdao.getListAnswerByQuestionId(question_id);
                Gson gson = new Gson();
                QuestionAndAnswer questionAndAnswer = new QuestionAndAnswer(question,listAnswer);
                String jsonResponse = gson.toJson(questionAndAnswer);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonResponse);
                return;
            } else if(status.equals("refuse")) {
                qdao.refuseQuestion(question.getQuestion_id());
            } else {
                qdao.refuseQuestion(question.getQuestion_id());
                bdao.deleteQuestion(question.getQuestion());
            }
        }
        if(search == null || search.trim().isEmpty() ){
            if(type_question.equals("0")&&status_question.equals("0")){
                count = qdao.getTotalPublicQuestion(course_id);
                endPage = count/10;
                listQuestion = qdao.pagingListPublicQuestionByCourseId(index,course_id);
            } else {
                if(status_question.equals("0")&& !type_question.equals("0")) {
                    count = qdao.getTotalPublicQuestionByTypeQuestion(course_id, type_question);
                    endPage = count / 10;
                    listQuestion = qdao.pagingListPublicQuestionByTypeQuestion(index, type_question, course_id);
                }
//                } else if(!status_question.equals("0") && type_question.equals("0")){
//                    count = qdao.getTotalQuestionByStatusQuestion(course_id,status_question);
//                    endPage = count/5;
//                    listQuestion = qdao.pagingListQuestionBankByStatusQuestion(index,status_question,course_id);
//                } else if(!status_question.equals("0") && !type_question.equals("0")){
//                    count = qdao.getTotalQuestionByStatusAndTypeQuestion(course_id,status_question,type_question);
//                    endPage = count/5;
//                    listQuestion = qdao.pagingListQuestionBankByStatusAndTypeQuestion(index,type_question,course_id,status_question);
//                }
            }
        } else {
            search = search.trim();
            count = qdao.getTotalPublicQuestionBySearch(course_id,search);
            endPage = count/10;
            listQuestion = qdao.pagingListPublicQuestionBySearch(index,search,course_id);
        }


        if(count % 10 != 0){
            endPage++;
        }
        if(listQuestion.size() == 0){
            request.setAttribute("mess_list_question", "no data...");
        }
        request.setAttribute("course_id",course_id);
        request.setAttribute("searchtxt",search);
        request.setAttribute("status_question",status_question);
        request.setAttribute("type_question", type_question);
        request.setAttribute("tag",index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listQuestion", listQuestion);
        request.getRequestDispatcher("/views/exercise/managepublicquestion.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

