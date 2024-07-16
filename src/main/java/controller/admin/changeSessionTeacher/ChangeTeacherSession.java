package controller.admin.changeSessionTeacher;

import com.google.gson.Gson;
import dal.TeacherDBContext;
import dal.TokenDBContext;
import io.github.cdimascio.dotenv.Dotenv;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.EmailUtility;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/admin/changeSessionTeacher")
public class ChangeTeacherSession extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() throws ServletException {
        super.init();
        Dotenv dotenv = Dotenv.load();

        host = getServletContext().getInitParameter("host");
        port = getServletContext().getInitParameter("port");
        user = dotenv.get("USER_EMAIL");
        pass = dotenv.get("USER_PASS");


        if (host == null || port == null || user == null || pass == null) {
            try {
                throw new ServletException("Email server configuration missing in context parameters.");
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../views/admin/changeSessionTeacher/changeTeacherSession.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        TeacherDBContext teacherDBContext = new TeacherDBContext();
        Map<String, Object> responseData = new HashMap<>();

        String currentTeacher = req.getParameter("currentTeacher");
        String targetTeacher = req.getParameter("targetTeacher");
        String slot = req.getParameter("slot");
        String date = req.getParameter("date");

        responseData.put("currentTeacher", currentTeacher);
        responseData.put("targetTeacher", targetTeacher);
        responseData.put("slot", slot);
        responseData.put("date", date);

        try{
            if(!teacherDBContext.checkTeacherExist(currentTeacher)){
                throw new Exception("Teacher " + currentTeacher + " not exist");
            }
            if(!teacherDBContext.checkTeacherExist(targetTeacher)){
                throw new Exception("Teacher " + targetTeacher + " not exist");
            }
            else if(!teacherDBContext.checkTeacherTeachThisSession(currentTeacher, date, Integer.parseInt(slot))){
                throw new Exception("Teacher " + currentTeacher + " don't learn on " + date + " at slot " + slot);
            }
            else if(teacherDBContext.checkTeacherTeachThisSession(targetTeacher, date, Integer.parseInt(slot))){
               throw new Exception("Teacher " + targetTeacher + " already learn on " + date + " at slot " + slot);
            }
            else if(!teacherDBContext.checkTeacherCanTeachCourse(currentTeacher,targetTeacher, Integer.parseInt(slot), date)){

                throw new Exception("Teacher " + targetTeacher + " can't learn course " + teacherDBContext.getCourse(date,slot,currentTeacher));
            }

        }
        catch(Exception e){
            responseData.put("status", "failed");
            responseData.put("message", e.getMessage());
            String json = new Gson().toJson(responseData);
            resp.getWriter().write(json);
            return;
        }
        ArrayList<String> emails = teacherDBContext.getAllEmailStudent(currentTeacher, slot, date);
        for (String s : emails) {
            try {
                EmailUtility.sendEmail(host, port, user, pass, s, "CHANGE OF TEACHERS ON "+date,
                        "On "+date+", slot " + slot + "  will have a substitute instructor: "+targetTeacher);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

        }


        responseData.put("status", "success");
        responseData.put("message", "Session changed successfully!");
        teacherDBContext.ChangeSessionTeacher(targetTeacher, currentTeacher, Integer.parseInt(slot), date);
        responseData.put("currentTeacher", currentTeacher);
        responseData.put("targetTeacher", targetTeacher);
        responseData.put("slot", slot);
        responseData.put("date", date);
        String json = new Gson().toJson(responseData);
        resp.getWriter().write(json);
    }
}
