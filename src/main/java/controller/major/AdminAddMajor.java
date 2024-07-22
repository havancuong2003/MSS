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

@WebServlet("/admin/viewmajor")
public class AdminAddMajor extends HttpServlet {

    private boolean hasSpecialCharacter(String str) {
        return !str.matches("[a-zA-Z0-9 ]*");
    }

    private boolean isEmptyOrWhitespace(String str) {
        return str == null || str.trim().isEmpty();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/major/addmajor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String detail = req.getParameter("detail");
        boolean status = req.getParameter("status").equals("true");

        Map<String, Object> responseData = new HashMap<>();
        Gson gson = new Gson();

        // Validation checks
        if (isEmptyOrWhitespace(code) || isEmptyOrWhitespace(detail)) {
            responseData.put("message", "Code and detail cannot be empty or just whitespace.");
            String json = gson.toJson(responseData);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
            return;
        }

        if (hasSpecialCharacter(code) || hasSpecialCharacter(detail)) {
            responseData.put("message", "Code and detail cannot contain special characters.");
            String json = gson.toJson(responseData);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
            return;
        }

        MajorDBContext mdb = new MajorDBContext();
        ArrayList<Major> majors = mdb.listAllMajor();

        for (Major major : majors) {
            if (major.getCode().equals(code) || major.getDetail().equals(detail)) {
                responseData.put("message", "Code and detail of major have to be unique. Add Major Fail!");
                String json = gson.toJson(responseData);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(json);
                return;
            }
        }

        Major major = new Major();
        major.setCode(code);
        major.setDetail(detail);
        major.setStatus(status);
        mdb.addMajor(major);

        responseData.put("message", "Add Major Success!");
        String json = gson.toJson(responseData);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
