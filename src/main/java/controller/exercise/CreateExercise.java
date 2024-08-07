package controller.exercise;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;
import util.GetCurrentTerm;

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
        String indexPage = request.getParameter("page");
        String search = request.getParameter("search");
        String type_exercise = request.getParameter("type_exercise");
        String exercise_id = request.getParameter("exercise_id");
        String delete = request.getParameter("delete");
        if(delete != null && delete.equals("1") && exercise_id != null && !exercise_id.trim().isEmpty()) {
            request.setAttribute("mess","Delete successfully ");
            edao.editExerciseStatusForDelete(exercise_id);
        }
        Exercise ex = edao.getExerciseById(exercise_id);
        String group_id = request.getParameter("group_id");
        if(group_id == null){
            group_id = session.getAttribute("group_id").toString();
        }
//        group_id = "1";
        String course_id = request.getParameter("course_id");
        if(course_id == null){
            course_id = session.getAttribute("course_id").toString();
        }
        session.setAttribute("group_id", group_id);
        session.setAttribute("course_id", course_id);
        System.out.println("course_id: " + course_id);
        if(type_exercise == null || type_exercise.equals("")) {
            type_exercise = "0";
        }
        List<Exercise> listExerciseOfGroup = edao.getListExercise(group_id);
        List<Grade_category> listGradeCategoryOfCourse = edao.getListGradeCategory(course_id);
        List<Grade_category> listGradeCategory = new ArrayList<>();
        for(Grade_category grade_category : listGradeCategoryOfCourse) {
            boolean found = false;
            for (Exercise exercise : listExerciseOfGroup) {
                if(exercise.getGrade_category() != 0){
                    if(grade_category.getId() == exercise.getGrade_category()){
                        found = true;
                        break;
                    }
                }
            }
            if(!found){
                listGradeCategory.add(grade_category);
            }
        }
        int count = 0;
        int endPage = 0;
        if (indexPage == null || indexPage.trim().isEmpty()) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Exercise> listExercise = new ArrayList<Exercise>();
        if (search == null || search.trim().isEmpty()) {
            if (type_exercise.equals("0")) {
                System.out.println("chay toi phan trang");
                count = edao.getTotalExerciseByGroupId(group_id);
                endPage = count / 10;
                listExercise = edao.pagingExerciseByGroupId(index, group_id);
            } else {
                count = edao.getTotalExerciseByGetScore(group_id,type_exercise);
                endPage = count / 10;
                listExercise = edao.pagingExerciseByGetScore(index, group_id, type_exercise);
            }
        } else {
            request.setAttribute("searchExist", 1);
            search = search.trim();
            count = edao.getTotalExerciseBySearch(group_id, search);
            endPage = count / 10;
            listExercise = edao.pagingExerciseBySearch(index, group_id, search);
        }

        if (count % 10 != 0) {
            endPage++;
        }
        List<String> exerciseNames = listExercise.stream()
                .map(Exercise::getExerciseName) // assuming getName() method exists
                .collect(Collectors.toList());
        List<Question> listAllQuestionOfExercise = qdao.getListQuestionByExerciseId(exercise_id);
        int basicBankQuestion = bdao.getTotalBankQuestionByTypeQuestion(course_id,"1");
        int lowBankQuestion = bdao.getTotalBankQuestionByTypeQuestion(course_id,"2");
        int highBankQuestion = bdao.getTotalBankQuestionByTypeQuestion(course_id,"3");
        System.out.println("basic : " + basicBankQuestion);
        System.out.println("low : " + lowBankQuestion);
        System.out.println("high : " + highBankQuestion);
        request.setAttribute("tag", index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("type_exercise",type_exercise);
        request.setAttribute("search", search);
        request.setAttribute("group_id", group_id);
        request.setAttribute("course_id",course_id);
        request.setAttribute("basicBankQuestion", basicBankQuestion);
        request.setAttribute("lowBankQuestion", lowBankQuestion);
        request.setAttribute("highBankQuestion", highBankQuestion);
        request.setAttribute("listGradeCategory", listGradeCategory);
        request.setAttribute("listExercise", listExercise);
        request.setAttribute("exerciseNames", new Gson().toJson(exerciseNames));
        request.getRequestDispatcher("/views/exercise/exercise.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // git commit practice code
        Random random = new Random();
        ExerciseDBContext dao = new ExerciseDBContext();
        String randomExercise = request.getParameter("random");
        String status = request.getParameter("status");
        String exerciseId = request.getParameter("exerciseId");
//        String group_id = request.getParameter("groupId");
        String group_id = request.getParameter("group_id");
        System.out.println("Exercise ID: " + exerciseId);
        String course_id = request.getParameter("course_id");
//        course_id = "1";
        String teacher_id = request.getParameter("teacher_id");
        teacher_id = "t1";
        if(status != null && status.equals("view")){
            group_id = request.getParameter("groupId");
            Exercise exercise = dao.getExerciseById(exerciseId);
            JsonObject json = new JsonObject();
            json.addProperty("exercise_name", exercise.getExerciseName());
            if(exercise.getIsRandom() == 1){
                System.out.println("chay vao duoc random");
                    System.out.println("chay duoc vao random 2");
                        System.out.println("basic: " + exercise.getBasic_question());
                        System.out.println("low: " + exercise.getLow_question());
                        System.out.println("high: " + exercise.getHigh_question());
                        json.addProperty("basic_question",exercise.getBasic_question());
                        json.addProperty("low_question",exercise.getLow_question());
                        json.addProperty("high_question",exercise.getHigh_question());
            } else {
                json.addProperty("basic_question",exercise.getBasic_question());
                json.addProperty("low_question",exercise.getLow_question());
                json.addProperty("high_question",exercise.getHigh_question());
            }
            json.addProperty("exercise_id", exerciseId);
            json.addProperty("isRandom", exercise.getIsRandom());
            json.addProperty("exercise_time", exercise.getExercise_time());
            json.addProperty("exercise_type", exercise.getGet_score());
            if(exercise.getGet_score() == 1){
                json.addProperty("grade_category", exercise.getGrade_category());
            }
            JsonArray gradeCategoryArray = new JsonArray();
            List<Exercise> listExerciseOfGroup = dao.getListExercise(group_id);
            List<Grade_category> listGradeCategoryOfCourse = dao.getListGradeCategory(course_id);
            List<Grade_category> listGradeCategory = new ArrayList<>();
            for(Grade_category grade_category : listGradeCategoryOfCourse) {
                boolean found = false;
                for (Exercise ex : listExerciseOfGroup) {
                    if(ex.getGrade_category() != 0 && ex.getGrade_category() != exercise.getGrade_category()){
                        if(grade_category.getId() == ex.getGrade_category()){
                            found = true;
                            break;
                        }
                    }
                }
                if(!found){
                    listGradeCategory.add(grade_category);
                }
            }

            for (Grade_category category : listGradeCategory) {
                JsonObject categoryJson = new JsonObject();
                categoryJson.addProperty("id", category.getId());
                categoryJson.addProperty("name", category.getName());
                gradeCategoryArray.add(categoryJson);
            }
            json.add("listGradeCategory", gradeCategoryArray);
            // Add other necessary fields
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
        } else if (status != null && status.equals("update")) {
            String exercise_id = request.getParameter("exercise_id");
            System.out.println("chay vao update");
            System.out.println("exercise id : " + exercise_id);
            Exercise exercise = dao.getExerciseById(exercise_id);
            if(exercise.getIsRandom() == 1){
                String update_random_exerciseName = request.getParameter("update_random_exerciseName");
                String update_random_basicQuestion = request.getParameter("update_random_basicQuestion");
                String update_random_lowQuestion = request.getParameter("update_random_lowQuestion");
                String update_random_highQuestion = request.getParameter("update_random_highQuestion");
                String update_random_exerciseTime = request.getParameter("update_random_exerciseTime");
                String update_random_exerciseType = request.getParameter("update_random_exerciseType");
                String update_random_gradeCategory = request.getParameter("update_random_gradeCategory");
                if(update_random_exerciseName != null && update_random_basicQuestion != null && update_random_lowQuestion != null && update_random_highQuestion != null && update_random_exerciseType != null && update_random_gradeCategory != null && update_random_exerciseTime != null) {
                    request.setAttribute("mess","Update successfully!");
                    BankQuestionDBContext bankDAO = new BankQuestionDBContext();
                    QuestionDBContext qdao = new QuestionDBContext();
                    if(update_random_exerciseType.equals("1")){
                        dao.updateExerciseNormalGetScore(exercise_id,update_random_exerciseName,update_random_exerciseTime,update_random_exerciseType,update_random_gradeCategory);
                        doGet(request,response);
                    } else {
                        dao.updateExerciseNormalNotGetScore(exercise_id,update_random_exerciseName,update_random_exerciseTime,update_random_exerciseType);
                        doGet(request,response);
                    }
                }
            } else {
                String update_exercise_name = request.getParameter("update_exercise_name");
                String update_exercise_time = request.getParameter("update_exercise_time");
                String update_exercise_type = request.getParameter("update_exercise_type");
                String update_grade_category = "";
                if(update_exercise_type.equals("1")){
                    update_grade_category = request.getParameter("update_grade_category");
                }
                if(update_exercise_name != null && update_exercise_time != null && update_exercise_type != null && update_grade_category != null){
                    request.setAttribute("mess","Update successfully!");
                    if(update_exercise_type.equals("1")){
                        dao.updateExerciseNormalGetScore(exercise_id,update_exercise_name,update_exercise_time,update_exercise_type,update_grade_category);
                        doGet(request,response);
                    } else if(update_exercise_type.equals("2")){
                        dao.updateExerciseNormalNotGetScore(exercise_id,update_exercise_name,update_exercise_time,update_exercise_type);
                        doGet(request,response);
                    }
                }
            }
        } else {
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
                System.out.println("Random grade: " + random_gradeCategory);
                List<Question> listQuestion = new ArrayList<>();
//                int numQuestion = numBasicQuestion + numHighQuestion + numLowQuestion;
                List<BankQuestion> listBasicBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("1");
                List<BankQuestion> listLowBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("2");
                List<BankQuestion> listHighBankQuestion = bankDAO.getListBankQuestionByTypeQuesion("3");
                if(random_exerciseName != null && random_exerciseTime != null && random_exerciseType != null) {
                    System.out.println("join 2");
                    request.setAttribute("mess","Add exercise successfully!");
                    if(random_exerciseType.equals("2")){
                        System.out.println("create success");
                        dao.insertExerciseNotGetMark(exercise_id, random_exerciseName.trim(), teacher_id, course_id, random_basicQuestion,random_lowQuestion,random_highQuestion, random_exerciseTime, random_exerciseType, group_id,"1");
                    } else {
                        System.out.println("create success");
                        dao.insertExerciseGetMark(exercise_id, random_exerciseName.trim(), teacher_id, course_id, random_basicQuestion,random_lowQuestion,random_highQuestion, random_exerciseTime, random_exerciseType, group_id,random_gradeCategory,"1");
                    }
                }

                Exercise ex = dao.getExerciseById(exercise_id);
                if(ex != null){
                    addRandomQuestions(listBasicBankQuestion,numBasicQuestion,exercise_id,course_id);
                    addRandomQuestions(listLowBankQuestion,numLowQuestion,exercise_id,course_id);
                    addRandomQuestions(listHighBankQuestion,numHighQuestion,exercise_id,course_id);
                    HttpSession session = request.getSession();
                    session.setAttribute("exercise_id", exercise_id);
                    request.setAttribute("group_id",group_id);
                    request.setAttribute("course_id",course_id);
                    request.setAttribute("type_question","0");
//                    request.setAttribute("tag",index);
//                    request.setAttribute("endPage", endPage);
                    request.setAttribute("listQuestion", listQuestion);
//                    request.setAttribute("listQuestionSize",listQuestionOfExerciseId.size());
//                    request.setAttribute("numQuestion",numQuestion);
                    request.setAttribute("firstLoad",true);
                    request.setAttribute("exercise_id", exercise_id);
                    doGet(request,response);
                } else {
                    System.out.println("Fail to create exercise");
                }
            } else {
                String exercise_name = request.getParameter("excercise_name");
//                String question_number = "5";
                String exercise_time = request.getParameter("exercise_time");
                String exercise_type = request.getParameter("exercise_type");
                String grade_category = request.getParameter("grade_category");
                String basiQuestion = request.getParameter("basicQuestion");
                String lowQuestion = request.getParameter("lowQuestion");
                String highQuestion = request.getParameter("highQuestion");
                if(exercise_name != null && teacher_id != null && exercise_time != null && basiQuestion != null && lowQuestion != null && highQuestion != null && exercise_type != null && grade_category != null){
                    request.setAttribute("mess","Add exercise successfully!");
                    if(!exercise_type.equals("2")){
                        dao.insertExerciseGetMark(exercise_id, exercise_name.trim(), teacher_id,course_id,basiQuestion.trim(),lowQuestion.trim(),highQuestion.trim(),exercise_time.trim(),exercise_type,group_id,grade_category,"0");
                    } else {
                        dao.insertExerciseNotGetMark(exercise_id, exercise_name.trim(), teacher_id,course_id,basiQuestion.trim(),lowQuestion.trim(),highQuestion.trim(),exercise_time.trim(),exercise_type,group_id,"0");
                    }
                    Exercise ex = dao.getExerciseById(exercise_id);
                    if(ex != null){
                        HttpSession session = request.getSession();
                        request.setAttribute("group_id",group_id);
                        request.setAttribute("course_id",course_id);
                        session.setAttribute("exercise_id", exercise_id);
                        request.setAttribute("listQuestionSize",0);
//                        request.setAttribute("numQuestion",Integer.parseInt(question_number));
                        request.setAttribute("type_question","0");
                        request.setAttribute("firstLoad",true);
                        request.setAttribute("exercise_id", exercise_id);
                        doGet(request, response);
                    }
                }
            }
        }


    }

    public void addRandomQuestions(List<BankQuestion> bankQuestions,int numQuestions,String exercise_id,String course_id){
        ExerciseDBContext edao = new ExerciseDBContext();
        BankQuestionDBContext bdao = new BankQuestionDBContext();
        QuestionDBContext qdao = new QuestionDBContext();
        Collections.shuffle(bankQuestions);
        for(int i = 0; i < numQuestions && i < bankQuestions.size(); i++){
            BankQuestion bankQuestion = bankQuestions.get(i);
            qdao.insertQuestionFromBank(bankQuestion.getQuestion(),String.valueOf(bankQuestion.getType_question()),exercise_id,course_id);
            int question_id = qdao.getQuestion_id();
            List<BankAnswer> listBankAnswer = bdao.getListBankAnswerByQuestionId(String.valueOf(bankQuestion.getBank_question_id()));
            for(BankAnswer bankAnswer : listBankAnswer){
                qdao.insertAnswerFromBank(bankAnswer.getAnswer(),question_id,bankAnswer.getStatus());
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
