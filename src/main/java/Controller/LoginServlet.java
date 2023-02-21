package Controller;

import Model.Prihlaseny;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/loginservlet")
public class LoginServlet extends HttpServlet {
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

            httpSession.setAttribute("meno", prihlaseny.getMeno());
            httpSession.setAttribute("priezvisko", prihlaseny.getPriezvisko());
            httpSession.setAttribute("rodnecislo", prihlaseny.getRodnecislo());
            httpSession.setAttribute("pohlavie", prihlaseny.getPohlavie());
            httpSession.setAttribute("vek", prihlaseny.getVek());
            httpSession.setAttribute("vakcina", prihlaseny.getVakcina());
            httpSession.setAttribute("poistovna", prihlaseny.getPoistovna());
            httpSession.setAttribute("ulica", prihlaseny.getUlica());
            httpSession.setAttribute("psc", prihlaseny.getPsc());
            httpSession.setAttribute("obec", prihlaseny.getObec());
            httpSession.setAttribute("telcislo", prihlaseny.getTelcislo());
            httpSession.setAttribute("status", prihlaseny.getStatus());

            response.sendRedirect("private.jsp");
        } else {
            response.sendRedirect("loginform.jsp?msg=invalid");
        }

    }
}
