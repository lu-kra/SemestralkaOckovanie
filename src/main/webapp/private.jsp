<%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 15. 5. 2021
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Private JSP</title>


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


</head>
<body>

<%@include file="privatenavbar.jsp"%>

<%
    String meno = (String) session.getAttribute("meno");
    String priezvisko = (String) session.getAttribute("priezvisko");
    String rodnecislo = (String) session.getAttribute("rodnecislo");
    String pohlavie = (String) session.getAttribute("pohlavie");
    String vek = (String) session.getAttribute("vek");
    String vakcina = (String) session.getAttribute("vakcina");
    String poistovna = (String) session.getAttribute("poistovna");
    String ulica = (String) session.getAttribute("ulica");
    Integer psc = (Integer) session.getAttribute("psc");
    String obec = (String) session.getAttribute("obec");
    String telcislo = (String) session.getAttribute("telcislo");
    String status = (String) session.getAttribute("status");

    String email = (String) session.getAttribute("email");
    Integer role = (Integer) session.getAttribute("role");

    if (email == null || email.isEmpty()) {
        response.sendRedirect("loginform.jsp");
    }
%>


<div class="container" align="center"><h1>Tvoj status</h1></div>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-16">

            <div class="row justify-content-center">
                <h3>Prihlásený/á: <%=email%></h3>
            </div>

            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                    <table  id="uzivatel" class="table table-striped table-active">
                        <thead>
                        <tr>
                             <th>Meno</th>
                            <th>Priezvisko</th>
                            <th>Rodné Číslo</th>
                            <th>Pohlavie</th>
                            <th>Vek</th>
                            <th>Vakcína</th>
                            <th>Poisťovna</th>
                            <th>Ulica</th>
                            <th>Popisné číslo</th>
                            <th>Obec</th>
                            <th>Telefónne číslo</th>
                            <th>Email</th>
                            <th>Status</th>
                        </tr>
                        </thead>


                        <tr>
                            <td><%=meno%></td>
                            <td><%=priezvisko%></td>
                            <td><%=rodnecislo%></td>
                            <td><%=pohlavie%></td>
                            <td><%=vek%></td>
                            <td><%=vakcina%></td>
                            <td><%=poistovna%></td>
                            <td><%=ulica%></td>
                            <td><%=psc%></td>
                            <td><%=obec%></td>
                            <td><%=telcislo%></td>
                            <td><%=email%></td>
                            <td class="table-danger"><%=status%></td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>






<%@include file="footer.jsp"%>

<script>

    $(document).ready(function() {
        $('#uzivatel').DataTable( {
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Slovak.json"
            }
        } );
    } );

</script>



</body>
</html>
