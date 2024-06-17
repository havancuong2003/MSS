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
import model.Term;

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
            MajorDBContext mdb = new MajorDBContext();
            req.setAttribute("majors", mdb.listAllMajor());
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
            Curriculum cur = cudb.getCurriculum(Integer.parseInt(mid));
            PrequisiteCourseDBContext predb = new PrequisiteCourseDBContext();
            ArrayList<PrequisiteCourse> preCourses = predb.getPrequisiteCourseList();
            ArrayList<Integer> successID = new ArrayList<>();
            for (Integer id : idList) {
                if (checkCourseAlreadyInCurriculum(id, cur)) {
                    MajorDBContext mdb = new MajorDBContext();
                    req.setAttribute("majors", mdb.listAllMajor());
                    req.setAttribute("msSave", "A course in your list was already in curriculum! Add course to curriculum failed!");
                    req.setAttribute("mid", req.getParameter("mid"));
                    req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                    return;
                }
                if (checkCourseHaveNoPre(id, preCourses)) {
                    String description = req.getParameter("description" + id);
                    int termNo = Integer.parseInt(req.getParameter("termNo" + id));
                    if (courseInATerm(cur, termNo) >= 6) {
                        MajorDBContext mdb = new MajorDBContext();
                        req.setAttribute("majors", mdb.listAllMajor());
                        req.setAttribute("msSave", "You can't add more than 6 courses in a term! Term: " + termNo
                                + "already have 6 courses! Add course to curriculum failed!");
                        req.setAttribute("mid", req.getParameter("mid"));
                        req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                        return;
                    } else {
                        successID.add(id);
                    }
                } else {
                    ArrayList<Course> preCoursesList = getPrequisiteCourse(id, preCourses);
                    String description = req.getParameter("description" + id);
                    int termNo = Integer.parseInt(req.getParameter("termNo" + id));
                    if (courseInATerm(cur, termNo) >= 6) {
                        MajorDBContext mdb = new MajorDBContext();
                        req.setAttribute("majors", mdb.listAllMajor());
                        req.setAttribute("msSave", "You can't add more than 6 courses in a term! Term: " + termNo
                                + "already have 6 courses! Add course to curriculum failed!");
                        req.setAttribute("mid", req.getParameter("mid"));
                        req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                        return;
                    } else {
                        if (checkContainAllPreCourse(preCoursesList, cur, termNo)) {
                            successID.add(id);
                        }else {
                            MajorDBContext mdb = new MajorDBContext();
                            req.setAttribute("majors", mdb.listAllMajor());
                            req.setAttribute("msSave", "Prequisite of course is not in curriculum or that's course was study in the term later of the course you add!\n" +
                                    " Add course to curriculum failed!");
                            req.setAttribute("mid", req.getParameter("mid"));
                            req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
                            return;
                        }
                    }
                    successID.add(id);
                }
            }
            for (Integer id : successID) {
                String description = req.getParameter("description" + id);
                int termNo = Integer.parseInt(req.getParameter("termNo" + id));
                cudb.AddCourseToCurriculum(Integer.parseInt(mid), id, termNo, description);
            }
            MajorDBContext mdb = new MajorDBContext();
            req.setAttribute("majors", mdb.listAllMajor());
            req.setAttribute("msSave", "Add course to curriculum success!");
            req.setAttribute("mid", req.getParameter("mid"));
            req.getRequestDispatcher("/views/curriculum/addCourseToCurriculum.jsp").forward(req, resp);
            return;

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

    public int courseInATerm(Curriculum c, int term) {
        for (Term t : c.getTerms()) {
            if (t.getId() == term) {
                return t.getCourses().size();
            }
        }
        return 0;
    }

    public ArrayList<Course> getPrequisiteCourse(int course_id, ArrayList<PrequisiteCourse> preCourses) {
        ArrayList<Course> courses = new ArrayList<>();
        for (PrequisiteCourse pc : preCourses) {
            if (course_id == pc.getCourse().getId()) {
                courses.add(pc.getPreCourse());
            }
        }
        return courses;
    }

    public boolean checkCourseAlreadyInCurriculum(int course_id, Curriculum c) {
        for (Term t : c.getTerms()) {
            for (Course course : t.getCourses()) {
                if (course_id == course.getId()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean checkContainAllPreCourse(ArrayList<Course> preCourse, Curriculum c, int term) {
        boolean containAll = true;
        for (Course pc : preCourse) {
            for (Term t : c.getTerms()) {
                for (Course cou : t.getCourses()) {
                    if (pc.getId() == cou.getId() && t.getId() < term) {
                        pc.setChecked(true);
                        break;
                    }
                }
            }
        }
        for (Course pc : preCourse) {
            if (!pc.isChecked()) {
                containAll = false;
                break;
            }
        }
        return containAll;
    }


}
