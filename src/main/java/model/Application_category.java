package model;

public class Application_category {
    private int category_id;
    private String description;

    public Application_category() {
    }

    public Application_category(int category_id, String description) {
        this.category_id = category_id;
        this.description = description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
