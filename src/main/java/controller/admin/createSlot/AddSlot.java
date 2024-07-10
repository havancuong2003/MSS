package controller.admin.createSlot;

import dal.SemesterDBContext;
import dal.SlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Slot;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

@WebServlet("/admin/addslot")
public class AddSlot extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String slotId = req.getParameter("slotId");
        SlotDBContext con = new SlotDBContext();
        boolean isDelete = con.deleteSlot(Integer.parseInt(slotId));
        if(isDelete){
            req.setAttribute("msg", "Delete successfully!");
        }else{
            req.setAttribute("msg", "Delete fail, Please check the reference items!");
        }
        req.getRequestDispatcher("viewslot").forward(req, resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            // Lấy dữ liệu từ form
            String detail = req.getParameter("detail");
            String startTimeStr = req.getParameter("startTime");
            String endTimeStr = req.getParameter("endTime");

            // Kiểm tra xem các giá trị không bị null hoặc rỗng
            if (detail == null || startTimeStr == null || endTimeStr == null || detail.isEmpty() || startTimeStr.isEmpty() || endTimeStr.isEmpty()) {
                req.setAttribute("msg", "All fields are required.");
                req.getRequestDispatcher("viewslot").forward(req, resp);
                return;
            }

            // Chuyển đổi thời gian từ string thành đối tượng LocalTime (chỉ lấy giờ và phút)
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            LocalTime startTime = LocalTime.parse(startTimeStr, formatter);
            LocalTime endTime = LocalTime.parse(endTimeStr, formatter);

            if (startTime.isBefore(endTime)) {
                // Thêm slot vào cơ sở dữ liệu
                Slot slot = new Slot(detail, Time.valueOf(startTime), Time.valueOf(endTime));
                SlotDBContext con = new SlotDBContext();
                con.addSlot(slot);
                req.setAttribute("msg", "Add successfully");
                req.getRequestDispatcher("viewslot").forward(req, resp);
            } else {
                req.setAttribute("msg", "Start time must be before end time.");
                req.getRequestDispatcher("viewslot").forward(req, resp);
            }

        } catch (DateTimeParseException e) {
            req.setAttribute("msg", "Time format error. Please use HH:mm format.");
            resp.sendRedirect("viewslot");
        }
    }
}
