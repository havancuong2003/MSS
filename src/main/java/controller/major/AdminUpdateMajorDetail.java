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

@WebServlet("/admin/editmajor")
public class AdminUpdateMajorDetail extends HttpServlet {

    private boolean hasSpecialCharacter(String str) {
        return !str.matches("[a-zA-Z0-9 ]*");
    }

    private boolean isEmptyOrWhitespace(String str) {
        return str == null || str.trim().isEmpty();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/major/editmajor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String detail = req.getParameter("detail");
        boolean status = req.getParameter("status").equals("true");

        Map<String, Object> responseData = new HashMap<>();
        Gson gson = new Gson();

        // Validation checks
        if (isEmptyOrWhitespace(detail)) {
            responseData.put("message", "Detail cannot be empty or just whitespace. Edit Major Fail!");
            String json = gson.toJson(responseData);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
            return;
        }

        if (hasSpecialCharacter(detail)) {
            responseData.put("message", "Detail cannot contain special characters. Edit major fail!");
            String json = gson.toJson(responseData);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
            return;
        }

        MajorDBContext mdb = new MajorDBContext();
        ArrayList<Major> majors = mdb.listAllMajor();

        for (Major major : majors) {
            if (!major.getCode().equals(code) && major.getDetail().equals(detail)) {
                responseData.put("message", "Detail of major has to be unique. Edit Major Fail!");
                String json = gson.toJson(responseData);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(json);
                return;
            }
        }

        mdb.updateMajorDetail(code, detail, status);
        responseData.put("message", "Edit Major Success!");
        String json = gson.toJson(responseData);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
