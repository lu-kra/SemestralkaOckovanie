package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebServlet(name = "OdstranZaockovanieServlet", value = "/odstranzaockovanie")
public class OdstranZaockovanieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Integer id = Integer.parseInt(request.getParameter("id"));

        PrihlasenyController prihlasenyController = new PrihlasenyController();

        //este bude treba upravit proti chybam keby priso 1 tak to crashne
        int numberOfDelete = prihlasenyController.deletePrihlaseny(id);

        if (numberOfDelete > 0) {
            response.sendRedirect("cakaren.jsp?msg2=valid");
        } else {
            response.sendRedirect("cakaren.jsp?msg2=invalid");
        }

    }
}
