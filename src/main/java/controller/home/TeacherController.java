package controller.home;

import dal.AccountDBContext;
import dal.ExerciseDBContext;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Group;
import model.Teacher;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

@WebServlet(urlPatterns = "/teacher/dashboard")
public class TeacherController extends HttpServlet {
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
        ExerciseDBContext edao = new ExerciseDBContext();
        Teacher teacher = dao.getTeacherIdByAccountId(accountId);
        List<Group> listGroup = edao.getListGroup(teacher.getTid());
        req.setAttribute("account", account);
        req.setAttribute("listGroup", listGroup);
        req.getRequestDispatcher("../views/dashboard/teacher.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
