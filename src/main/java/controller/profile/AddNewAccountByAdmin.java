package controller.profile;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet(name="addNewAccount",value = "/add-New-Account")
public class AddNewAccountByAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/profile/addnewaccount.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String f_name = request.getParameter("fullname");
        int gender = Integer.parseInt(request.getParameter("gender"));
        boolean check = false;
        if(gender == 0){
            check = false;
        } else{
            check = true;
        }
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        AccountDBContext con = new AccountDBContext();
        try{
            con.insertAccount(username, password, f_name, phone, email, role, check);
        } catch(Exception e) {
            System.out.println(e);
        }

        ArrayList<Account> listaccount = con.getAllAccount();
        request.setAttribute("listaccount", listaccount);
        request.getRequestDispatcher("views/profile/listaccount.jsp").forward(request, response);


//        boolean isUsernameExists = AccountDBContext.checkExistedUser(username);
    }

}
