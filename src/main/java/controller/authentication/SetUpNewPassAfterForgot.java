package controller.authentication;


import java.io.IOException;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/changePasswordServlet")
public class SetUpNewPassAfterForgot extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("changepass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        try {
            if (!newPassword.equals(confirmPassword)) {
                throw new IllegalArgumentException("Mật khẩu mới và mật khẩu xác nhận không trùng khớp!");
            }

            AccountDBContext acd = new AccountDBContext();

            acd.changePassword("cuonghv", newPassword);

            req.getRequestDispatcher("changePassword.jsp").forward(req, resp); // Chuyển trang
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("changepass.jsp").forward(req, resp);
        }


    }
}