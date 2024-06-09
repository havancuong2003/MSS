package controller.admin.createSlotchuaxong;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "createSlot", value = "/createSlot")

public class CreateSlot extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String detail=req.getParameter("detail");
        String start=req.getParameter("start");
        String end=req.getParameter("end");
//sdfsdfsdfdsfsdsdfsdfsddfbdfhfdgjfgj
//        asdasdasdassadas
//        aasjdasdjasjasdjasjdsajd
//                asdmjasikdjasd
    }
}
