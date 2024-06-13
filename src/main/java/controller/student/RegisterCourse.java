package controller.student;

import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/student/RegisterCourse")
public class RegisterCourse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        StudentDBContext s = new StudentDBContext();
        Account account = (Account) session.getAttribute("account");
        if(account!=null) {
            try {
                int currentTerm = s.getCurrentTermOfStudent(account.getUsername());
                req.setAttribute("courseRegister",s.getAllCourseRegisterForStudent(currentTerm+2,1,account.getUsername()));
                req.setAttribute("courseImprove",s.getCourseRegisterImprove(account.getUsername()));
                req.setAttribute("courseLearnAgain",s.getCourseRegisterAgain(account.getUsername()));
                req.setAttribute("courseRegistered",s.getCoursesRegistered(account.getUsername(),1));
                req.setAttribute("totalRegister",s.getCoursesRegistered(account.getUsername(),1).size());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


        req.getRequestDispatcher("../views/Student/registerCourse.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
