package controller.admin.createSlot;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Slot;
import dal.SlotDBContext;

@WebServlet(name = "CreateSlot", value = "/createslot")
public class CreateSlot extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/admin/createSlot/createSlot.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String detail = request.getParameter("detail");
        String startTimeStr = request.getParameter("start");
        String endTimeStr = request.getParameter("end");
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            sdf.setLenient(false);
            Date startTimeDate = sdf.parse(startTimeStr);
            Date endTimeDate = sdf.parse(endTimeStr);
            Time startTime = new Time(startTimeDate.getTime());
            Time endTime = new Time(endTimeDate.getTime());
            Slot slot = new Slot(detail, startTime, endTime);
            SlotDBContext sdb = new SlotDBContext();
            sdb.addSlot(slot);
            String mess="Registration Success!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("views/admin/createSlot/createSlot.jsp").forward(request, response);
        } catch (ParseException | IllegalArgumentException e) {
            String mess = "Invalid time format. Please enter time in hh:mm:ss format.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("views/admin/createSlot/createSlot.jsp").forward(request, response);

        }

    }
}