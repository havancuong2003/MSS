package controller.authentication;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import dal.TokenDBContext;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.EmailUtility;

@WebServlet("/SendTokenServlet")
public class GetTokenChangePassword extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
    private TokenDBContext tokenDBContext;
    private ScheduledExecutorService scheduler;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void init() throws ServletException {
        super.init();
        tokenDBContext = new TokenDBContext();
        startCleanupTask();
        host = getServletContext().getInitParameter("host");
        port = getServletContext().getInitParameter("port");
        user = getServletContext().getInitParameter("user");
        pass = getServletContext().getInitParameter("pass");


        if (host == null || port == null || user == null || pass == null) {
            try {
                throw new ServletException("Email server configuration missing in context parameters.");
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        if (scheduler != null && !scheduler.isShutdown()) {
            scheduler.shutdown();
        }

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String token = UUID.randomUUID().toString();
        long expirationTime = System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(1); // 1 phút

        response.setContentType("text/html;charset=UTF-8");

        try {
            ArrayList<String>  t= tokenDBContext.getEmailExistToken();
            if(t.contains(email)){
                tokenDBContext.updateTokenForEmailExits(email,token,System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(1));

            }else {
                tokenDBContext.saveToken(email, token, expirationTime);
            }

            EmailUtility.sendEmail(host, port, user, pass, email, "Token to change password", "Your token here: " + token + " The token will expire after 1 minute");

            String jsonResponse = "{\"message\": \"Token has been sent to your email.\"}";
            out.print(jsonResponse);
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            String jsonResponse = "{\"error\": \"Database error.\"}";
            out.print(jsonResponse);
            e.printStackTrace(); // Thêm dòng này để log lỗi chi tiết
        } catch (MessagingException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            String jsonResponse = "{\"error\": \"Error sending email.\"}";
            out.print(jsonResponse);
            e.printStackTrace(); // Thêm dòng này để log lỗi chi tiết
        } finally {
            out.flush();
            out.close();
        }

    }


    private void startCleanupTask() {
        scheduler = Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(() -> {
            try {
                cleanupExpiredTokens();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }, 0, 1, TimeUnit.MINUTES); // Xóa token sau mỗi phút
    }

    private void cleanupExpiredTokens() throws SQLException {
        long currentTime = System.currentTimeMillis();
        tokenDBContext.cleanupExpiredTokens(currentTime);
    }
}

