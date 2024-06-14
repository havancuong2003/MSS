package model;

public class Response implements IEntity {
    private int response_id;
    private String response;
    private int application_id;

    public Response() {
    }

    public Response(int response_id, String response, int application_id) {
        this.response_id = response_id;
        this.response = response;
        this.application_id = application_id;
    }

    public int getResponse_id() {
        return response_id;
    }

    public void setResponse_id(int response_id) {
        this.response_id = response_id;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getApplication_id() {
        return application_id;
    }

    public void setApplication_id(int application_id) {
        this.application_id = application_id;
    }
}
