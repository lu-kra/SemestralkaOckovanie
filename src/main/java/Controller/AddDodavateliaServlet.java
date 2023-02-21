package Controller;

import Model.Dodavatelia;
import Model.Prihlaseny;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.time.Instant;

@WebServlet(name = "AddDodavateliaServlet", value = "/AddDodavateliaServlet")
public class AddDodavateliaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String dodavatel = request.getParameter("dodavatel");
        String vakcina = request.getParameter("vakcina");
        Date datum = Date.valueOf(request.getParameter("datum"));
        String faktura = request.getParameter("faktura");
        String mnozstvo = request.getParameter("mnozstvo");
        String telcislo = request.getParameter("telcislo");
        String email = request.getParameter("email");


        //TODO: overit ci mam spravne vstupy!!!

        Dodavatelia dodavatelia = new Dodavatelia(dodavatel, vakcina, datum,faktura,mnozstvo,telcislo,email);
        DodavateliaController dodavateliaController = new DodavateliaController();
        Integer num = dodavateliaController.insertDodavatelia(dodavatelia);

        if (num == 1) {
            response.sendRedirect("addnewvakcina.jsp?msg=valid");
            // response.getWriter().write("Inserted :)");
        } else {
            //response.getWriter().write("Wrong :(");
            response.sendRedirect("addnewvakcina.jsp?msg=invalid");
        }


    }
}
