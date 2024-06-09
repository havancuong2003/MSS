package controller.application;

import dal.ApplicationDBContext;
import dal.adminDAO.ResponseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Application;
import model.Application_category;
import model.Response;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
@WebServlet(name = "SendResponse", value = "/send-response")
public class SendResponse extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ApplicationDBContext dao = new ApplicationDBContext();
        ResponseDBContext rdao = new ResponseDBContext();
        String application_id = request.getParameter("application_id");
//        Response r = rdao.getResponseByApplicationId(application_id);
//        String res = r.getResponse();
        List<Application_category> listApplicationCategory = dao.getApplicationCategory();
        String reject = request.getParameter("reject");
        String status = "";
        if(reject.equals("1")){
            status = "3";
        } else {
            status = "2";
        }
        Application a = dao.getApplicationById(application_id);
//        request.setAttribute("response", res);
        request.setAttribute("reject", reject);
        request.setAttribute("status",status);
        request.setAttribute("application_id", application_id);
        request.setAttribute("email",a.getStudent().getAccount().getEmail());
        request.setAttribute("reason", a.getReason());
        request.setAttribute("category_id",a.getApplicationCategory().getCategory_id());
        request.setAttribute("listApplicationCategory", listApplicationCategory);
        request.getRequestDispatcher("response.jsp").forward(request, response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String responsetxt = request.getParameter("response");
        String response_text = responsetxt.trim();
        String email = request.getParameter("email");
        String status = request.getParameter("status");
        String application_id = request.getParameter("application_id");
        ApplicationDBContext dao = new ApplicationDBContext();
        ResponseDBContext responseDAO = new ResponseDBContext();
        if(response_text == null || checkResponseCharacter(response_text)){
            request.setAttribute("mess_response_check","You must input at least ten character");
            doGet(request, response);
        } else {
            if(status.equals("3")){
                if(sendEmailReject(response_text,email)){
                    dao.editApplicationReject(application_id);
                    responseDAO.insertResponse(response_text,application_id);
                    request.setAttribute("status",status);
                    request.setAttribute("mess_response","Send reason reject successfully");
                    List<Application_category> listApplicationCategory = dao.getApplicationCategory();
                    request.setAttribute("listApplicationCategory", listApplicationCategory);
                    request.getRequestDispatcher("response.jsp").forward(request, response);
                } else {
                    request.setAttribute("mess_response","Send response failed");
                    doGet(request, response);
                }
            } else {
                if(sendEmailResponse(responsetxt,email)){

                    dao.editApplicationStatus(application_id);
                    responseDAO.insertResponse(response_text,application_id);
                    request.setAttribute("status",status);
                    request.setAttribute("mess_response","Send response successfully");
                    List<Application_category> listApplicationCategory = dao.getApplicationCategory();
                    request.setAttribute("listApplicationCategory", listApplicationCategory);
                    request.getRequestDispatcher("response.jsp").forward(request, response);
                } else {
                    request.setAttribute("mess_response","Send response failed");
                    doGet(request, response);
                }
            }
        }
    }
    public boolean checkResponseCharacter (String response){
        boolean test = false;
        if(response.length() <10){
            test = true;
        }
        return  test;
    }
    public boolean sendEmailResponse(String responsetxt, String toEmail) {
        boolean test = false;
        String fromEmail = "dinhmanhquyen0202@gmail.com";
        String password = "mlvt jqoa ozgz lekq";
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            pr.put("mail.smtp.ssl.checkserveridentity", true);
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mess.setSubject("Email Response Your Application");
            mess.setText("Response:   "+ responsetxt);
            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;

    }

    public boolean sendEmailReject(String responsetxt, String toEmail) {
        boolean test = false;
        String fromEmail = "dinhmanhquyen0202@gmail.com";
        String password = "mlvt jqoa ozgz lekq";
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            pr.put("mail.smtp.ssl.checkserveridentity", true);
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mess.setSubject("Email Reject Your Application");
            mess.setText("Reason reject:   "+ responsetxt);
            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}
