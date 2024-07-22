package controller.profile;

import com.google.gson.Gson;
import dal.AccountDBContext;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Exercise;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "loadProfile", value = "/load-profile")
@MultipartConfig()
public class LoadProfile extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProfileDBContext dao = new ProfileDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int account_id = account.getId();
        String accountId = String.valueOf(account_id);
        Account acc = dao.getAccountByID(accountId);

        AccountDBContext adbc = new AccountDBContext();
        String role = adbc.getRoleByRoleID(account.getRole_id());
        request.setAttribute("role", role);

        if(acc.getAvatar() == null){
            request.setAttribute("img","");
        } else {
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
            } catch (IOException e){
                e.printStackTrace();
            }
        }
        List<Account> listAccount = dao.getListAccount();
        List<String> username = listAccount.stream()
                .map(Account::getUsername) // assuming getName() method exists
                .collect(Collectors.toList());
        request.setAttribute("username", new Gson().toJson(username));
        request.setAttribute("currentPassword",acc.getPassword());
        request.setAttribute("account", acc);
        request.getRequestDispatcher("views/profile/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProfileDBContext dao = new ProfileDBContext();
        String account_id = request.getParameter("account_id").trim();
        Account account = dao.getAccountByID(account_id);
        String username = request.getParameter("account_username");
        String phone = request.getParameter("account_phone");
        String currentpassword = request.getParameter("currentpassword");
        String newpassword = request.getParameter("newpassword");
        String confirm_newpassword = request.getParameter("confirmnewpassword");
        String user_name = "";
        String phone_number = "";
        if(username !=null){
            user_name = username.trim();
        }
        if(phone != null){
            phone_number = phone.trim();
        }
        if(username != null && account_id != null && phone != null) {
            if(!user_name.equals(account.getUsername())){
                if (dao.getAccountByUserName(user_name) == null) {
                    dao.editUserName(user_name, account_id, phone_number);
                    doGet(request, response);
                } else {
                    request.setAttribute("mess_username", "User name is already exist");
                    doGet(request, response);
                }
            } else {
                dao.editUserName(user_name,account_id,phone_number);
                doGet(request,response);
            }
        }
        if(currentpassword != null && newpassword != null && confirm_newpassword != null && account_id != null) {
            Account a = dao.getAccountByID(account_id);
            String current_password = currentpassword.trim();
            String new_password = newpassword.trim();
            String confirm_new_password = confirm_newpassword.trim();
//            if(!current_password.equals(a.getPassword())){
//                request.setAttribute("mess_password", "Current password wrong");
//                doGet(request, response);
//            } else if(!new_password.equals(confirm_new_password)){
//                request.setAttribute("mess_password", "Confirm new password wrong");
//                doGet(request, response);
//            } else {
            dao.editPassword(new_password,account_id);
            doGet(request,response);
        }

    }
}

