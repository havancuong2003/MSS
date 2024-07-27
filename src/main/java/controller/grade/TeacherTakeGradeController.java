package controller.grade;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountDBContext;
import dal.MarkDBContext;
import dal.SemesterDBContext;
import dal.TotalDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Mark;
import model.Total;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        TotalDBContext tdb = new TotalDBContext();
        Map<String, String[]> parameterMap = req.getParameterMap();
        JsonObject result = new JsonObject();
        MarkDBContext mdb = new MarkDBContext();
        SemesterDBContext seDB = new SemesterDBContext();
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
                            int numItem = tdb.count(gid);
                            int markItem = mdb.countMarkOfStudent(gid, studentId);
                            if (markItem == numItem) {
                                ArrayList<Mark> marks = mdb.getMarkForStudent(studentId, gid, seDB.getSemesterByGid(gid));
                                float total = 0;
                                for (Mark mark : marks) {
                                    if (mark.getGrade() == null) {
                                        total += 0;
                                    } else {
                                        total += mark.getGrade() * mark.getGradeItem().getWeight() / 100;
                                    }
                                }
                                String formattedTotal = String.format("%.2f", total);
                                float roundedTotal = Float.parseFloat(formattedTotal);
                                Total to = tdb.getTotalBySidAndGid(studentId, gid);
                                if (!to.getReason().equals("absent > 20%")) {
                                    if (roundedTotal >= 5.0) {
                                        tdb.updateTotal(to.getId(), roundedTotal, true, "passed");
                                    } else {
                                        tdb.updateTotal(to.getId(), roundedTotal, false, "total < 5");
                                    }
                                }
                            }
                        } else {
                            mdb.insertMark(studentId, grade, itemId, gid);
                            int numItem = tdb.count(gid);
                            int markItem = mdb.countMarkOfStudent(gid, studentId);
                            if (markItem == numItem) {
                                ArrayList<Mark> marks = mdb.getMarkForStudent(studentId, gid, seDB.getSemesterByGid(gid));
                                float total = 0;
                                for (Mark mark : marks) {
                                    if (mark.getGrade() == null) {
                                        total += 0;
                                    } else {
                                        total += mark.getGrade() * mark.getGradeItem().getWeight() / 100;
                                    }
                                }
                                String formattedTotal = String.format("%.2f", total);
                                float roundedTotal = Float.parseFloat(formattedTotal);
                                Total to = tdb.getTotalBySidAndGid(studentId, gid);
                                if (!to.isPass() && !to.getReason().equals("absent > 20%")) {
                                    if (roundedTotal >= 5.0) {
                                        tdb.updateTotal(to.getId(), roundedTotal, true, "passed");
                                    } else {
                                        tdb.updateTotal(to.getId(), roundedTotal, false, "total < 5");
                                    }
                                }
                            }
                            if (markItem == 1) {
                                tdb.insertTotal(studentId, gid, 0, false, "studying");
                            }
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
