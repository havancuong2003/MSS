package controller.student;

import com.google.gson.Gson;
import dal.ChangeGroupDBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ChangeGroup;
import util.GetCurrentTerm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/student/createRequest")
public class CreateRequest extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
        GroupDBContext gdb = new GroupDBContext();
        StudentDBContext sdb = new StudentDBContext();


        String fromStudent = req.getParameter("fromStudent");
        String toStudent = req.getParameter("toStudent");
        String course = req.getParameter("course");
        Map<String, Object> responseData = new HashMap<>();
        try {
            // sinh vien khong ton tai
            if (!cgdb.checkStudentExist(toStudent)) {
                throw new Exception("Student " + toStudent + " not exist");
                // sinh vien khong hoc mon do
            } else if (!cgdb.checkStudentRegisterdCourse(toStudent, currentSemester, Integer.parseInt(course))) {
                throw new Exception("Student " + toStudent + " not registerd course");
                // co nguoi gui course nay toi student do roi
            } else if (cgdb.checkSomeOneSendRequestToStudentWeWantToChange(toStudent, Integer.parseInt(course), currentSemester)) {
                throw new Exception("Student " + toStudent + " already received request to change this course  by someone");
                // sinh vien nay da gui course nay cho ai do roi
            } else if (cgdb.checkStudentWantToChangeSendRequested(toStudent, Integer.parseInt(course), currentSemester)) {
                throw new Exception("Student " + toStudent + " already send request to change course to someone");
                // minh da gui cho ai do roi
            } else if (cgdb.checkStudentWantToChangeSendRequested(fromStudent, Integer.parseInt(course), currentSemester)) {
                throw new Exception(" You already sent request to change course to someone. Check again");

            }
            // co nguoi gui cho minh roi
            else if (cgdb.checkSomeOneSendRequestToStudentWeWantToChange(fromStudent, Integer.parseInt(course), currentSemester)) {
                throw new Exception(" You already received request to change course by someone. Check again");
            }
            int fromGroup = cgdb.getGroupIDToAddChangeGroup(fromStudent, currentSemester, Integer.parseInt(course));
            int toGroup = cgdb.getGroupIDToAddChangeGroup(toStudent, currentSemester, Integer.parseInt(course));
            cgdb.insertChangeGroup(fromStudent, fromGroup, toStudent, toGroup, currentSemester);

        } catch (Exception e) {
            responseData.put("status", "error");
            responseData.put("error", e.getMessage());
            String json = new Gson().toJson(responseData);
            resp.getWriter().write(json);
            return;
        }


        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");


        ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(), currentSemester);


        ArrayList<ChangeGroup> allRequiredFromSomeOne = cgdb.getAllRequiredToSwap(account.getUsername(), currentSemester);
        responseData.put("status", "success");
        responseData.put("allRequiredFromSomeOne", allRequiredFromSomeOne);
        responseData.put("allRequired", allRequired);
        responseData.put("groups", gdb.getGroupForStudent(1, account.getUsername()));
        String json = new Gson().toJson(responseData);

        resp.getWriter().write(json);

    }
}
