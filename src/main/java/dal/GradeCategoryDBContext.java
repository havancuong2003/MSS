package dal;

import model.Category;
import model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GradeCategoryDBContext extends DBContext<Category> {
    public void add(Category category,int id) {
        try {
            String sql = "insert into grade_category(`name`,`course_id`) values(?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, category.getCategoryName());
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(GradeCategoryDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            String sql = "select * from grade_category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString("name"));
                category.setId(rs.getInt("id"));
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                category.setCourse(c);
                categories.add(category);
            }
        } catch (SQLException e) {
            Logger.getLogger(GradeCategoryDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return categories;
    }


    @Override
    public ArrayList<Category> list() {
        return null;
    }

    @Override
    public void insert(Category entity) {

    }

    @Override
    public void update(Category entity) {

    }

    @Override
    public void delete(Category entity) {

    }

    @Override
    public Category get(int id) {
        return null;
    }
}
