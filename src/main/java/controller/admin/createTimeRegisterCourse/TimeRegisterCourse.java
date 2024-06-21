package controller.admin.createTimeRegisterCourse;

import com.fasterxml.jackson.databind.ObjectMapper;
import dal.TimePeriodsDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TimePeriods;
import util.GetCurrentTerm;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/admin/registerTime")
public class TimeRegisterCourse extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(currentSemester);
        req.setAttribute("timePeriods", timePeriods);
        req.getRequestDispatcher("../views/admin/createTimeRegisterCourse/timeRegisterCourse.jsp").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        resp.setContentType("application/json");

        String startDate_raw = req.getParameter("startDate");
        String endDate_raw = req.getParameter("endDate");

        if (startDate_raw == null || endDate_raw == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be empty.");
            resp.getWriter().write(JsonString);
            return;
        }

        LocalDate startDate = LocalDate.parse(startDate_raw);
        LocalDate endDate = LocalDate.parse(endDate_raw);

        // same date
        if (startDate.equals(endDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be the same.");
            resp.getWriter().write(JsonString);
            return;
        }

        // start date after end date
        if (startDate.isAfter(endDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date cannot be after end date.");
            resp.getWriter().write(JsonString);
            return;
        }


        LocalDate currentDate = LocalDate.now();
        if (endDate.isBefore(currentDate) || endDate.equals(currentDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: End date must be before today.");
            resp.getWriter().write(JsonString);
            return;
        }


        if (startDate.isBefore(currentDate)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date must be before today.");
            resp.getWriter().write(JsonString);
            return;
        }

        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();

        resp.setStatus(HttpServletResponse.SC_OK);
//        resp.getWriter().print("{\"startDate\": \"" + startDate + "\", \"endDate\": \"" + endDate + "\"}");

        String description = req.getParameter("description");

        if (!description.equals(currentSemester+"")) {
            timePeriodsDBContext.createTimeRegister(startDate_raw, endDate_raw, currentSemester);
            resp.getWriter().print("{\"res\": \"add successfully\"}");

        } else {
            timePeriodsDBContext.updateTimeRegister(startDate_raw, endDate_raw, currentSemester);
            resp.getWriter().print("{\"res\": \"update successfully\"}");

        }


    }
}
