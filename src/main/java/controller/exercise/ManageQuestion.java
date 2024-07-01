package controller.exercise;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import dal.BankQuestionDBContext;
import dal.ExerciseDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Answer;
import model.Exercise;
import model.Exercise_Constructor;
import model.Question;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "manageQuestion", value = "/teacher/manage-question")
@MultipartConfig()
public class ManageQuestion extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ExerciseDBContext edao = new ExerciseDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        String indexPage = request.getParameter("page");
        String question_id = request.getParameter("question_id");
        String delete = request.getParameter("delete");
        HttpSession session = request.getSession();
        String exercise_id = "";
        exercise_id = request.getParameter("exercise_id");
        if (exercise_id == null) {
            exercise_id = (String) session.getAttribute("exercise_id");
        }
        Exercise ex = new Exercise();
        if (exercise_id != null) {
            ex = edao.getExerciseById(exercise_id);
        }
        String type_question = request.getParameter("type_question");
        if (type_question == null) {
            type_question = "0";
        }
        String search = request.getParameter("search");
        List<Question> listQuestion = new ArrayList<Question>();

        List<Question> listAllQuestion = qdao.getAllListQuestion();
        int count = 0;
        int endPage = 0;
        if (indexPage == null || indexPage.trim().isEmpty()) {
            indexPage = "1";
        }
        System.out.println(indexPage);
        System.out.println(type_question);
        System.out.println(exercise_id);
        if (question_id != null && delete != null && delete.equals("1")) {
            qdao.deleteQuestion(question_id);
        }
        List<Question> listAllQuestionOfExercise = qdao.getListQuestionByExerciseId(exercise_id);
        int index = Integer.parseInt(indexPage);
        if (search == null || search.trim().isEmpty()) {
            if (type_question.equals("0")) {
                count = qdao.getTotalQuestion(exercise_id);
                endPage = count / 5;
                listQuestion = qdao.pagingQuestionByExercise_id(index, exercise_id);
            } else {
                count = qdao.getTotalQuestionByTypeQuestion(type_question, exercise_id);
                endPage = count / 5;
                listQuestion = qdao.pagingQuestionByTypeQuestion(index, type_question, exercise_id);
            }
        } else {
            request.setAttribute("searchExist", 1);
            search = search.trim();
            count = qdao.getTotalQuestionBySearch(search, exercise_id);
            endPage = count / 5;
            listQuestion = qdao.pagingQuestionBySearch(index, search, exercise_id);
        }

        if (count % 5 != 0) {
            endPage++;
        }
        for (Question question : listQuestion) {
            for (Question allQuestion : listAllQuestion) {
                if (question.getQuestion().equals(allQuestion.getQuestion())) {
                    if (allQuestion.getStatus() == 1 || allQuestion.getStatus() == 2) {
                        question.setStatus(1);
                    }
                }
            }
        }
        Exercise exercise = edao.getExerciseById(exercise_id);
        int basicQuestion = 0;
        int lowQuestion = 0;
        int highQuestion = 0;
        if (exercise.getIsRandom() == 1) {
            Cookie[] arrE = request.getCookies();
            String txt = "";
            if (arrE != null) {
                for (Cookie c : arrE) {
                    if (c.getName().equals("exercise")) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            Cookie c = new Cookie("exercise", txt);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
            List<Exercise_Constructor> listE = Constructor(txt);
            for (Exercise_Constructor e : listE) {
                if(exercise_id !=null && !exercise_id.trim().isEmpty()){
                    if (e.getExercise_id() == Integer.parseInt(exercise_id)) {
                        basicQuestion = e.getBasicQuestion();
                        lowQuestion = e.getLowQuestion();
                        highQuestion = e.getHighQuestion();
                        break;
                    }
                }
            }
            List<String> question = listAllQuestionOfExercise.stream()
                    .map(Question::getQuestion) // assuming getName() method exists
                    .collect(Collectors.toList());
            request.setAttribute("basicQuestion", basicQuestion);
            request.setAttribute("lowQuestion", lowQuestion);
            request.setAttribute("highQuestion", highQuestion);
            request.setAttribute("isRandom", ex.getIsRandom());
            request.setAttribute("questions", new Gson().toJson(question));
            request.setAttribute("numQuestion", ex.getQuestion_number());
            request.setAttribute("listQuestionSize", listAllQuestionOfExercise.size());
            request.setAttribute("search", search);
            request.setAttribute("type_question", type_question);
            request.setAttribute("tag", index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("exercise_id", exercise_id);
            request.setAttribute("listQuestion", listQuestion);
            request.getRequestDispatcher("viewQuestion.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ExerciseDBContext edao = new ExerciseDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        String exercise_id = request.getParameter("exercise_id");
        String status = request.getParameter("status");
        System.out.println(status);
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

        if (status != null && status.equals("add")) {
            String optionCount = request.getParameter("optionCount");
            int option_count = 2;
            if (optionCount != null && !optionCount.trim().isEmpty()) {
                option_count = Integer.parseInt(optionCount);
            }
            System.out.println("Option count: " + option_count);
            ArrayList<String> option = new ArrayList<>();
            for (int i = 1; i <= option_count; i++) {
                String optionParam = request.getParameter("option" + i);
                if (optionParam != null) {
                    optionParam = optionParam.trim();
                    option.add(optionParam);

                }
            }
            int correctAnswer_count = 1;
            String correctAnswerCount = request.getParameter("correctAnswerCount");
            if (correctAnswerCount != null && !correctAnswerCount.trim().isEmpty()) {
                correctAnswer_count = Integer.parseInt(correctAnswerCount);
            }
            ArrayList<String> correctAnswer = new ArrayList<>();
            for (int i = 1; i <= correctAnswer_count; i++) {
                String correctAnswerParam = request.getParameter("correct_answer" + i);
                if (correctAnswerParam != null) {
                    correctAnswerParam = correctAnswerParam.trim();
                    correctAnswer.add(correctAnswerParam);
                }
            }
            System.out.println("Option size:" + option.size());
            System.out.println("Correct count:" + correctAnswer_count);
            System.out.println("Correct size:" + correctAnswer.size());
            int question_id;String question = request.getParameter("question");
            String type_question_modal = request.getParameter("type_question_modal");
            String share_question = request.getParameter("share_question");
            String course_id = "1";
            Exercise exercise = edao.getExerciseById(exercise_id);
            int basicQuestion = 0;
            int lowQuestion = 0;
            int highQuestion = 0;
            int basicQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("1", exercise_id);
            int lowQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("2", exercise_id);
            int highQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("3", exercise_id);
            if(exercise.getIsRandom() == 1) {
                request.setAttribute("isRandom","1");
                Cookie[] arrE = request.getCookies();
                String txt = "";
                if (arrE != null) {
                    for (Cookie c : arrE) {
                        if (c.getName().equals("exercise")) {
                            txt += c.getValue();
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }
                Cookie c = new Cookie("exercise", txt);
                c.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(c);
                List<Exercise_Constructor> listE = Constructor(txt);
                for (Exercise_Constructor e : listE) {
                    if (e.getExercise_id() == Integer.parseInt(exercise_id)) {
                        basicQuestion = e.getBasicQuestion();
                        lowQuestion = e.getLowQuestion();
                        highQuestion = e.getHighQuestion();
                        break;
                    }
                }
                System.out.println("basic" + basicQuestion + "low" + lowQuestion + "high" + highQuestion);
                System.out.println("basicE" + basicQuestionOfExercise + "lowE" + lowQuestionOfExercise + "highE" + highQuestionOfExercise);
                if (type_question_modal.equals("1")) {
                    if (basicQuestionOfExercise >= basicQuestion) {
                        System.out.println("da vao basic");
                        request.setAttribute("mess_constructor", "Your exercise structure only has " + basicQuestion + " basic question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                } else if (type_question_modal.equals("2")) {
                    if (lowQuestionOfExercise >= lowQuestion) {
                        System.out.println("da vao low");
                        request.setAttribute("mess_constructor", "Your exercise structure only has " + lowQuestion + " low question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                } else if(type_question_modal.equals("3")) {
                    if (highQuestionOfExercise >= highQuestion) {
                        System.out.println("da vao high");
                        request.setAttribute("mess_constructor", "Your exercise structure only has " + highQuestion + " high question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                }
            }
            if (exercise_id != null && question != null && type_question_modal != null) {
                request.setAttribute("mess_constructor_success","Add question successfully!!");
                qdao.insertQuestion(question, type_question_modal, exercise_id, "1");
                question_id = qdao.getQuestion_id();
                if (question_id != 0) {
                    type_question_modal = "0";
                }
                if (share_question.equals("1")) {
                    qdao.editQuestionStatus(question_id);
                }
                System.out.println("Options: " + option);
                System.out.println("Correct Answers: " + correctAnswer);
                for (int i = 0; i < option.size(); i++) {
                    qdao.insertAnswer(option.get(i), String.valueOf(question_id));
                }
                for (int i = 0; i < option.size(); i++) {
                    for (int j = 0; j < correctAnswer.size(); j++) {
                        if (option.get(i).equals(correctAnswer.get(j))) {
                            System.out.println("Setting correct answer: " + option.get(i));
                            qdao.editAnswerStatus(option.get(i));
                        }
                    }
                }
            }
            request.setAttribute("basicQuestion", basicQuestion);
            request.setAttribute("lowQuestion", lowQuestion);
            request.setAttribute("highQuestion", highQuestion);
            request.setAttribute("exercise_id",exercise_id);
            request.setAttribute("course_id", course_id);
            request.setAttribute("type_question_modal", type_question_modal);
            doGet(request, response);
        } else if(status != null && status.equals("view")){
            String question_id = request.getParameter("question_id");
            Question question =  qdao.getQuestionById(question_id);
            List<Answer> listAnswer = qdao.getListAnswerByQuestionId(question_id);
            List<Answer> listCorrectAnswer = qdao.getListCorrectAnswerByQuestionId(question_id);
            JsonObject json = new JsonObject();
            json.addProperty("update_type_question_modal",question.getType_question());
            json.addProperty("question", question.getQuestion());
            JsonArray jsonAnswers = new JsonArray();
            JsonArray jsonCorrectAnswers = new JsonArray();
            for(Answer answer : listAnswer){
                JsonObject jsonAnswer = new JsonObject();
                jsonAnswer.addProperty("answer_id", answer.getAnswerid());
                jsonAnswer.addProperty("answer_text", answer.getAnswer());
                jsonAnswers.add(jsonAnswer);
            }
            json.add("answers", jsonAnswers);
            for(Answer answer : listCorrectAnswer){
                JsonObject jsonAnswer = new JsonObject();
                jsonAnswer.addProperty("correct_answer_id", answer.getAnswerid());
                jsonAnswer.addProperty("correct_answer_text", answer.getAnswer());
                jsonCorrectAnswers.add(jsonAnswer);
            }
            json.add("correctanswers", jsonCorrectAnswers);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
        } else if(status != null && status.equals("update")){
            System.out.println("da vao trong ham update");
            String optionCountUpdate = request.getParameter("optionCountUpdate");
            if (optionCountUpdate == null) {
                System.out.println("null");
            }
            System.out.println(optionCountUpdate);
            int option_count_update = 2;
            if (optionCountUpdate != null && !optionCountUpdate.trim().isEmpty()) {
                option_count_update = Integer.parseInt(optionCountUpdate);
                System.out.println("value : " + option_count_update);
            }
            System.out.println("value 2" + option_count_update);
            System.out.println("Option count: " + option_count_update);
            ArrayList<String> option = new ArrayList<>();
            for (int i = 1; i <= option_count_update; i++) {
                String optionParam = request.getParameter("option" + i);
                System.out.println(optionParam);
                if (optionParam != null) {
                    optionParam = optionParam.trim();
                    option.add(optionParam);
                }
            }
            int correctAnswerCountUpdate = 1;
            String correctAnswer_countUpdate = request.getParameter("correctAnswerCountUpdate");
            if (correctAnswer_countUpdate != null && !correctAnswer_countUpdate.trim().isEmpty()) {
                correctAnswerCountUpdate = Integer.parseInt(correctAnswer_countUpdate);
            }
            ArrayList<String> correctAnswer = new ArrayList<>();
            for (int i = 1; i <= correctAnswerCountUpdate; i++) {
                String correctAnswerParam = request.getParameter("correct_answer" + i);
                System.out.println(correctAnswerParam);
                if (correctAnswerParam != null) {
                    correctAnswerParam = correctAnswerParam.trim();
                    correctAnswer.add(correctAnswerParam);
                }
            }

            String question = request.getParameter("question");
            String question_id = request.getParameter("question_id");
            String type_question_modal = request.getParameter("update_type_question_modal");
            String course_id = "1";
            Exercise exercise = edao.getExerciseById(exercise_id);
            int basicQuestion = 0;
            int lowQuestion = 0;
            int highQuestion = 0;
            int basicQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("1", exercise_id);
            int lowQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("2", exercise_id);
            int highQuestionOfExercise = qdao.getTotalQuestionByTypeQuestion("3", exercise_id);
            if(exercise.getIsRandom() == 1) {
                request.setAttribute("isRandom","1");
                Cookie[] arrE = request.getCookies();
                String txt = "";
                if (arrE != null) {
                    for (Cookie c : arrE) {
                        if (c.getName().equals("exercise")) {
                            txt += c.getValue();
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }
                Cookie c = new Cookie("exercise", txt);
                c.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(c);
                List<Exercise_Constructor> listE = Constructor(txt);
                for (Exercise_Constructor e : listE) {
                    if (e.getExercise_id() == Integer.parseInt(exercise_id)) {
                        basicQuestion = e.getBasicQuestion();
                        lowQuestion = e.getLowQuestion();
                        highQuestion = e.getHighQuestion();
                        break;
                    }
                }
                System.out.println("basic" + basicQuestion + "low" + lowQuestion + "high" + highQuestion);
                System.out.println("basicE" + basicQuestionOfExercise + "lowE" + lowQuestionOfExercise + "highE" + highQuestionOfExercise);
                if (type_question_modal.equals("1")) {
                    if (basicQuestionOfExercise >= basicQuestion) {
                        System.out.println("da vao basic");
                        request.setAttribute("mess_constructor", "Can't update !!! Your exercise structure only has " + basicQuestion + " high question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                } else if (type_question_modal.equals("2")) {
                    if (lowQuestionOfExercise >= lowQuestion) {
                        System.out.println("da vao low");
                        request.setAttribute("mess_constructor", "Can't update !!! Your exercise structure only has " + lowQuestion + " high question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                } else if(type_question_modal.equals("3")) {
                    if (highQuestionOfExercise >= highQuestion) {
                        System.out.println("da vao high");
                        request.setAttribute("mess_constructor", "Can't update !!! Your exercise structure only has " + highQuestion + " high question so you are exceeding the number");
                        request.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("course_id", course_id);
                        doGet(request, response);
                        return;
                    }
                }
            }
            if (exercise_id != null && question != null && type_question_modal != null) {
                request.setAttribute("mess_constructor_success","Update question successfully!!");
                System.out.println("da vao trong ham update thu 2");
                System.out.println();
                qdao.deleteQuestion(question_id);
                qdao.insertQuestionAfterUpdate(question_id,question, type_question_modal, exercise_id, "1");
                System.out.println("Options: " + option);
                System.out.println("Correct Answers: " + correctAnswer);
                for (int i = 0; i < option.size(); i++) {
                    qdao.insertAnswer(option.get(i), question_id);
                }
                for (int i = 0; i < option.size(); i++) {
                    for (int j = 0; j < correctAnswer.size(); j++) {
                        if (option.get(i).equals(correctAnswer.get(j))) {
                            System.out.println("Setting correct answer: " + option.get(i));
                            qdao.editAnswerStatus(option.get(i));
                        }
                    }
                }
            }
            request.setAttribute("basicQuestion", basicQuestion);
            request.setAttribute("lowQuestion", lowQuestion);
            request.setAttribute("highQuestion", highQuestion);
            request.setAttribute("exercise_id",exercise_id);
            request.setAttribute("course_id", course_id);
            request.setAttribute("update_type_question_modal", type_question_modal);
            doGet(request, response);
        }else {
            if (jsonObject == null || !jsonObject.has("exercise_id") || !jsonObject.has("selectedIds") || !jsonObject.has("status")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            JsonArray questionIds = jsonObject.getAsJsonArray("selectedIds");
            // Lấy danh sách các ID câu hỏi đã chọn từ đối tượng JSON

            // Đọc dữ liệu JSON từ request

            // Lấy exercise_id và danh sách các ID câu hỏi đã chọn từ đối tượng JSON
            for (int i = 0; i < questionIds.size(); i++) {
                String questionId = questionIds.get(i).getAsString();
                qdao.editQuestionStatus(Integer.parseInt(questionId));
            }
            if (questionIds.size() != 0) {
                response.setStatus(HttpServletResponse.SC_OK); // Trả về mã thành công 200 nếu không có lỗi
                String jsonResponse = "{\"message\": \"share question successfully!\"}";
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(jsonResponse);
                out.flush();

            } else {
                response.setStatus(HttpServletResponse.SC_CONFLICT); // Trả về mã lỗi 409 nếu có câu hỏi đã tồn tại
                String jsonResponse = "{\"message\": \"Please select questions you want to add to your exercise\"}";
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(jsonResponse);
                out.flush();
            }
        }
    }

    public List<Exercise_Constructor> Constructor(String txt) {
        List<Exercise_Constructor> listE = new ArrayList<>();
        try {
            if (txt != null && txt.length() > 0) {
                String[] s = txt.split("a"); // tach tung exercise
                for (String i : s) {
                    Exercise_Constructor e = new Exercise_Constructor();
                    String[] n = i.split(":"); // tach tung basic ,low ,high question
                    int exercise_id = Integer.parseInt(n[0]);
                    int basicQuestion = Integer.parseInt(n[1]);
                    int lowQuestion = Integer.parseInt(n[2]);
                    int highQuestion = Integer.parseInt(n[3]);
                    e.setExercise_id(exercise_id);
                    e.setBasicQuestion(basicQuestion);
                    e.setLowQuestion(lowQuestion);
                    e.setHighQuestion(highQuestion);
                    listE.add(e);
                }
            }
        } catch (NumberFormatException e) {

        }
        return listE;
    }
}
