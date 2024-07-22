package filters;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

@WebFilter(filterName = "AccessControlFilter", urlPatterns = {"/admin/*", "/staff/*", "/teacher/*", "/student/*", "/manager/*"})
public class AccessControlFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;


        HttpSession session = request.getSession(false);


        Account account = null;
        if (session != null && session.getAttribute("account") != null) {
            account = (Account) session.getAttribute("account");
        }


        int userRole = 0;
        if (account != null) {
            userRole = account.getRole_id();
        }



        String urlPattern = request.getRequestURI().substring(request.getContextPath().length());

        if (!checkAccess(urlPattern, userRole)) {

            response.sendRedirect("http://localhost:9999/MyStudySpace_war_exploded/accessDenied");
            return;
        }

        filterChain.doFilter(request, response);
    }

    private boolean checkAccess(String requestURI, int userRole) {



        if (requestURI.startsWith("/admin")) {
            return userRole == 1;
        } else if (requestURI.startsWith("/staff")) {
            return userRole == 2;
        } else if (requestURI.startsWith("/teacher")) {
            return userRole == 3;
        } else if (requestURI.startsWith("/student")) {
            return userRole == 4;
        } else if (requestURI.startsWith("/manager")) {

            return userRole == 1 || userRole == 2;
        }


        return true;
    }

    @Override
    public void destroy() {

    }
}

