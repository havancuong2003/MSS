package listeners;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class EnvConfigListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Dotenv dotenv = Dotenv.load();
        ServletContext context = sce.getServletContext();
        context.setAttribute("user",dotenv.get("USER_EMAIL"));
        context.setAttribute("pass",dotenv.get("USER_PASS"));

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce);
    }
}
