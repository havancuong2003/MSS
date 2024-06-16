package controller.application;

import dal.ResponseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Response;

import java.io.IOException;

@WebServlet(name = "viewResponse", value = "/admin/view-response")
public class ViewResponse extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ResponseDBContext rdao = new ResponseDBContext();
        String application_id = request.getParameter("application_id");
        Response r = rdao.getResponseByApplicationId(application_id);
        String res = r.getResponse();
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(res);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
