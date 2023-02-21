package Controller;

import Model.Prihlaseny;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", value = "/adminloginservlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");



        // Get email and password in plain text from user input
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Get user by email from DB
        PrihlasenyController prihlasenyController = new PrihlasenyController();
        Prihlaseny prihlaseny = prihlasenyController.getLogin(email);


        if (BCrypt.checkpw(password, prihlaseny.getPassword())) {
            // User inserted correct email and password
            // Redirect to private page

            //Set attribute into session call email
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("email", prihlaseny.getEmail());
            httpSession.setAttribute("role", prihlaseny.getRole());

            response.sendRedirect("addnewvakcina.jsp");
        } else {
            response.sendRedirect("adminloginform.jsp?msg=invalid");
        }

    }
}
