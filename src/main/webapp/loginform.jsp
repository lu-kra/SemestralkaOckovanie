<%--
  Created by IntelliJ IDEA.
  User: Lukas-PC
  Date: 13. 5. 2021
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login form</title>

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

<%@include file="indexnavbar.html"%>

<div class="container" align="center"><h1>Prihlásenie</h1></div>


<div>
        <%
        String msg = request.getParameter("msg");
        if("invalid".equals(msg))
        {
    %>
    <h6>Nesprávne Meno / Heslo</h6>
        <%
    }
%>
</div>



<div class="row justify-content-center">
    <div class="col-lg-3">
        <div class="card shadow-lg border-0 rounded-lg mt-5">

            <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>

            <div class="card-body">
                <form action="loginservlet" method="post" id="form">

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control py-4" type="email" name="email" id="email" class="form-control" placeholder="Zadaj email">
                    </div>
                    <div class="form-group">
                        <label for="password">Heslo</label>
                        <input class="form-control py-4" type="password" name="password" id="password" class="form-control" placeholder="Zadaj heslo">
                    </div>

                <div class="form-group mt-4 mb-0">
                    <button type="submit" class="btn btn-success btn-block">Login</button>
                </div>

                </form>
            </div>
        </div>
    </div>
</div>



<%@include file="footer.jsp"%>


<script>
    $(document).ready(function () {

        $("#form").validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    minlength: 5,
                    maxlength: 60
                },
                password: {
                    required: true,
                    minlength: 5,
                    maxlength: 256
                },
            }
        })
    })

</script>



</body>
</html>
