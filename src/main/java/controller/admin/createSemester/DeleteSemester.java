package controller.admin.createSemester;


import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Semester;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/deletesemester")
public class DeleteSemester extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String semesterId = req.getParameter("semesterId");
        SemesterDBContext con = new SemesterDBContext();
        boolean isDelete =  con.deleteSemester(Integer.parseInt(semesterId));
        if(isDelete){
            req.setAttribute("msg", "Delete successfully!");
        }else{
            req.setAttribute("msg", "Delete fail! This semester is in use!");
        }
        req.getRequestDispatcher("viewupdatesemester").forward(req, resp);

    }
}
