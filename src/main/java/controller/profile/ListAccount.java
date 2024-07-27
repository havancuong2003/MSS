package controller.profile;

import dal.AccountDBContext;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;

@WebServlet(name = "listAccount", value = "/admin/list-account")
@MultipartConfig()
public class ListAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDBContext con = new AccountDBContext();
        ArrayList<Account> listaccount = con.getAllAccount();
        request.setAttribute("listaccount", listaccount);
        request.getRequestDispatcher("../views/profile/listaccount.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDBContext con = new AccountDBContext();
        if(request.getParameter("aid") != null) {
            String aid = request.getParameter("aid");
            String status = request.getParameter("status");
            if(status.equals("0")) {
                status = "active";
            }else{
                status = "deactive";
            }
            con.updateAccountStatus(Integer.parseInt(aid), status);
            doGet(request, response);

        }else{
            String searchName = request.getParameter("searchName");
            ArrayList<Account> listaccount = con.getAllAccountByName(searchName);
            request.setAttribute("listaccount", listaccount);
            request.setAttribute("searchName", searchName);
            request.getRequestDispatcher("views/profile/listaccount.jsp").forward(request, response);
        }
    }
}
