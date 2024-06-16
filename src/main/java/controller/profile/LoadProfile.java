package controller.profile;

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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "loadProfile", value = "/load-profile")
@MultipartConfig()
public class LoadProfile extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProfileDBContext dao = new ProfileDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int account_id = account.getAid();
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

        request.setAttribute("account", acc);
        request.getRequestDispatcher("views/profile/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProfileDBContext dao = new ProfileDBContext();
        String account_id = request.getParameter("account_id").trim();
        String username = request.getParameter("account_username");
        String phone = request.getParameter("account_phone");
        String currentpassword = request.getParameter("currentpassword");
        String newpassword = request.getParameter("newpassword");
        String confirm_newpassword = request.getParameter("confirmnewpassword");
        if(username != null && account_id != null) {
            String user_name = username.trim();
            if(dao.getAccountByUserName(user_name) == null){
                dao.editUserName(user_name,account_id);
                response.sendRedirect("load-profile");
            } else {
                request.setAttribute("mess_username", "User name is already exist");
                doGet(request, response);
            }
//            response.sendRedirect("load-profile");
        } else if (phone != null && account_id != null) {
            if(checkPhoneLength(phone) && checkPhoneCharacters(phone)){
                if(dao.getAccountByUserPhone(phone) == null){
                    String phone_number = phone.trim();
                    dao.editPhoneNumber(phone_number,account_id);
                    doGet(request,response);
                } else {
                    request.setAttribute("mess_phone", "The phone number is already exist");
                    doGet(request,response);
                }

            } else if (!checkPhoneLength(phone) && checkPhoneCharacters(phone)){
                request.setAttribute("mess_phone", "The phone number must have 10 numbers");
                doGet(request,response);
            } else if(!checkPhoneCharacters(phone) && checkPhoneLength(phone)) {
                request.setAttribute("mess_phone", "The phone number must not have character");
                doGet(request,response);
            } else {
                request.setAttribute("mess_phone", "The phone number must have 10 numbers no character");
                doGet(request,response);
            }
        } else {
            if(currentpassword != null && newpassword != null && confirm_newpassword != null && account_id != null) {
                Account a = dao.getAccountByID(account_id);
                String current_password = currentpassword.trim();
                String new_password = newpassword.trim();
                String confirm_new_password = confirm_newpassword.trim();
                if(!current_password.equals(a.getPassword())){
                    request.setAttribute("mess_password", "Current password wrong");
                    doGet(request, response);
                } else if(!new_password.equals(confirm_new_password)){
                    request.setAttribute("mess_password", "Confirm new password wrong");
                    doGet(request, response);
                } else {
                    dao.editPassword(new_password,account_id);
                    response.sendRedirect("load-profile");
                }
            }

        }
    }
//    public boolean checkPhoneNumber(String phone) {
//        if(phone.length() != 10) {
//            return false;
//        }
//        for(char ch : phone.toCharArray()) {
//            if(Character.isLetter(ch)){
//                return false;
//            }
//        }
//        return true;
//    }
    public boolean checkPhoneLength(String phone) {
        return phone.length() == 10;
    }

    public boolean checkPhoneCharacters(String phone) {
        for (char ch : phone.toCharArray()) {
            if (Character.isLetter(ch)) {
                return false;
            }
        }
        return true;
    }
    public boolean checkEmail(String email) {
        if (email == null || email.isEmpty()) {
            return false;
        }
        return email.contains("@") && email.lastIndexOf(".") > email.indexOf("@");
    }
}

