package model;

public class Application_status {
    private int status_id;
    private String description;

    public Application_status() {
    }

    public Application_status(int status_id, String description) {
        this.status_id = status_id;
        this.description = description;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
