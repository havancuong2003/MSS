package controller.profile;

import dal.AccountDBContext;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "loadPhoto", value = "/load-photo")
@MultipartConfig()
public class LoadPhoto extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProfileDBContext dao = new ProfileDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int account_id = account.getId();
        String accountId = String.valueOf(account_id);
        Account acc = dao.getAccountByID(accountId);
        try {
            InputStream inputStream = dao.getPhoto(accountId);
            if(inputStream != null) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] photoBytes = outputStream.toByteArray();
                String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
                request.setAttribute("img","not null");
                request.setAttribute("photoBase64", photoBase64);
                inputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        request.setAttribute("account", acc);


        AccountDBContext adbc = new AccountDBContext();
        String role = adbc.getRoleByRoleID(account.getRole_id());

        request.setAttribute("role", role);

        request.getRequestDispatcher("views/profile/profile.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProfileDBContext dao = new ProfileDBContext();
        String account_id = request.getParameter("account_id").trim();

        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
            dao.insertPhoto(inputStream, account_id);
            doGet(request, response);
        }
    }
}
