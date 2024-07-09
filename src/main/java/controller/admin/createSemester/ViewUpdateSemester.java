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
        // Lấy thông tin từ request
        int id = Integer.parseInt(req.getParameter("id"));
        String detail = req.getParameter("detail");
        String startParam = req.getParameter("startDate");
        String startBL5Param = req.getParameter("startBL5");
        String endParam = req.getParameter("endDate");
        String isCreateParam = req.getParameter("isCreate");

        // Validate parameters
        boolean hasErrors = false;
        StringBuilder errorMsg = new StringBuilder();

        // Initialize variables for dates
        Date start = null;
        Date startBL5 = null;
        Date end = null;
        int isCreate = 0;

        // Validate and parse parameters
        if (detail == null || detail.trim().isEmpty()) {
            errorMsg.append("Detail is required. ");
            hasErrors = true;
        }

        try {
            start = Date.valueOf(startParam);
            startBL5 = Date.valueOf(startBL5Param);
            end = Date.valueOf(endParam);
        } catch (IllegalArgumentException e) {
            errorMsg.append("Invalid date format. ");
            hasErrors = true;
        }

        try {
            isCreate = Integer.parseInt(isCreateParam);
        } catch (NumberFormatException e) {
            errorMsg.append("Invalid value for isCreate. ");
            hasErrors = true;
        }

        // Validate date sequence
        if (start != null && startBL5 != null && end != null) {
            if (start.after(startBL5) || startBL5.after(end)) {
                errorMsg.append("Dates are not in the correct sequence. ");
                hasErrors = true;
            }
        }

        if (hasErrors) {
            req.setAttribute("msg", errorMsg.toString());
            req.setAttribute("detail", detail);
            req.setAttribute("start", startParam);
            req.setAttribute("startBL5", startBL5Param);
            req.setAttribute("end", endParam);
            req.setAttribute("isCreate", isCreateParam);

            doGet(req, resp);
            return;
        }

        // Tạo đối tượng Semester
        Semester semester = new Semester(id, detail, start, startBL5, end, isCreate);

        SemesterDBContext con = new SemesterDBContext();
        con.updateSemester(semester);
        doGet(req, resp);
    }
}
