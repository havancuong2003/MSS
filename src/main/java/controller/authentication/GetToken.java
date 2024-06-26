package controller.authentication;

import dal.TokenDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checktoken")
public class GetToken extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("inputToken.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token_input = req.getParameter("token");
        String email_reset = req.getParameter("email_reset");
        TokenDBContext tdbc = new TokenDBContext();
        String token = tdbc.getToken(email_reset);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try (PrintWriter out = resp.getWriter()) {
            if (token != null && token.equals(token_input.trim())) {
                out.print("{\"tokenValid\": true, \"email\": \"" + email_reset + "\"}");
            } else {
                out.print("{\"tokenValid\": false}");
            }
            out.flush();
        }
    }
}
