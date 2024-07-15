package controller.profile;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet(name="addNewAccount",value = "/add-New-Account")
public class AddNewAccountByAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/profile/addnewaccount.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String f_name = request.getParameter("fullname");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        String status = request.getParameter("status");

        AccountDBContext con = new AccountDBContext();

        boolean isUsernameExists = con.isUsernameExists(username);
        boolean isEmailExists = con.isEmailExists(email);
        boolean isPhoneExists = con.isPhoneExists(phone);

        if (isUsernameExists || isEmailExists || isPhoneExists) {
            request.setAttribute("errorUsername", isUsernameExists ? "Username already exists" : "");
            request.setAttribute("errorEmail", isEmailExists ? "Email already exists" : "");
            request.setAttribute("errorPhone", isPhoneExists ? "Phone already exists" : "");
            request.setAttribute("f_name", f_name);
            request.setAttribute("phone", phone);
            request.setAttribute("gender", gender);
            request.setAttribute("password", password);
            request.setAttribute("username", username);
            request.setAttribute("role", role);
            request.setAttribute("email", email);
            request.setAttribute("status", status);

            request.getRequestDispatcher("views/profile/addnewaccount.jsp").forward(request, response);
        } else {
            try {
                int account_id = con.insertAccount(username, password, f_name, phone, email, role, gender, status);
//                con.insertStudent(account_id, currentterm, majorid)
                response.sendRedirect("list-account");
            } catch (Exception e) {
                System.out.println(e);
                response.sendRedirect("add-New-Account");
            }
        }

    }

}
