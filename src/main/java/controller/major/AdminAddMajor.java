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

@WebServlet("/admin/addmajor")
public class AdminAddMajor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/major/addmajor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String detail = req.getParameter("detail");
        boolean status = req.getParameter("status").equals("true");
        MajorDBContext mdb = new MajorDBContext();
        ArrayList<Major> majors = new ArrayList<>();
        majors = mdb.listAllMajor();
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        Map<String,Object> responseData = new HashMap<>();
        for (Major major : majors) {
            if (major.getCode().equals(code) || major.getDetail().equals(detail)) {
                responseData.put("message","Code and detail of major have to be unique. Add Major Fail!");
                Gson gson = new Gson();
                String json = gson.toJson(responseData);
                resp.getWriter().write(json);
                return;
            }
        }
        Major major = new Major();
        major.setCode(code);
        major.setDetail(detail);
        major.setStatus(status);
        mdb.addMajor(major);
        responseData.put("message","Add Major Success!");
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        resp.getWriter().write(json);
    }
//        resp.sendRedirect("/admin/listmajor");}
}
