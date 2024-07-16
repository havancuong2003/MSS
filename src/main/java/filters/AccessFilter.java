package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AccessFilter", urlPatterns = {"/*"})
public class AccessFilter implements Filter {

    private static final String CONTEXT_PATH = "/MyStudySpace_war_exploded";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String requestURI = request.getRequestURI();


        if (requestURI.startsWith(CONTEXT_PATH) || isAllowedURL(requestURI)) {
            filterChain.doFilter(request, response);
        } else {

            response.sendRedirect(CONTEXT_PATH);
        }
    }

    private boolean isAllowedURL(String requestURI) {
        return requestURI.equals(CONTEXT_PATH + "/mystudyspace");
    }

    @Override
    public void destroy() {
    }
}
