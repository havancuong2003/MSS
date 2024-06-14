package dal;

import model.Course;
import model.Major;
import model.Term;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TermDBContext extends DBContext<Term> {

    public Term getTerm(int term, int major_id) {
        Term t = new Term();
        ArrayList<Course> courses = new ArrayList<>();
        Major m = new Major();
        m.setId(major_id);
        try {
            String sql = "select c.course_id from curriculum c inner join course co on co.id = c.course_id where c.term = ? and c.major_id = ? and co.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, term);
            stm.setInt(2, major_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                courses.add(c);
            }
            t.setId(term);
            t.setCourses(courses);
            t.setMajor(m);
        } catch (SQLException e) {
            Logger.getLogger(TermDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return t;
    }

    @Override
    public ArrayList<Term> list() {
        return null;
    }

    @Override
    public void insert(Term entity) {

    }

    @Override
    public void update(Term entity) {

    }

    @Override
    public void delete(Term entity) {

    }

    @Override
    public Term get(int id) throws SQLException {
        return null;
    }
}
