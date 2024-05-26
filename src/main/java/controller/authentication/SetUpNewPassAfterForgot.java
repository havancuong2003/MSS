package controller.authentication;


import java.io.IOException;
import java.io.PrintWriter;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChangePasswordServlet")
public class SetUpNewPassAfterForgot extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("changepass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        String newPassword = req.getParameter("newPassword");
        String emailToChange = req.getParameter("email_to_change");
        System.out.println(newPassword);
        System.out.println(emailToChange);
        PrintWriter out = resp.getWriter();
        try {

            if (newPassword == null || emailToChange == null) {
                out.print("{\"error\": \"Missing parameters\"}");
                return;
            }

            AccountDBContext acd = new AccountDBContext();
            acd.changePassword(emailToChange, newPassword);

            out.print("{\"success\": \"" + newPassword + "\"}");

        } catch (Exception e) {
            out.print("{\"error\": \"Error\"}");
            e.printStackTrace();
        } finally {
            out.flush();
            out.close();
        }


    }
}