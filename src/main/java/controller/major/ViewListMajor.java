package controller.major;

import com.google.gson.Gson;
import dal.MajorDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Major;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/viewlistmajor")
public class ViewListMajor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        MajorDBContext mdb = new MajorDBContext();
        ArrayList<Major> majors = new ArrayList<>();
        if (search == null || search.isBlank() || search.isEmpty()){
            majors = mdb.listAllMajor();
        }else {
            majors = mdb.getSearchMajor(search);
        }
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("majors", majors);
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);
    }
}
