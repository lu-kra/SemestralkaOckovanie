<%@ page import="Controller.DodavateliaController" %>
<%@ page import="Model.Dodavatelia" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 16. 5. 2021
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="adminnavbar.jsp"%>

    <title>Tabulka dodavatelia</title>


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



<%--Sprava pre upravenie--%>
<%
    String msg = request.getParameter("msg");
    if("valid" .equals(msg))
    {
%>
<h2>Formular bol uspesne upraveny. </h2>

<%
    }
%>

<%
    if("invalid" .equals(msg))
    {
%>
<h2>Formular nebol poslany. Skontrolujte si svoje udaje</h2>
<%
    }
%>

<%--Sprava pre zmazanie--%>
<%
    String msg2 = request.getParameter("msg2");
    if("valid" .equals(msg2))
    {
%>
<h2>Zaznam bol  uspesne odstraneny. </h2>

<%
    }
%>

<%
    if("invalid" .equals(msg2))
    {
%>
<h2>Riadok nebol odstraneny. Nastala chyba</h2>
<%
    }
%>


<div class="container" align="center"><h1>Prehľad vakcín</h1></div>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                <table id="dodavatelia" class="table table-striped table-active">
                    <thead>
                            <tr>
                                <th>ID</th>
                                <th>Výrobca</th>
                                <th>Vakcína</th>
                                <th>Dátum</th>
                                <th>Číslo faktúry</th>
                                <th>MNožstvo</th>
                                <th>Telefónne Číslo</th>
                                <th>Email</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                    </thead>


                            <%
                                DodavateliaController dodavateliaController = new DodavateliaController();
                                List<Dodavatelia> dodavateliaList = dodavateliaController.getAllDodavatelia();

                                for (Dodavatelia p : dodavateliaList) {
                            %>


                    <tr>
                                <td><%=p.getId()%></td>
                                <td><%=p.getDodavatel()%></td>
                                <td><%=p.getVakcina()%></td>
                                <td><%=p.getDatum()%></td>
                                <td><%=p.getFaktura()%></td>
                                <td><%=p.getMnozstvo()%></td>
                                <td><%=p.getTelcislo()%></td>
                                <td><%=p.getEmail()%></td>
                                <td>
                                    <%--                 treba dat aby nedavalo views ale aby isiel z root adresara lebo tak su namapovane servlety--%>
                                    <a href="editdodavatelia.jsp?id=<%=p.getId()%>"><i class="fas fa-edit"></i></a>
                                </td>
                                <td>
                                    <a href="deletedodavatelia?id=<%=p.getId()%>"><i class="fas fa-trash padding-left"></i></a>
                                </td>
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
