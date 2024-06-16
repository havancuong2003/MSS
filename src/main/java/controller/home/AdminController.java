package controller.home;

import dal.AccountDBContext;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(urlPatterns = {"/admin/dashboard"})
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        AccountDBContext adbc = new AccountDBContext();
        int roleID = account.getRole_id();
        String roleName= adbc.getRoleByRoleID(roleID);
        req.setAttribute("roleName", roleName);

        ProfileDBContext dao = new ProfileDBContext();

        int getAccountID = account.getAid();
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
        req.setAttribute("account", account);
        req.getRequestDispatcher("../views/dashboard/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
