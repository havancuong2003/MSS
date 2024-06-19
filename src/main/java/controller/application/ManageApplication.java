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
import model.Application;
import model.Application_category;
import model.Application_status;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ManageApplication", value = "/admin/manage-application")
public class ManageApplication extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ApplicationDBContext dao = new ApplicationDBContext();
        List<Application_category> listApplicationCategory = dao.getApplicationCategory();
        List<Application_status> listApplicationStatusCategory = dao.getApplicationStatusCategory();
        AccountDBContext adbc = new AccountDBContext();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String role = adbc.getRoleByRoleID(account.getRole_id());
        request.setAttribute("role", role);
        String status = request.getParameter("status");
        String applicationCategory = request.getParameter("applicationCategory");
        String indexPage = request.getParameter("page");
        List<Application> listApplication = new ArrayList<Application>();
        int count =0;
        int endPage =0;
        if (indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        if(status == null && applicationCategory == null){
            count = dao.getTotalApplication();
            endPage = count/10;
            listApplication = dao.pagingApplication(index);
            status = "0";
            applicationCategory = "0";
        } else {
            if(status.equals("0") && !applicationCategory.equals("0")){
                count = dao.getTotalApplicationByCategory(applicationCategory);
                endPage = count/10;
                listApplication = dao.pagingApplicationByCategory(index, applicationCategory);
            } else if(!status.equals("0") && applicationCategory.equals("0")){
                count = dao.getTotalApplicationByStatus(status);
                endPage = count/10;
                listApplication = dao.pagingApplicationByStatus(index,status);
            }  else if(!status.equals("0") && !applicationCategory.equals("0")){
                count = dao.getTotalApplicationByStatusAndCategory(status,applicationCategory);
                endPage = count/10;
                listApplication = dao.pagingApplicationByStatusAndCategory(index,status,applicationCategory);
            } else {
//                request.setAttribute("mess", "You must choose status or application type");
                count = dao.getTotalApplication();
                endPage = count/10;
                listApplication = dao.pagingApplication(index);
            }
        }
        if(count % 10 != 0){
            endPage++;
        }

        for(Application application : listApplication){
            application.setReason(getCharacterOfReason(application.getReason()) + "...");
        }
        if(listApplication.size() == 0){
            request.setAttribute("mess","No data found");
        }

        request.setAttribute("tag",index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("status",status);
        request.setAttribute("applicationCategory",applicationCategory);
        request.setAttribute("listApplicationStatusCategory",listApplicationStatusCategory);
        request.setAttribute("listApplicationCategory", listApplicationCategory);
        request.setAttribute("listApplication", listApplication);
        request.getRequestDispatcher("/views/application/manageapplication.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public String getCharacterOfReason(String reason) {
        if (reason == null) {
            return null;
        }
        if (reason.length() <= 30) {
            return reason;
        }
        return reason.substring(0, 30);
    }
}
