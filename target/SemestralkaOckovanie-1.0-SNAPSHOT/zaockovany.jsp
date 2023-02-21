<%@ page import="Controller.PrihlasenyController" %>
<%@ page import="Model.Prihlaseny" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 17. 5. 2021
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Zaockovany</title>

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

<div class="container" align="center"><h1>Prehľad zaočkovaých</h1></div>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-16">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                    <table  id="cakaren" class="table table-striped table-active">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Meno</th>
                            <th>Priezvisko</th>
                            <th>Rodne Cislo</th>
                            <th>Pohlavie</th>
                            <th>Vek</th>
                            <th>Vakcina</th>
                            <th>Poistovna</th>
                            <th>Ulica</th>
                            <th>Popisne cislo</th>
                            <th>PSC</th>
                            <th>Obec</th>
                            <th>Telefonne cislo</th>
                            <th>Email</th>
                            <th>Status</th>
                        </tr>
                        </thead>



                        <%
                            PrihlasenyController prihlasenyController = new PrihlasenyController();
                            List<Prihlaseny> prihlasenyList = prihlasenyController.getAllZaockovany();

                            for (Prihlaseny p : prihlasenyList){
                        %>

                        <tr>
                            <td><%=p.getId()%></td>
                            <td><%=p.getMeno()%></td>
                            <td><%=p.getPriezvisko()%></td>
                            <td class="table-primary"><%=p.getRodnecislo()%></td>
                            <td><%=p.getPohlavie()%></td>
                            <td><%=p.getVek()%></td>
                            <td><%=p.getVakcina()%></td>
                            <td><%=p.getPoistovna()%></td>
                            <td><%=p.getUlica()%></td>
                            <td><%=p.getUlicacislo()%></td>
                            <td><%=p.getPsc()%></td>
                            <td><%=p.getObec()%></td>
                            <td><%=p.getTelcislo()%></td>
                            <td class="table-info"><%=p.getEmail()%></td>
                            <td class="bg-success"><%=p.getStatus()%></td>
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

<%@include file="footer.jsp"%>

<script>

    $(document).ready(function() {
        $('#cakaren').DataTable( {
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Slovak.json"
            }
        } );
    } );

</script>



</body>
</html>
