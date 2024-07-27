package controller.home;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Semester;
import model.TimePeriods;
import util.GetCurrentTerm;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

@WebServlet(urlPatterns = {"/admin/dashboard"})
public class AdminController extends HttpServlet {
    private final int CURRENT_SEMESTER = GetCurrentTerm.currentSemester;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        AccountDBContext adbc = new AccountDBContext();
        int roleID = account.getRole_id();
        String roleName = adbc.getRoleByRoleID(roleID);
        req.setAttribute("roleName", roleName);

        ProfileDBContext dao = new ProfileDBContext();

        int getAccountID = account.getId();
        String accountId = String.valueOf(getAccountID);
        Account acc = dao.getAccountByID(accountId);
        if (acc.getAvatar() == null) {
            req.setAttribute("img", "");
        } else {
            try {
                InputStream inputStream = dao.getPhoto(accountId);
                if (inputStream != null) {
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] photoBytes = outputStream.toByteArray();
                    String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
                    req.setAttribute("img", "not null");
                    req.setAttribute("photoBase64", photoBase64);
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        SemesterDBContext sdb = new SemesterDBContext();
        TimePeriodsDBContext tpdb = new TimePeriodsDBContext();
        TimePeriods timePeriods = tpdb.getTimePeriods(CURRENT_SEMESTER);
        GroupDBContext gdb = new GroupDBContext();
        try {
            Semester semester = sdb.get(CURRENT_SEMESTER);
            if (isCurrentDateInRange(rangeDate(semester.getEnd().toString(), 5), rangeDate(semester.getEnd().toString(), 4))) {
                if (timePeriods == null) {
                    req.setAttribute("timeRegister", "null");
                } else {
                    req.setAttribute("timeRegister", "true");
                }
            }
            else{

                req.setAttribute("timeRegister", "not null");
            }
            if (isCurrentDateInRange(rangeDate(semester.getEnd().toString(), 3), rangeDate(semester.getEnd().toString(), 2))) {
             boolean statusCreateGroup =   gdb.getStatusCreateGroup(semester.getNextSemesterID());
                System.out.println("start"+ rangeDate(semester.getEnd().toString(), 3));
                System.out.println("end"+ rangeDate(semester.getEnd().toString(), 2));
                if (!statusCreateGroup) {
                    req.setAttribute("CreateGroup", "null");
                } else {
                    req.setAttribute("CreateGroup", "true");
                }
            }
            else{

                req.setAttribute("CreateGroup", "not null");
            }

            if (isCurrentDateInRange(rangeDate(semester.getEnd().toString(), 2), rangeDate(semester.getEnd().toString(), 1))) {

                if (timePeriods == null) {
                    req.setAttribute("ChangeGroup", "null");

                } else if (timePeriods != null) {
                    if (timePeriods.getStartChangeClass() == null) {
                        req.setAttribute("ChangeGroup", "null");

                    } else {
                        req.setAttribute("ChangeGroup", "true");

                    }

                }
            }
            else{

                req.setAttribute("ChangeGroup", "not null");

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("account", account);
        req.getRequestDispatcher("../views/dashboard/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    public boolean isCurrentDateInRange(String startDateStr, String endDateStr) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startDate = formatter.parse(startDateStr);
            Date endDate = formatter.parse(endDateStr);
            Date currentDate = new Date();


            return currentDate.compareTo(startDate) >= 0 && currentDate.compareTo(endDate) <= 0;
        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }
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
