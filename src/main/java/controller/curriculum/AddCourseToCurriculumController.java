package controller.curriculum;

import dal.CurriculumDBContext;
import dal.MajorDBContext;
import dal.PrequisiteCourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Curriculum;
import model.PrequisiteCourse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddCourseToCurriculum", value = "/addCourseToCurriculum")
public class AddCourseToCurriculumController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rawMajorId = req.getParameter("major");
        if (rawMajorId == null || rawMajorId.isEmpty()) {
            req.setAttribute("ms", "You have to choose a major first!");
        } else {
            int majorId = Integer.parseInt(rawMajorId);
            req.setAttribute("mid", majorId);
        }
        MajorDBContext mdb = new MajorDBContext();
        req.setAttribute("majors", mdb.listAllMajor());
        req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseIDs = req.getParameter("addedCourseIds");
        String mid = req.getParameter("mid");
        if (courseIDs == null || courseIDs.isEmpty()) {
            req.setAttribute("msSave", "You have to add a course before submit!");
            req.setAttribute("mid", req.getParameter("mid"));
            req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
            return;
        } else {
            String[] ids = courseIDs.split(",");
            ArrayList<Integer> idList = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                idList.add(Integer.parseInt(ids[i]));
            }
            CurriculumDBContext cudb = new CurriculumDBContext();
            ArrayList<Curriculum> curriculums = cudb.getCurriculumList(Integer.parseInt(mid));
            PrequisiteCourseDBContext predb = new PrequisiteCourseDBContext();
            ArrayList<PrequisiteCourse> preCourses = predb.getPrequisiteCourseList();
            ArrayList<Integer> successID = new ArrayList<>();
            for (Integer id : idList) {
                if (checkCourseHaveNoPre(id, preCourses)) {
                    int term = Integer.parseInt(req.getParameter("termNo" + id));
                    if (courseInATerm(curriculums, term) == 6) {
                        req.setAttribute("msSave", "You can only add up to 6 courses in a term!" +
                                "So you cannot add  any more courses to the " + term + " term. Add course to curriculum failed!");
                        req.setAttribute("mid", req.getParameter("mid"));
                        req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                        return;
                    } else {
                        if (successID.contains(id)) {
                        }else {
                            successID.add(id);
                        }

                    }
                } else {
                    for (PrequisiteCourse pc : preCourses) {
                        if (id == pc.getCourse().getId()) {
                            ArrayList<Course> courses = new ArrayList<>();
                            courses.add(pc.getPreCourse());
                            if (check(curriculums, courses)) {
                                int term = Integer.parseInt(req.getParameter("termNo" + id));
                                if (courseInATerm(curriculums, term) == 6) {
                                    req.setAttribute("msSave", "You can only add up to 6 courses in a term!" +
                                            "So you cannot add " + pc.getCourse().getDetail() + "to the " + term + " term.  Add course to curriculum failed!");
                                    req.setAttribute("mid", req.getParameter("mid"));
                                    req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                                    return;
                                } else {
                                    if (successID.contains(id)) {
                                    }else {
                                        successID.add(id);
                                    }
                                }
                            }else {
                                req.setAttribute("msSave", "The course " + pc.getCourse().getCode() + " has pre-requisite courses that you have not added yet!" +
                                        "Add course to curriculum failed!");
                                req.setAttribute("mid", req.getParameter("mid"));
                                req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                                return;
                            }
                        }
                    }
                }
            }
            for (Integer id : successID) {
                int term = Integer.parseInt(req.getParameter("termNo" + id));
                String description = req.getParameter("description" + id);
                if (description == null||description.isEmpty()||description.isBlank()) {
                    description = "";
                }
                cudb.AddCourseToCurriculum(Integer.parseInt(mid), id, term, description);
            }
            req.setAttribute("msSave", "Add course to curriculum successfully!");
            req.setAttribute("mid", req.getParameter("mid"));
            req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
        }
    }

    public boolean checkCourseHaveNoPre(int id, ArrayList<PrequisiteCourse> preCourses) {
        for (PrequisiteCourse pc : preCourses) {
            if (id == pc.getCourse().getId()) {
                return false;
            }
        }
        return true;
    }

    public int courseInATerm(ArrayList<Curriculum> curs, int term) {
        int count = 0;
        for (Curriculum c : curs) {
            if (c.getTerm() == term) {
                count++;
            }
        }
        return count;
    }

    public boolean check(ArrayList<Curriculum> curs, ArrayList<Course> courses) {
        ArrayList<Integer> idCourseCur = new ArrayList<>();
        for (Curriculum c : curs) {
            idCourseCur.add(c.getCourse().getId());
        }
        for (Course c : courses) {
            if (idCourseCur.contains(c.getId())) {
                return true;
            }
        }
        return false;
    }
}
