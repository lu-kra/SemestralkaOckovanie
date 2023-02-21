<%@ page import="java.sql.Connection" %>
<%@ page import="Controller.DatabaseConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Controller.DodavateliaController" %>
<%@ page import="Model.Dodavatelia" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 16. 5. 2021
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sklad vakcin</title>

    <%--Bootstrap--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <%--    jquery--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <%--   jquery validation  musi byt pod jquery--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" integrity="sha512-UdIMMlVx0HEynClOIFSyOrPggomfhBKJE28LKl8yR3ghkgugPnG6iLfRfHwushZl1MOPSY6TsuBDGPK2X4zYKg==" crossorigin="anonymous"></script>
    <%--    preklad do sk--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/localization/messages_sk.min.js" integrity="sha512-b6Qsn8qkQZNL5e1cLOqkHmIg6mkqpLTtvFpvb35S05viiZv289csMF8MC52i1I4C8us+orI6xLAUXe9L477w5Q==" crossorigin="anonymous"></script>
    <%--    Font Awesome link--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />

    <%--        Linknute moje CSS--%>
    <link rel="stylesheet" href="css/indexstyle.css" type="text/css">


    <%--    DataTables--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>


</head>
<body>

<%
    String email = (String) session.getAttribute("email");
    Integer role = (Integer) session.getAttribute("role");

    if (email == null || email.isEmpty() || role == null || role != 999) {

        response.sendRedirect("adminloginform.jsp");

    }
%>



<%@include file="adminnavbar.jsp"%>

<div class="container" align="center"><h1>Stav skladu vakcín</h1></div>


    <%
        String msg= request.getParameter("msg");
    %>


<div class="form-row">
    <div class="col-md-6">




<div class="container">
   <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                    <form action="upravsklad" method="post">


                            <div class="card-header">
                                <h2 class="text-center font-weight-light my-4">Vyber vakcínu</h2>
                            </div>


                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="vakcina">Vakcina</label>
                                    <select class="custom-select" name="vakcina" id="vakcina">

                                        <%
                                            DodavateliaController dodavateliaController = new DodavateliaController();
                                            List<Dodavatelia> dodavateliaList = dodavateliaController.getAllVakcina();

                                            for (Dodavatelia p : dodavateliaList){
                                        %>
                                        <option value=<%=p.getVakcina()%>><%=p.getVakcina()%></option>

                                        </tr>
                                        <%
                                            }
                                        %>

<%--                                        <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>--%>
<%--                                        <option value="Moderna">Moderna</option>--%>
<%--                                        <option value="AstraZeneca">Astra-Zeneca</option>--%>
<%--                                        <option value="Sputnik V">Sputnik V</option>--%>
<%--                                        <option value="Sputnik Light">Sputnik Light</option>--%>
<%--                                        <option value="Johnson & Johnson’s">Johnson & Johnson’s</option>--%>
<%--                                        <option value="CoronaVac">CoronaVac</option>--%>
<%--                                        <option value="Covaxin">Covaxin</option>--%>
<%--                                        <option value="BBIBP-CorV">BBIBP-CorV</option>--%>
<%--                                        <option value="EpiVacCorona">EpiVacCorona</option>--%>
<%--                                        <option value="Convidicea (Ad5-nCoV)">Convidicea (Ad5-nCoV)</option>--%>
<%--                                        <option value="WIBP-CorV">WIBP-CorV</option>--%>
<%--                                        <option value="CoviVac">CoviVac</option>--%>
<%--                                        <option value="ZF2001">ZF2001</option>--%>
<%--                                        <option value="QazVac">QazVac</option>--%>
                                    </select>
                                </div>
                            </div>



                        <div class="card-header">
                            <h2 class="text-center font-weight-light my-4">Uprav množstvo</h2>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="zmena">Zmena</label>
                                <select class="custom-select" name="zmena" id="zmena">
                                    <option value="pridaj">Pridat</option>
                                    <option value="odober">Odobrat</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="mnozstvo">Mnozstvo vakcin</label>
                                <input type="number" name="mnozstvo" id="mnozstvo" class="form-control" placeholder="Zadajte cislo">
                            </div>
                        </div>

                        <div class="form-group mt-4 mb-0">
                            <button type="submit" class="btn btn-danger btn-block">Ulož zmenu</button>

                            <br>
                            <%
                                if("valid".equals(msg))
                                {
                            %>

                            <div class="form-group"> <h2>Údaje boli zmenené.</h2> </div>
                            <%
                                }
                            %>

                            <%
                                if("invalid".equals(msg))
                                {
                            %>

                            <span style="color: red; "> <h6>Vlož číslo! </h6> </span>
                            <%
                                }
                            %>

                       </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




    </div>

<br>


    <div class="col-md-6">


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                <table id="dodavatelia" class="table table-striped table-active">
                    <thead>
                            <tr>
                                <th>Vakcina</th>
                                <th>Mnozstvo</th>
                            </tr>
                    </thead>
                            <tr class="bg-secondary">

                        <%
//                            DodavateliaController dodavateliaController = new DodavateliaController();
//                            List<Dodavatelia> dodavateliaList = dodavateliaController.getAllVakcina();

                            for (Dodavatelia p : dodavateliaList){
                        %>
                                <td><%=p.getVakcina()%></td>
                                <td><%=p.getMnozstvo()%></td>
                            </tr>
                        <%
                            }
                        %>

                </table>
            </div>
        </div>
    </div>
</div>
</div>



</div>
</div>


<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="footer.jsp"%>


            <script>

                $(document).ready(function() {
                    $('#dodavatelia').DataTable( {
                        "language": {
                            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Slovak.json"
                        }
                    } );
                } );

            </script>



</body>
</html>
