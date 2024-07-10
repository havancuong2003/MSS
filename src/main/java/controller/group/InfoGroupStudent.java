package controller.group;

import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

@WebServlet("/student/groupDetail")
public class InfoGroupStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupDBContext groupDBContext = new GroupDBContext();
        String id= req.getParameter("id");
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if(id ==null){
            req.setAttribute("role",groupDBContext.getRole(account.getRole_id()));
            req.getRequestDispatcher("views/notFound/notFound.jsp").forward( req, resp);
            return;
        }
        req.setAttribute("role",groupDBContext.getRole(account.getRole_id()));
        req.setAttribute("group",groupDBContext.getGroupInfo(Integer.parseInt(id)));
        req.getRequestDispatcher("../views/group/infoGroupForStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
