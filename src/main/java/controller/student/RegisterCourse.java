package controller.student;

import com.google.gson.Gson;
import dal.StudentDBContext;
import dal.TimePeriodsDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.TimePeriods;
import util.GetCurrentTerm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/student/RegisterCourse")
public class RegisterCourse extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(GetCurrentTerm.currentTerm);
        HttpSession session = req.getSession();
        StudentDBContext s = new StudentDBContext();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            try {
                int currentTerm = s.getCurrentTermOfStudent(account.getUsername());
                req.setAttribute("courseRegister", s.getAllCourseRegisterForStudent(currentTerm + 3, 1, account.getUsername()));
                req.setAttribute("courseImprove", s.getCourseRegisterImprove(account.getUsername()));
                req.setAttribute("courseLearnAgain", s.getCourseRegisterAgain(account.getUsername()));
                req.setAttribute("courseRegistered", s.getCoursesRegistered(account.getUsername(), currentTerm));
                req.setAttribute("totalRegister", s.getCoursesRegistered(account.getUsername(), currentTerm).size());
                if (timePeriods != null) {
                    req.setAttribute("timePeriods", timePeriods);

                    // Lấy ngày hiện tại và ngày bắt đầu, kết thúc từ timePeriods
                    Date currentDate = new Date();
                    Date startDate = timePeriods.getStartRegister();
                    Date endDate = timePeriods.getEndRegister();

                    // Kiểm tra xem currentDate có nằm trong khoảng startDate và endDate không
                    if (isDateInRange(currentDate, startDate, endDate)) {
                        req.setAttribute("validDate", true); // Nếu ngày hợp lệ
                    } else {
                        req.setAttribute("validDate", false); // Nếu không hợp lệ
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


        req.getRequestDispatcher("../views/Student/registerCourse.jsp").forward(req, resp);
    }

    // Phương thức kiểm tra ngày hiện tại có nằm trong khoảng start và end không
    private boolean isDateInRange(Date currentDate, Date startDate, Date endDate) {
        return (currentDate.equals(startDate) || currentDate.equals(endDate) ||
                (currentDate.after(startDate) && currentDate.before(endDate)));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(GetCurrentTerm.currentTerm);
        HttpSession session = req.getSession();
        StudentDBContext s = new StudentDBContext();
        Account account = (Account) session.getAttribute("account");
        Map<String, Object> responseData = new HashMap<>();
        if (account != null) {

            if (timePeriods != null) {
                responseData.put("timePeriods", timePeriods);


                Date currentDate = new Date();
                Date startDate = timePeriods.getStartRegister();
                Date endDate = timePeriods.getEndRegister();


                if (isDateInRange(currentDate, startDate, endDate)) {
                    responseData.put("validDate", true); // Nếu ngày hợp lệ
                    String coursesToRegister = req.getParameter("coursesToRegister");
                    if (s.getCoursesRegistered(account.getUsername(), 1).size() < 5) {
                        System.out.println(s.getCoursesRegistered(account.getUsername(), 1).size());
                        String sId = s.getStudentID(account.getUsername());
                        s.registerCourse(sId, Integer.parseInt(coursesToRegister), 1);
                        responseData.put("ms", "Register course successfully");
                    } else {
                        responseData.put("ms", "You can not register more than 5 courses");
                    }
                } else {
                    responseData.put("validDate", false); // Nếu không hợp lệ
                    responseData.put("ms", "expired or not yet");
                }
            }


            try {
                int currentTerm = s.getCurrentTermOfStudent(account.getUsername());

                responseData.put("courseRegister", s.getAllCourseRegisterForStudent(currentTerm + 3, 1, account.getUsername()));
                responseData.put("courseImprove", s.getCourseRegisterImprove(account.getUsername()));
                responseData.put("courseLearnAgain", s.getCourseRegisterAgain(account.getUsername()));
                responseData.put("courseRegistered", s.getCoursesRegistered(account.getUsername(), 1));
                responseData.put("totalRegister", s.getCoursesRegistered(account.getUsername(), 1).size());

                resp.setContentType("application/json");
                PrintWriter out = resp.getWriter();
                out.print(new Gson().toJson(responseData));
                out.flush();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
