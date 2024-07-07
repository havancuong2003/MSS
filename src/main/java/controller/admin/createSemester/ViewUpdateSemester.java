package controller.admin.createSemester;

import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Semester;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet("/admin/viewupdatesemester")
public class ViewUpdateSemester extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchName = req.getParameter("searchName");
        SemesterDBContext con = new SemesterDBContext();
        ArrayList<Semester> semesters = new ArrayList<>();
        if(searchName == null){
            semesters = con.getAlSemesterBySearchName("");
        }else{
            semesters = con.getAlSemesterBySearchName(searchName);
        }
        req.setAttribute("semesters", semesters);
        req.setAttribute("searchName", searchName);
        req.getRequestDispatcher("../views/admin/createSemester/viewupdatesemester.jsp").forward(req, resp);

    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

    }
}
