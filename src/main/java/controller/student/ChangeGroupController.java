package controller.student;

import dal.ChangeGroupDBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
import dal.TimePeriodsDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ChangeGroup;
import model.TimePeriods;
import util.GetCurrentTerm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/student/changeGroup")
public class ChangeGroupController extends HttpServlet {
    private final int currentSemester = GetCurrentTerm.currentSemester;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChangeGroupDBContext cgdb = new ChangeGroupDBContext();
        GroupDBContext gdb = new GroupDBContext();
        StudentDBContext sdb = new StudentDBContext();
        TimePeriodsDBContext tpdb = new TimePeriodsDBContext();


        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        req.setAttribute("groups",gdb.getGroupForStudent(currentSemester,account.getUsername()));
        req.setAttribute("studentid",sdb.getStudentID(account.getUsername()));

        ArrayList<ChangeGroup> allRequired = cgdb.getAllRequired(account.getUsername(),currentSemester);
        ArrayList<ChangeGroup> allRequiredFromSomeOne = cgdb.getAllRequiredToSwap(account.getUsername(),currentSemester);


        req.setAttribute("allRequired", allRequired);
        req.setAttribute("allRequiredFromSomeOne", allRequiredFromSomeOne);

        req.setAttribute("sizeRequired", allRequired.size());
        req.setAttribute("sizeRequiredFromSomeOne", allRequiredFromSomeOne.size());
        req.setAttribute("s",currentSemester);

        TimePeriods timePeriods = tpdb.getTimePeriods(currentSemester);
        if (timePeriods != null) {
            req.setAttribute("timePeriods", timePeriods);

            // Lấy ngày hiện tại và ngày bắt đầu, kết thúc từ timePeriods
            Date currentDate = new Date();
            Date startDate = timePeriods.getStartChangeClass();
            Date endDate = timePeriods.getEndChangeClass();

            // Kiểm tra xem currentDate có nằm trong khoảng startDate và endDate không
            if (isDateInRange(currentDate, startDate, endDate)) {
                req.setAttribute("validDate", true); // Nếu ngày hợp lệ
            } else {
                req.setAttribute("validDate", false); // Nếu không hợp lệ
            }
        }
        else {
            req.setAttribute("timePeriods", "null");
        }

        req.getRequestDispatcher("../views/Student/changeGroup.jsp").forward(req, resp);
    }
    // Phương thức kiểm tra ngày hiện tại có nằm trong khoảng start và end không
    private boolean isDateInRange(Date currentDate, Date startDate, Date endDate) {
        return (currentDate.equals(startDate) || currentDate.equals(endDate) ||
                (currentDate.after(startDate) && currentDate.before(endDate)));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
