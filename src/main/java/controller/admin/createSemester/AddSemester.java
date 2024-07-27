package controller.admin.createSemester;
import dal.SemesterDBContext;
import dal.SlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/admin/addSemester")
public class AddSemester extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../views/admin/createSemester/addsemester.jsp").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String detail = req.getParameter("detail");
        String startParam = req.getParameter("start");
        String endParam = req.getParameter("end");
//        String isCreateParam = req.getParameter("isCreate");
        SemesterDBContext con = new SemesterDBContext();
        //check xem detail
        if(!con.checkDetailExists(detail)){
            req.setAttribute("msg", "Semester existed!");
            req.setAttribute("detail", detail);
            req.setAttribute("start", startParam);
            req.setAttribute("end", endParam);
//            req.setAttribute("isCreate", isCreateParam);
            req.getRequestDispatcher("../views/admin/createSemester/addsemester.jsp").forward(req, resp);
            return;
        }
        // Validate parameters
        boolean hasErrors = false;
        StringBuilder errorMsg = new StringBuilder();

        // Initialize variables for dates
        Date start = null;
        Date end = null;
        int isCreate = 0;

        // Validate and parse parameters
        if (detail == null || detail.trim().isEmpty()) {
            errorMsg.append("Detail is required. ");
            hasErrors = true;
        }

        try {
            start = Date.valueOf(startParam);
            end = Date.valueOf(endParam);
        } catch (IllegalArgumentException e) {
            errorMsg.append("Invalid date format. ");
            hasErrors = true;
        }

//        try {
//            isCreate = Integer.parseInt(isCreateParam);
//        } catch (NumberFormatException e) {
//            errorMsg.append("Invalid value for isCreate. ");
//            hasErrors = true;
//        }

        // Validate date sequence
        if (start != null && end != null) {
            if (start.after(end)) {
                errorMsg.append("Start date must be before end date. ");
                hasErrors = true;
            } else {
                // Validate that the start date is at least 30 days before the end date
                long daysBetween = ChronoUnit.DAYS.between(start.toLocalDate(), end.toLocalDate());
                if (daysBetween < 30) {
                    errorMsg.append("Start date must be at least 30 days before the end date. ");
                    hasErrors = true;
                }
            }
        }

        if (start != null) {
            Date currentDate = new Date(System.currentTimeMillis());
            if (start.before(currentDate)) {
                errorMsg.append("Start date cannot be in the past. ");
                hasErrors = true;
            }
        }

        SlotDBContext conSlot = new SlotDBContext();
        if (!conSlot.checkDateRangeValid(start, end)) {
            errorMsg.append("Date range is not valid. ");
            hasErrors = true;
        }

        if (hasErrors) {
            req.setAttribute("msg", errorMsg.toString());
            req.setAttribute("detail", detail);
            req.setAttribute("start", startParam);
            req.setAttribute("end", endParam);
//            req.setAttribute("isCreate", isCreateParam);

            req.getRequestDispatcher("../views/admin/createSemester/addsemester.jsp").forward(req, resp);
            return;
        }

        // If no errors, proceed with database insertion

        try {
            con.insertSemester(detail, start, end, isCreate);
            req.setAttribute("msg", "Create successfully");
            req.getRequestDispatcher("../views/admin/createSemester/addsemester.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("errorMsg", "An error occurred while creating the semester.");
            req.getRequestDispatcher("../views/admin/createSemester/addsemester.jsp").forward(req, resp);
        }
    }
}
