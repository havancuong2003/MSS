package controller.admin.createSlot;

import dal.SemesterDBContext;
import dal.SlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Semester;
import model.Slot;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;

@WebServlet("/admin/viewslot")
public class ViewSlot extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String msgAddSlot = (String) session.getAttribute("msgAddSlot");
        session.removeAttribute("msgAddSlot");
        String searchName = req.getParameter("searchName");
        SlotDBContext con = new SlotDBContext();
        ArrayList<Slot> slots = new ArrayList<>();
        if(searchName == null){
            slots = con.getSlots();
        }else{
            slots = con.getSlotsBySearchName(searchName);
        }
        req.setAttribute("msg", msgAddSlot);
        req.setAttribute("slots", slots);
        req.setAttribute("searchName", searchName);
        req.getRequestDispatcher("../views/admin/createSlot/viewslot.jsp").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        try {
            // Lấy dữ liệu từ form
            String detail = req.getParameter("detail");
            String startTimeStr = req.getParameter("startTime");
            String endTimeStr = req.getParameter("endTime");
            if(req.getParameter("id") == null || req.getParameter("id").isEmpty()){
                doGet(req, resp);
            }
            int id = Integer.parseInt(req.getParameter("id"));

            // Kiểm tra xem các giá trị không bị null hoặc rỗng
            if (detail == null || startTimeStr == null || endTimeStr == null || detail.isEmpty() || startTimeStr.isEmpty() || endTimeStr.isEmpty()) {
                session.setAttribute("msgAddSlot", "All fields are required.");
                doGet(req, resp);
                return;
            }

            // Chuyển đổi thời gian từ string thành đối tượng LocalTime
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
            LocalTime startTime;
            LocalTime endTime;
            if(startTimeStr.length() == 5){
                 startTime = LocalTime.parse(startTimeStr + ":00", formatter);
            }else{
                 startTime = LocalTime.parse(startTimeStr , formatter);
            }

            if(endTimeStr.length() == 5){
                 endTime = LocalTime.parse(endTimeStr + ":00", formatter);
            }else{
                 endTime = LocalTime.parse(endTimeStr , formatter);
            }

            if (startTime.isBefore(endTime)) {
                Slot slot = new Slot(id, detail, Time.valueOf(startTime), Time.valueOf(endTime));
                SlotDBContext con = new SlotDBContext();
                con.updateSlot(slot);
                session.setAttribute("msgAddSlot", "Update successfully");
                doGet(req, resp);
                return;
            } else {
                session.setAttribute("msgAddSlot", "Start time must be before end time.");
                doGet(req, resp);
                return;
            }
        } catch (NumberFormatException e) {
            session.setAttribute("msgAddSlot", "Invalid ID format.");
            doGet(req, resp);
        } catch (DateTimeParseException e) {
            session.setAttribute("msgAddSlot", "Time format error. Please use HH:mm format.");
            doGet(req, resp);
        }
    }
}
