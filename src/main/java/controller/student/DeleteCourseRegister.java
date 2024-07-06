package controller.student;

import dal.SemesterDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Semester;
import util.GetCurrentTerm;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/student/deleteCourseRegister")
public class DeleteCourseRegister extends HttpServlet {
    private int currentTerm = GetCurrentTerm.currentSemester;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        StudentDBContext s = new StudentDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        SemesterDBContext semesterDBContext = new SemesterDBContext();
        try {
            if (id != null) {
                Semester semester = semesterDBContext.get(currentTerm);
                int courseID = Integer.parseInt(id);
                s.deleteCourseRegister(account.getUsername(), semester.getNextSemesterID(), courseID);
                System.out.println("donee");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        resp.sendRedirect("RegisterCourse");
    }
}
