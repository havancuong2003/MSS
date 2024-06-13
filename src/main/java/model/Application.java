package model;

public class Application implements IEntity {
    private int application_id;
    private String reason;
    private Student student;
    private Application_status applicationStatus;
    private Application_category applicationCategory;

    public Application() {
    }

    public Application(int application_id, String reason, Student student, Application_status applicationStatus, Application_category applicationCategory) {
        this.application_id = application_id;
        this.reason = reason;
        this.student = student;
        this.applicationStatus = applicationStatus;
        this.applicationCategory = applicationCategory;
    }

    public int getApplication_id() {
        return application_id;
    }

    public void setApplication_id(int application_id) {
        this.application_id = application_id;
    }

    public Application_status getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(Application_status applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Application_category getApplicationCategory() {
        return applicationCategory;
    }

    public void setApplicationCategory(Application_category applicationCategory) {
        this.applicationCategory = applicationCategory;
    }
}
