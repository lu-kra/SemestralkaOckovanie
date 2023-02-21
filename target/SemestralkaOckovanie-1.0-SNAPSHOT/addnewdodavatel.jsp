<%@ page import="java.sql.Connection" %>
<%@ page import="Controller.DatabaseConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 15. 5. 2021
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pridaj dodavatela</title>


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

<%@include file="adminnavbar.jsp"%>




<%
    String msg = request.getParameter("msg");
    if("valid" .equals(msg))
    {
%>
<h2>Formular bol poslany spravne. </h2>

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

<%
    int id=1;

    try {
        Connection con = DatabaseConnectionManager.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT max(id) from dodavatelia");
        if(rs.next())
        {
            id = rs.getInt(1);
            id = id+1;
        }%>

<div class="container">
    <h1 style="color: red"> Číslo záznamu: <%out.println(id);%> </h1>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>



<div class="container">
    <form action="AddDodavateliaServlet"  id="form" method="Post">

        <input type="hidden" name="id" value="<%out.println(id);%>">

        <div class="form-group">
            <label for="dodavatel">Výrobca</label>
            <input type="text" name="dodavatel" id="dodavatel" class="form-control" placeholder="Zadajte výrobcu">
        </div>

        <div class="form-group">
            <label for="vakcina">Vakcína</label>
            <select class="custom-select" name="vakcina" id="vakcina">
                <option selected></option>
                <option value="Pfizer">Pfizer</option>
                <option value="AstraZeneca">Astra-Zeneca</option>
            </select>
        </div>

        <div class="form-group">
            <label for="datum">Dátum</label>
            <input type="date" name="datum" id="datum" class="form-control" placeholder="Zadajte datum prijatia">
        </div>

        <div class="form-group">
            <label for="faktura">Číslo faktúry</label>
            <input type="number" name="faktura" id="faktura" class="form-control" placeholder="Zadajte priezvisko">
        </div>

        <div class="form-group">
            <label for="mnozstvo">Množstvo vakcín</label>
            <input type="number" name="mnozstvo" id="mnozstvo" class="form-control" placeholder="Zadajte cislo">
        </div>

        <h2 align="center">Kontaktné údaje</h2>

        <div class="form-group">
            <label for="telcislo">Telefónne číslo</label>
            <input type="number" name="telcislo" id="telcislo" class="form-control" placeholder="Zadajte telefónne číslo v tvare 09...">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control" placeholder="Zadajte kontaktný email">
        </div>

        <button type="submit" class="btn btn-warning">Poslat formular</button>
    </form>
</div>


<%@include file="footer.jsp"%>

</body>
</html>
