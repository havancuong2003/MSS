package controller.curriculum;

import dal.CurriculumDBContext;
import dal.MajorDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Major;
import model.Term;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet({"/student/viewCurriculum", "/admin/viewCurriculum", "/teacher/viewCurriculum", "/staff/viewCurriculum"})
public class CurriculumController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MajorDBContext m = new MajorDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        CurriculumDBContext c = new CurriculumDBContext();
        try {
            Major major = m.getMajorByUserName(account.getUsername());
           int majorID = 1;
            if(major != null){
                majorID=  major.getId();
            }
       ArrayList<Term> curriculum = c.getTermForCurriculum(majorID);
        req.setAttribute("terms", curriculum);
        req.setAttribute("majors",m.listAllMajor());
        req.setAttribute("majorSelected",majorID);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("../views/curriculum/curriculum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String majorID= req.getParameter("majorId");
        MajorDBContext m = new MajorDBContext();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        CurriculumDBContext c = new CurriculumDBContext();
        try {
//            Major major = m.getMajorByUserName(account.getUsername());
            ArrayList<Term> curriculum = c.getTermForCurriculum(Integer.parseInt(majorID));
            req.setAttribute("terms", curriculum);
            req.setAttribute("majors",m.listAllMajor());
            req.setAttribute("majorSelected",Integer.parseInt(majorID));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("../views/curriculum/curriculum.jsp").forward(req, resp);
    }
}
