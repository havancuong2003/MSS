package controller.admin.createMajor;

import dal.MajorDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Major;

import java.io.IOException;
@WebServlet(name = "CreateMajor", value = "/createmajor")
public class CreateMajor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/admin/createMajor/createMajor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String detail = request.getParameter("detail");
        Major major = new Major(code, detail);
        MajorDBContext mdb = new MajorDBContext();
        mdb.addMajor(major);
        request.setAttribute("mess","Add Major Succesfull");
        request.getRequestDispatcher("views/admin/createMajor/createMajor.jsp").forward(request,response);
    }
}