package controller.application;

import dal.AccountDBContext;
import dal.ApplicationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Application_category;
import model.Student;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "SendApplication", value = "/student/send-application")
public class SendApplication extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ApplicationDBContext dao = new ApplicationDBContext();
        List<Application_category> listApplicationCategory = dao.getApplicationCategory();
        AccountDBContext adbc = new AccountDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String role = adbc.getRoleByRoleID(account.getRole_id());
        request.setAttribute("role", role);
        request.setAttribute("listApplicationCategory", listApplicationCategory);
        request.getRequestDispatcher("/views/application/sendapplication.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationCategory_id = request.getParameter("applicationCategory");
        String reason = request.getParameter("reason");
        String reasontxt = reason.trim();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int account_id = account.getId();
        ApplicationDBContext dao = new ApplicationDBContext();
        Student student = dao.getStudentByAccountID(String.valueOf(account_id));
        if(applicationCategory_id.equals("0")){
            request.setAttribute("reason",reasontxt);
            request.setAttribute("mess_wrong","You must choose request type");
            doGet(request,response);
        } else {
            if(reasontxt == null || checkApplicationCharacter(reasontxt)){
                request.setAttribute("category_id",applicationCategory_id);
                request.setAttribute("reason",reasontxt);
                request.setAttribute("mess_wrong", "You must input at least ten character");
                doGet(request,response);
            } else {
                dao.insertApplication(reasontxt, student.getId(), applicationCategory_id);
                request.setAttribute("mess_success","Send request successfully");
                doGet(request,response);
            }
        }

    }

    public boolean checkApplicationCharacter (String application){
        boolean test = false;
        if(application.length() <10){
            test = true;
        }
        return  test;
    }
}
