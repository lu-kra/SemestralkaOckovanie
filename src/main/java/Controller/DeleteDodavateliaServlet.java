package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteDodavateliaServlet", value = "/deletedodavatelia")
public class DeleteDodavateliaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        String id = request.getParameter("id");

        DodavateliaController dodavateliaController = new DodavateliaController();

        //este bude treba upravit proti chybam keby priso 1 tak to crashne
        int numberOfDelete = dodavateliaController.deleteDodavatelia(Integer.parseInt(id));

        if (numberOfDelete > 0) {
            response.sendRedirect("tabdodavatelia.jsp?msg2=valid");
        } else {
            response.sendRedirect("tabdodavatelia.jsp?msg2=invalid");
        }



    }
}
