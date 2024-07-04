package controller.grade;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountDBContext;
import dal.MarkDBContext;
import dal.SemesterDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/teacher/takegrade")
public class TeacherTakeGradeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account acc = (Account) req.getSession().getAttribute("account");
        AccountDBContext accDB = new AccountDBContext();
        String tid = accDB.getIdUserByAccountId(acc.getId());
        SemesterDBContext seDB = new SemesterDBContext();
        req.setAttribute("semester", seDB.getSemesterForTeacher(tid));
        req.getRequestDispatcher("/views/grade/teacherGrade.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        Map<String, String[]> parameterMap = req.getParameterMap();
        JsonObject result = new JsonObject();
        MarkDBContext mdb = new MarkDBContext();

        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            if (entry.getKey().startsWith("marks")) {
                String[] a = entry.getKey().split("-");
                String studentId = a[1];
                String item = a[2];
                int gid = Integer.parseInt(a[3]);
                int itemId = mdb.getGradeItemByItemAndGroup(gid, item);

                String graderaw = entry.getValue()[0];
                if (graderaw != null && !graderaw.trim().isEmpty()) { // Kiểm tra giá trị trống
                    try {
                        float grade = Float.parseFloat(graderaw);
                        if (mdb.checkMarkExist(studentId, itemId, gid)) {
                            mdb.updateMark(studentId, grade, itemId, gid);
                        } else {
                            mdb.insertMark(studentId, grade, itemId, gid);
                        }
                    } catch (NumberFormatException e) {
                        // Nếu có lỗi chuyển đổi, bỏ qua giá trị này
                        // Có thể ghi log hoặc xử lý theo yêu cầu
                        e.printStackTrace();
                    }
                }
            }
        }

        result.addProperty("success", true);
        result.addProperty("message", "Grades saved successfully!");

        out.write(new Gson().toJson(result));
        out.flush();
    }

}
