package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "PotvrdZaockovanieServlet", value = "/potvrdzaockovanie")
public class PotvrdZaockovanieServlet extends HttpServlet {
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

        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps=con.prepareStatement("UPDATE prihlaseny SET status = 'zaockovany' WHERE id = ?");

            ps.setInt(1,id);
            ps.executeUpdate();

            response.sendRedirect("cakaren.jsp?msg=valid");

        }catch (Exception e) {
            response.sendRedirect("cakaren.jsp?msg=invalid");
        }












    }
}
