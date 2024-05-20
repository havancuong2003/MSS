package controller.authentication;

import com.google.gson.Gson;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountDBContext adbc = new AccountDBContext();

        try {
            Account account = adbc.getAccount(username, password);
            PrintWriter out = resp.getWriter();
            Gson gson = new Gson();
            if (account != null) {
                req.getSession().setAttribute("account", account);
                resp.setStatus(HttpServletResponse.SC_OK);
                out.print(gson.toJson("Login successful"));
            } else {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                String errorMessage = "Username or password is incorrect";
                out.print(gson.toJson(errorMessage));
            }
            out.flush();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
