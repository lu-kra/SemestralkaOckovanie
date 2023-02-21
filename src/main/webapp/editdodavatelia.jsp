<%@ page import="Controller.DodavateliaController" %>
<%@ page import="Model.Dodavatelia" %>
<%--
Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 16. 5. 2021
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Dodavatelia</title>


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

<%
    String email = (String) session.getAttribute("email");
    Integer role = (Integer) session.getAttribute("role");

    if (email == null || email.isEmpty() || role == null || role != 999) {

        response.sendRedirect("adminloginform.jsp");

    }
%>


<%@include file="adminnavbar.jsp"%>


<%
    String idString = request.getParameter("id");
    Integer id = Integer.parseInt(idString);

    DodavateliaController dodavateliaController = new DodavateliaController();
    Dodavatelia dodavatelia = dodavateliaController.getDodavatel(id);
%>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

                    <form action="updatedodavatelia" id="form">

                        <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">Informácie</h3>
                        </div>

                        <div class="form-row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="dodavatel">Dodavatel</label>
                                    <input type="text" name="dodavatel" id="dodavatel" value="<%=dodavatelia.getDodavatel()%>" class="form-control" placeholder="Zadajte firmu">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="vakcina">Vakcína</label>
                                    <input type="text" name="vakcina" id="vakcina" value="<%=dodavatelia.getVakcina()%>" class="form-control" placeholder="Zadajte vakcínu">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="datum">Datum</label>
                                    <input type="date" name="datum" id="datum" value="<%=dodavatelia.getDatum()%>" class="form-control" placeholder="Zadajte datum prijatia">
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-6">
                        <div class="form-group">
                            <label for="faktura">Cislo faktury</label>
                            <input type="number" name="faktura" id="faktura" value="<%=dodavatelia.getFaktura()%>" class="form-control" placeholder="Zadajte priezvisko">
                        </div>
                            </div>

                            <div class="col-md-6">
                        <div class="form-group">
                            <label for="mnozstvo">Mnozstvo vakcin</label>
                            <input type="number" name="mnozstvo" id="mnozstvo" value="<%=dodavatelia.getMnozstvo()%>" class="form-control" placeholder="Zadajte priezvisko">
                        </div>
                            </div>
                        </div>

                        <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">Kontaktné údaje</h3>
                        </div>


                        <div class="form-row">
                            <div class="col-md-6">
                        <div class="form-group">
                            <label for="telcislo">Telefonne cislo</label>
                            <input type="number" name="telcislo" id="telcislo" value="<%=dodavatelia.getTelcislo()%>" class="form-control" placeholder="Zadajte telefónne číslo v tvare 09...">
                        </div>
                            </div>

                            <div class="col-md-6">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" value="<%=dodavatelia.getEmail()%>" class="form-control" placeholder="Zadajte kontaktný email">
                        </div>
                            </div>
                        </div>

                        <input type="hidden" name="id" id="id" value="<%=dodavatelia.getId()%>">

                        <div class="form-group mt-4 mb-0">
                            <button type="submit" class="btn btn-warning btn-block">Upraviť údaje</button>
                        </div>
                    </form>
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

    $(document).ready(function () {

        $("#form").validate({
            rules: {
                dodavatel: {
                    required: true,
                    minlength: 2,
                    maxlength: 50
                },
                vakcina: {
                    required: true,
                },
                datum: {
                    required: true,
                },
                faktura: {
                    required: true,
                    number: true,
                    minlength: 5,
                    maxlength: 15
                },
                mnozstvo: {
                    required: true,
                    number: true,
                    minlength: 1,
                    maxlength: 10
                },
                telcislo: {
                    required: true,
                    number: true,
                    minlength: 10,
                    maxlength: 10
                },
                email: {
                    required: true,
                    email: true,
                    minlength: 5,
                    maxlength: 60
                },

            }
        })




    })
</script>

</body>
</html>
