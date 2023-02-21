package Controller;

import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SelectDruhVakcinyJsonServlet", value = "/selectdruhvakcinyjson")
public class SelectDruhVakcinyJsonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String vek = request.getParameter("vek");
        Gson gson = new Gson();

        String vakciny = "";

        String[] vek1 = {"Pfizer-BioNTech","Moderna","Covaxin"};
        String[] vek2 = {"AstraZeneca","Sputnik V","Johnson & Johnson’s","BBIBP-CorV","EpiVacCorona"};
        String[] vek3 = {"CoronaVac","Convidicea (Ad5-nCoV)","WIBP-CorV","QazVac"};
        String[] vek4 = {"Sputnik Light","ZF2001","CoviVac"};

        switch (vek) {
            case "2-17":
                vakciny = gson.toJson(vek1);
                break;
            case "18-30":
                vakciny = gson.toJson(vek2);
                break;
            case "31-50":
                vakciny = gson.toJson(vek3);
                break;
            case "51-100":
                vakciny = gson.toJson(vek4);
                break;

            default:
        }

        response.getWriter().write(vakciny);
    }
}
