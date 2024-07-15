package controller.admin.changeSessionTeacher;

import com.google.gson.Gson;
import dal.TeacherDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/admin/changeSessionTeacher")
public class ChangeTeacherSession extends HttpServlet {
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
            else if(!teacherDBContext.checkTeacherLearnThisSession(currentTeacher, date, Integer.parseInt(slot))){
                throw new Exception("Teacher " + currentTeacher + " don't learn on " + date + " at slot " + slot);
            }
            else if(teacherDBContext.checkTeacherLearnThisSession(targetTeacher, date, Integer.parseInt(slot))){
               throw new Exception("Teacher " + targetTeacher + " already learn on " + date + " at slot " + slot);
            }
            else if(!teacherDBContext.checkTeacherCanLearnCourse(currentTeacher,targetTeacher, Integer.parseInt(slot), date)){
                throw new Exception("Teacher " + targetTeacher + " can't learn course " + req.getParameter("course"));
            }

        }
        catch(Exception e){
            responseData.put("status", "failed");
            responseData.put("message", e.getMessage());
            String json = new Gson().toJson(responseData);
            resp.getWriter().write(json);
            return;
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
