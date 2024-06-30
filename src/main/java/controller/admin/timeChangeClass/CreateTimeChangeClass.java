package controller.admin.timeChangeClass;

import com.fasterxml.jackson.databind.ObjectMapper;
import dal.SemesterDBContext;
import dal.TimePeriodsDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Semester;
import model.TimePeriods;
import util.GetCurrentTerm;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@WebServlet("/admin/timeChangeClass")
public class CreateTimeChangeClass extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(currentSemester);
        if (timePeriods == null) {
            req.setAttribute("timePeriods", "null");
            req.setAttribute("status", "You Can Not Add Change Class Now Because You Need To Add Time Register Course First");
        } else {
            if (timePeriods.getStartRegister() != null && timePeriods.getEndRegister() != null) {
                req.setAttribute("timePeriods", timePeriods);
                req.setAttribute("add", true);
            } else {
                req.setAttribute("timePeriods", timePeriods);
                req.setAttribute("add", false);
            }

        }
        SemesterDBContext semesterDBContext = new SemesterDBContext();
        try {
            Semester semester = semesterDBContext.get(currentSemester);
            req.setAttribute("semester", semester);
            req.setAttribute("nextSemester",semesterDBContext.get(semester.getNextSemesterID()));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("../views/admin/TimeChangeClass/timeChangeClass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        resp.setContentType("application/json");
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(currentSemester);

        String startDate_raw = req.getParameter("startDate");
        String endDate_raw = req.getParameter("endDate");
        System.out.println(startDate_raw);
        System.out.println(timePeriods.getStartRegister());
        if (startDate_raw == null || endDate_raw == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be empty.");
            resp.getWriter().write(JsonString);
            return;
        }

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        try {
            startDate = format.parse(startDate_raw);
            endDate = format.parse(endDate_raw);
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date must be in format yyyy-MM-dd.");
            resp.getWriter().write(JsonString);
            return;
        }

        // same date
        if (startDate.equals(endDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be the same.");
            resp.getWriter().write(JsonString);
            return;
        }

        // start date after end date
        if (startDate.after(endDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date cannot be after end date.");
            resp.getWriter().write(JsonString);
            return;
        }

        SemesterDBContext semesterDBContext = new SemesterDBContext();
        try {
            Semester semester = semesterDBContext.get(currentSemester);



            if (endDate.after(semester.getEnd()) ) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
                String JsonString = objectMapper.writeValueAsString("Error: End date must be before end of current semester.");
                resp.getWriter().write(JsonString);
                return;
            }


            if (startDate.before(timePeriods.getEndRegister())) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
                String JsonString = objectMapper.writeValueAsString("Error: Start date must be after end of register course time.");
                resp.getWriter().write(JsonString);
                return;
            }


            resp.setStatus(HttpServletResponse.SC_OK);
//        resp.getWriter().print("{\"startDate\": \"" + startDate + "\", \"endDate\": \"" + endDate + "\"}");

            String description = req.getParameter("description");

            if (!description.equals(currentSemester + "")) {
                timePeriodsDBContext.createTimeChangeGroup(startDate_raw, endDate_raw, currentSemester);
                resp.getWriter().print("{\"res\": \"add successfully\"}");

            } else {
                timePeriodsDBContext.updateTimeChangeClass(startDate_raw, endDate_raw, currentSemester);
                resp.getWriter().print("{\"res\": \"update successfully\"}");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
