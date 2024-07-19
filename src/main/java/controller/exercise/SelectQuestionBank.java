package controller.exercise;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import dal.BankQuestionDBContext;
import dal.ExerciseDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SelectQuestionBank", value = "/teacher/select-question-bank")
public class SelectQuestionBank extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        ExerciseDBContext edao = new ExerciseDBContext();
        List<BankQuestion> listBankQuestion = new ArrayList<>();
        List<BankAnswer> listBankAnswer = new ArrayList<>();
        String numQuestions = request.getParameter("numQuestion");
        String basicQuestion = request.getParameter("basicQuestion");
        String lowQuestion = request.getParameter("lowQuestion");
        String highQuestion = request.getParameter("highQuestion");
        String status = request.getParameter("status");
        String indexPage = request.getParameter("page");
        String type_question = request.getParameter("type_question");
        String question_id = request.getParameter("question_id");
        String exercise_id = request.getParameter("exercise_id");
        String group_id = request.getParameter("group_id");
        String course_id = request.getParameter("course_id");
//        course_id = "1";
        Exercise ex = edao.getExerciseById(exercise_id);
        int basicQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("1", exercise_id);
        int lowQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("2", exercise_id);
        int highQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("3", exercise_id);
        List<Question> listAllQuestionOfExercise = qdao.getListQuestionByExerciseId(exercise_id);
        int numMissQuestion = 0;
        if(numQuestions != null && !numQuestions.trim().isEmpty()){
            numMissQuestion = Integer.parseInt(numQuestions) - listAllQuestionOfExercise.size();
            request.setAttribute("numQuestion",numQuestions);
        } else {
            if(basicQuestion != null && lowQuestion != null && highQuestion != null && !basicQuestion.trim().isEmpty() && !lowQuestion.trim().isEmpty() && !highQuestion.trim().isEmpty()){
                numMissQuestion = Integer.parseInt(basicQuestion) + Integer.parseInt(lowQuestion) + Integer.parseInt(highQuestion) - listAllQuestionOfExercise.size();
                request.setAttribute("numQuestion",String.valueOf(Integer.parseInt(basicQuestion) + Integer.parseInt(lowQuestion) + Integer.parseInt(highQuestion)));
            }
        }
        List<Question> listQuestions = qdao.getListQuestionByExerciseId(exercise_id);
        if(type_question == null){
            type_question = "0";
        }
        BankQuestion bankQuestion = bdao.getBankQuestionById(question_id);
        if(status != null && status.equals("view")){
            listBankAnswer = bdao.getListBankAnswerByQuestionId(question_id);
            Gson gson = new Gson();
            BankQuestionAndBankAnswer bankQuestionAndBankAnswer = new BankQuestionAndBankAnswer(bankQuestion,listBankAnswer);
            String jsonResponse = gson.toJson(bankQuestionAndBankAnswer);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
            return;
        }
        int count =0;
        int endPage =0;
        if (indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        String search = request.getParameter("search");
        if(search == null || search.trim().isEmpty()){
            if(type_question.equals("0")){
                count = bdao.getTotalBankQuestion(course_id);
                endPage = count/10;
                listBankQuestion = bdao.pagingBankQuestion(index,course_id);
            } else {
                count = bdao.getTotalBankQuestionByTypeQuestion(course_id,type_question);
                endPage = count/10;
                listBankQuestion = bdao.pagingBankQuestionByTypeQuestion(index,course_id,type_question);
            }
        } else {
            search = search.trim();
            count = bdao.getTotalBankQuestionBySearch(course_id,search);
            endPage = count/10;
            listBankQuestion = bdao.pagingListBankQuestionBySearch(index,search,course_id);
        }
        for (BankQuestion bank : listBankQuestion){
            for (Question question : listQuestions){
                if(bank.getQuestion().equals(question.getQuestion())){
                    bank.setStatus(1);
                }
            }
        }
        if(count % 10 != 0){
            endPage++;
        }
        request.setAttribute("group_id",group_id);
        request.setAttribute("course_id",course_id);
        request.setAttribute("isRandom", ex.getIsRandom());
        request.setAttribute("basicQuestion",basicQuestion);
        request.setAttribute("lowQuestion",lowQuestion);
        request.setAttribute("highQuestion",highQuestion);
        request.setAttribute("basicQuestionOfExercise",basicQuestionOfExercise);
        request.setAttribute("lowQuestionOfExercise",lowQuestionOfExercise);
        request.setAttribute("highQuestionOfExercise",highQuestionOfExercise);
        request.setAttribute("numMissQuesion",numMissQuestion);
        request.setAttribute("exercise_id",exercise_id);
        request.setAttribute("type_question", type_question);
        request.setAttribute("tag",index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listBankQuestion", listBankQuestion);
        request.getRequestDispatcher("/views/exercise/getbankquestion.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách các ID câu hỏi đã chọn từ đối tượng JSON

        // Đọc dữ liệu JSON từ request
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        // Chuyển đổi dữ liệu JSON thành một đối tượng Java (JsonObject)
        Gson gson = new Gson();
        JsonObject jsonObject = null;
        try {
            jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về mã lỗi 400 nếu có lỗi syntax JSON
            return;
        }

        // Kiểm tra xem JSON có null hay không
        if (jsonObject == null || !jsonObject.has("exercise_id") || !jsonObject.has("selectedIds")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        // Lấy exercise_id và danh sách các ID câu hỏi đã chọn từ đối tượng JSON
        String exercise_id = jsonObject.get("exercise_id").getAsString();
        JsonArray questionIds = jsonObject.getAsJsonArray("selectedIds");

        // Lưu trữ các câu hỏi đã tồn tại
        List<String> question_exist = new ArrayList<>();
        QuestionDBContext qdao = new QuestionDBContext();
        ExerciseDBContext edao = new ExerciseDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        // Lặp qua các câu hỏi đã chọn để thêm vào bài tập
        for (int i = 0; i < questionIds.size(); i++) {
            String questionId = questionIds.get(i).getAsString();
            System.out.println("Question ID: " + questionId);

            BankQuestion question = bdao.getBankQuestionById(questionId);

            if (question == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            if (qdao.getQuestion(question.getQuestion(), exercise_id) == null) {
                // Thêm câu hỏi vào bài tập nếu chưa tồn tại
                qdao.insertQuestionFromBank(question.getQuestion(), String.valueOf(question.getType_question()), exercise_id, "1");
                int question_id = qdao.getQuestion_id();

                // Lấy danh sách các câu trả lời cho câu hỏi từ câu hỏi ngân hàng
                List<BankAnswer> listAnswers = bdao.getListBankAnswerByQuestionId(String.valueOf(question.getBank_question_id()));
                for (int j = 0; j < listAnswers.size(); j++) {
                    qdao.insertAnswerFromBank(listAnswers.get(j).getAnswer(), question_id, listAnswers.get(j).getStatus());
                }
            } else {
                question_exist.add(questionId);
            }
        }

        // Xử lý kết quả cuối cùng và gửi phản hồi về client
        if (questionIds.size() != 0) {
            response.setStatus(HttpServletResponse.SC_OK); // Trả về mã thành công 200 nếu không có lỗi
            String jsonResponse = "{\"message\": \"add question successfully!\"}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();

        } else {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            String jsonResponse = "{\"message\": \"Please select questions you want to add to your exercise\"}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        }

    }
}
