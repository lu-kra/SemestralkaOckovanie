package Controller;

import Model.Dodavatelia;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "UpdateDodavateliaServlet", value = "/updatedodavatelia")
public class UpdateDodavateliaServlet extends HttpServlet {
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
        Integer id = Integer.parseInt(request.getParameter("id"));


        //TODO: overit ci mam spravne vstupy!!!

        Dodavatelia dodavatelia = new Dodavatelia(id,dodavatel,vakcina,datum,faktura,mnozstvo,telcislo,email);
        DodavateliaController dodavateliaController = new DodavateliaController();
        Integer num = dodavateliaController.updateDodavatelia(dodavatelia);

        if (num == 1) {
            response.sendRedirect("tabdodavatelia.jsp?msg=valid");
            // response.getWriter().write("Inserted :)");
        } else {
            //response.getWriter().write("Wrong :(");
            response.sendRedirect("tabdodavatelia.jsp?msg=invalid");
        }


    }
}
