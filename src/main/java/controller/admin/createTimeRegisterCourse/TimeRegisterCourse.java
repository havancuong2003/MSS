package controller.admin.createTimeRegisterCourse;

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

@WebServlet("/admin/registerTime")
public class TimeRegisterCourse extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
        TimePeriods timePeriods = timePeriodsDBContext.getTimePeriods(currentSemester);

        SemesterDBContext semesterDBContext = new SemesterDBContext();
        Semester semester = null;
        try {
            semester = semesterDBContext.get(currentSemester);
            Semester nextSemester = semesterDBContext.get(semester.getNextSemesterID());
            req.setAttribute("nextSemester", nextSemester);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("semester", semester);
        req.setAttribute("startRange", rangeDate(semester.getEnd().toString(), 5));
        req.setAttribute("endRange", rangeDate(semester.getEnd().toString(), 4));

        req.setAttribute("timePeriods", timePeriods);
        req.getRequestDispatcher("../views/admin/createTimeRegisterCourse/timeRegisterCourse.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> responseData = new HashMap<>();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        SemesterDBContext semesterDBContext = new SemesterDBContext();
        try {
            Semester semester = semesterDBContext.get(currentSemester);
            String startDate_raw = req.getParameter("startDate");
            String endDate_raw = req.getParameter("endDate");
            responseData.put("test", startDate_raw + " " + endDate_raw + " " + semester.getEnd());


//            if (startDate_raw == null || endDate_raw == null) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be empty.");
//                resp.getWriter().write(JsonString);
//                return;
//            }
//
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            Date startDate = null;
//            Date endDate = null;
//            try {
//                startDate = format.parse(startDate_raw);
//                endDate = format.parse(endDate_raw);
//            } catch (Exception e) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: Start date and end date must be in format yyyy-MM-dd.");
//                resp.getWriter().write(JsonString);
//                return;
//            }
//
//            // same date
//            if (startDate.equals(endDate)) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be the same.");
//                resp.getWriter().write(JsonString);
//                return;
//            }
//
//            // start date after end date
//            if (startDate.after(endDate)) {
//                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//                String JsonString = objectMapper.writeValueAsString("Error: Start date cannot be after end date.");
//                resp.getWriter().write(JsonString);
//                return;
//            }

//        // same date
//        if (startDate.equals(endDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date and end date cannot be the same.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//        // start date after end date
//        if (startDate.isAfter(endDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date cannot be after end date.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//
//        LocalDate currentDate = LocalDate.now();
//        if (endDate.isBefore(currentDate) || endDate.equals(currentDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: End date must be before today.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
//
//        if (startDate.isBefore(currentDate)) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
//            String JsonString = objectMapper.writeValueAsString("Error: Start date must be before today.");
//            resp.getWriter().write(JsonString);
//            return;
//        }
//
            TimePeriodsDBContext timePeriodsDBContext = new TimePeriodsDBContext();
//
//            resp.setStatus(HttpServletResponse.SC_OK);
////        resp.getWriter().print("{\"startDate\": \"" + startDate + "\", \"endDate\": \"" + endDate + "\"}");
//
//            String description = req.getParameter("description");
//
//            if (!description.equals(currentSemester + "")) {
//                timePeriodsDBContext.createTimeRegister(startDate_raw, endDate_raw, currentSemester);
//                resp.getWriter().print("{\"res\": \"add successfully\"}");
//
//            } else {
//                timePeriodsDBContext.updateTimeRegister(startDate_raw, endDate_raw, currentSemester);
//                resp.getWriter().print("{\"res\": \"update successfully\"}");
//
//            }

            if (isWithinRange(startDate_raw, endDate_raw, semester.getEnd().toString())) {
                responseData.put("check", "true");
                String description = req.getParameter("description");

                if (!description.equals(currentSemester + "")) {
                    timePeriodsDBContext.createTimeRegister(startDate_raw, endDate_raw, currentSemester);
                    responseData.put("res", "add successfully");

                } else {
                    timePeriodsDBContext.updateTimeRegister(startDate_raw, endDate_raw, currentSemester);

                    responseData.put("res", "update successfully");

                }
                String numCoursesRegister = req.getParameter("numCourses");
                responseData.put("a", "aa");
                responseData.put("numCoursesRegister", numCoursesRegister+"aaa");
                responseData.put("b", "bb");
                if (numCoursesRegister != null) {

                    int number = Integer.parseInt(numCoursesRegister);

                    semesterDBContext.setTotalCourseRegisterForNextSemester(number, semester.getNextSemesterID());
                    System.out.println(semester.getNextSemesterID());

                }


            } else {
                responseData.put("check", "false");
                responseData.put("message", "Must be in range of " + rangeDate(semester.getEnd().toString(), 5) + " and " + rangeDate(semester.getEnd().toString(), 4));
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set status code 400 for bad request
                responseData.put("startDateRange", rangeDate(semester.getEnd().toString(), 5));
                responseData.put("endDateRange", rangeDate(semester.getEnd().toString(), 4));

            }
            Gson gson = new Gson();

            String JsonString = gson.toJson(responseData);
            resp.getWriter().write(JsonString);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }


    }

    public boolean isWithinRange(String start, String end, String endRangeDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(start);
        Date endDate = sdf.parse(end);
        Date endRangeDateParsed = sdf.parse(endRangeDate);

        // Tính toán các ngày trong khoảng thời gian yêu cầu
        Date fourWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 5);
        Date threeWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 4);

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
