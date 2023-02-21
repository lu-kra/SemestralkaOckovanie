package Controller;

import Model.Prihlaseny;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsertPrihlasenyServlet", value = "/registerPrihlaseny")
public class RegisterPrihlasenyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        String meno = request.getParameter("meno");
        String priezvisko = request.getParameter("priezvisko");
        String rodnecislo = request.getParameter("rodnecislo");
        String pohlavie = request.getParameter("pohlavie");
        String vek = request.getParameter("vek");
        String vakcina = request.getParameter("vakcina");
        String poistovna = request.getParameter("poistovna");
        String ulica = request.getParameter("ulica");
        String ulicacislo = request.getParameter("ulicacislo");
        Integer psc = Integer.parseInt(request.getParameter("psc"));
        String obec = request.getParameter("obec");
        String telcislo = request.getParameter("telcislo");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String status = "nezaockovany";


        String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());


        //TODO: overit ci mam spravne vstupy!!!

        Prihlaseny prihlaseny = new Prihlaseny(meno,priezvisko, rodnecislo,pohlavie,vek,vakcina,poistovna,ulica,ulicacislo,psc,obec,telcislo,email,status,hashPassword, 1);
        PrihlasenyController prihlasenyController = new PrihlasenyController();
        Integer num = prihlasenyController.insertPrihlaseny(prihlaseny);

        if (num == 1) {
           response.sendRedirect("registerform.jsp?msg=valid");
           // response.getWriter().write("Inserted :)");
        } else {
             //response.getWriter().write("Wrong :(");
            response.sendRedirect("registerform.jsp?msg=invalid");
        }


    }
}
