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

@WebServlet(name = "listAccount", value = "/list-account")
@MultipartConfig()
public class ListAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDBContext con = new AccountDBContext();
        ArrayList<Account> listaccount = con.getAllAccount();
        request.setAttribute("listaccount", listaccount);
        request.getRequestDispatcher("views/profile/listaccount.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        AccountDBContext con = new AccountDBContext();
        ArrayList<Account> listaccount = con.getAllAccountByName(searchName);
        request.setAttribute("listaccount", listaccount);
        request.setAttribute("searchName", searchName);
        request.getRequestDispatcher("views/profile/listaccount.jsp").forward(request, response);

    }
}
