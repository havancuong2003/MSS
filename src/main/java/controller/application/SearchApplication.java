package controller.application;

import dal.ApplicationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Application;
import model.Application_category;
import model.Application_status;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchApplication", value = "/search-application")
public class SearchApplication extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String search = request.getParameter("search");
        ApplicationDBContext dao = new ApplicationDBContext();
        List<Application_status> listApplicationStatusCategory = dao.getApplicationStatusCategory();
        String searchtxt = search.trim();
        String indexPage = request.getParameter("page");
        List<Application> listApplication = new ArrayList<>();
        int count;
        int endPage;
        if (indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        if(searchtxt != null) {
            request.setAttribute("searchtxt", searchtxt);
            count = dao.getTotalApplicationByUserName(searchtxt);
            endPage = count / 10;
            listApplication = dao.pagingApplicationByUserName(index, searchtxt);
            if(count %10 !=0){
                endPage++;
            }
            List<Application_category> listApplicationCategory = dao.getApplicationCategory();
            request.setAttribute("tag",index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listApplicationCategory", listApplicationCategory);
            request.setAttribute("listApplicationStatusCategory",listApplicationStatusCategory);
            request.setAttribute("listApplication", listApplication);
            request.getRequestDispatcher("views/application/manageapplication.jsp").forward(request, response);
        } else {
            response.sendRedirect("manage-application");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
