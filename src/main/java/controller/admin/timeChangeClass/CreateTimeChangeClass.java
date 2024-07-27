package controller.admin.timeChangeClass;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
            req.setAttribute("startRange", rangeDate(semester.getEnd().toString(), 2));
            req.setAttribute("endRange", rangeDate(semester.getEnd().toString(), 1));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("../views/admin/TimeChangeClass/timeChangeClass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String,Object>  responseData = new HashMap<>();
        resp.setContentType("application/json");
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(currentSemester);

        String startDate_raw = req.getParameter("startDate");
        String endDate_raw = req.getParameter("endDate");

//        System.out.println(startDate_raw);
//        System.out.println(timePeriods.getStartRegister());
        if (startDate_raw == null || endDate_raw == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be empty.");
            resp.getWriter().write(JsonString);
            return;
        }
//
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//        Date startDate = null;
//        Date endDate = null;
//        try {
//            startDate = format.parse(startDate_raw);
//            endDate = format.parse(endDate_raw);
//        } catch (Exception e) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date must be in format yyyy-MM-dd.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//        // same date
//        if (startDate.equals(endDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be the same.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//        // start date after end date
//        if (startDate.after(endDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date cannot be after end date.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//        SemesterDBContext semesterDBContext = new SemesterDBContext();
//        try {
//            Semester semester = semesterDBContext.get(currentSemester);
//
//
//
//            if (endDate.after(semester.getEnd()) ) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: End date must be before end of current semester.");
//                resp.getWriter().write(JsonString);
//                return;
//            }
//
//
//            if (startDate.before(timePeriods.getEndRegister())) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: Start date must be after end of register course time.");
//                resp.getWriter().write(JsonString);
//                return;
//            }
//
//
//            resp.setStatus(HttpServletResponse.SC_OK);
////        resp.getWriter().print("{\"startDate\": \"" + startDate + "\", \"endDate\": \"" + endDate + "\"}");
//
//            String description = req.getParameter("description");
//
//            if (!description.equals(currentSemester + "")) {
//                timePeriodsDBContext.createTimeChangeGroup(startDate_raw, endDate_raw, currentSemester);
//                resp.getWriter().print("{\"res\": \"add successfully\"}");
//
//            } else {
//                timePeriodsDBContext.updateTimeChangeClass(startDate_raw, endDate_raw, currentSemester);
//                resp.getWriter().print("{\"res\": \"update successfully\"}");
//            }
        try{
            SemesterDBContext semesterDBContext = new SemesterDBContext();
            Semester semester = semesterDBContext.get(currentSemester);
            if(isWithinRange(startDate_raw, endDate_raw, semester.getEnd().toString())){
                resp.setStatus(HttpServletResponse.SC_OK);
                String description = req.getParameter("description");

            if (!description.equals(currentSemester + "")) {
                timePeriodsDBContext.createTimeChangeGroup(startDate_raw, endDate_raw, currentSemester);
               responseData.put("res", "add successfully");

            } else {
                timePeriodsDBContext.updateTimeChangeClass(startDate_raw, endDate_raw, currentSemester);
                responseData.put("res", "update successfully");
            }

            }else{
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
                responseData.put("res", "Error: End date must be before end of current semester.");
                responseData.put("message", "Must be within "+rangeDate(semester.getEnd().toString(), 2) + " to " + rangeDate(semester.getEnd().toString(), 1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Gson gson = new Gson();
        String JsonString = gson.toJson(responseData);
        resp.getWriter().write(JsonString);

    }


    public boolean isWithinRange(String start, String end, String endRangeDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(start);
        Date endDate = sdf.parse(end);
        Date endRangeDateParsed = sdf.parse(endRangeDate);

        // Tính toán các ngày trong khoảng thời gian yêu cầu
        Date fourWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 2);
        Date threeWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 1);

        // Định dạng lại ngày để so sánh dễ dàng hơn
        String formattedFourWeeksBeforeEndRangeDate = sdf.format(fourWeeksBeforeEndRangeDate);
        String formattedThreeWeeksBeforeEndRangeDate = sdf.format(threeWeeksBeforeEndRangeDate);

        // Chuyển đổi lại thành Date để so sánh
        Date rangeStartDate = sdf.parse(formattedFourWeeksBeforeEndRangeDate);
        Date rangeEndDate = sdf.parse(formattedThreeWeeksBeforeEndRangeDate);

        System.out.println("fourWeeksBeforeEndRangeDate: " + formattedFourWeeksBeforeEndRangeDate);
        System.out.println("threeWeeksBeforeEndRangeDate: " + formattedThreeWeeksBeforeEndRangeDate);

        // Kiểm tra startDate và endDate có nằm trong khoảng yêu cầu hay không
        return (startDate.compareTo(rangeStartDate) >= 0 && startDate.compareTo(rangeEndDate) <= 0)
                && (endDate.compareTo(rangeStartDate) >= 0 && endDate.compareTo(rangeEndDate) <= 0);
    }

    private Date subtractWeeks(Date date, int weeks) {
        long millisecondsPerWeek = 7L * 24 * 60 * 60 * 1000;
        return new Date(date.getTime() - weeks * millisecondsPerWeek);
    }

    public String rangeDate(String endDate, int weeks) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sdf.parse(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long millisecondsPerWeek = 7L * 24 * 60 * 60 * 1000;
        return sdf.format(new Date(date.getTime() - weeks * millisecondsPerWeek));
    }



}
