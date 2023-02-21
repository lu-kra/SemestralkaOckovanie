package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "UpravSkladVakcinServlet", value = "/upravsklad")
public class UpravSkladVakcinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        String vakcina = request.getParameter("vakcina");
        String zmena = request.getParameter("zmena");
        String stringMnozstvo = request.getParameter("mnozstvo");

        if(vakcina == null || vakcina.isEmpty() || zmena == null || zmena.isEmpty() || stringMnozstvo == null || stringMnozstvo.isEmpty()) {
            response.sendRedirect("skladvakcin.jsp?msg=invalid");
            return;
        }

        Integer mnozstvo = Integer.parseInt(stringMnozstvo);

        if(zmena.equals("odober")) {
            mnozstvo = -mnozstvo;
        }

        try (   Connection con = DatabaseConnectionManager.getConnection();
                Statement st = con.createStatement();
                )
        {

            st.executeUpdate("UPDATE dodavatelia SET mnozstvo=mnozstvo+"+mnozstvo+" WHERE vakcina='"+vakcina+"'");
            System.out.println("UPDATE dodavatelia SET mnozstvo=mnozstvo+"+mnozstvo+" WHERE vakcina='"+vakcina+"'");
            response.sendRedirect("skladvakcin.jsp?msg=valid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("skladvakcin.jsp?msg=invalid");

        }
    }
}
