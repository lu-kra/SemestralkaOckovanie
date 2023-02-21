<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hlavna stranka</title>

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

<div class="container" align="center"><h1>Registrácia na očkovanie</h1></div>

<%
    String msg = request.getParameter("msg");
    if("valid" .equals(msg))
    {
%>
<h2>Registrácia prebehla úspešne. Kontaktujeme Vás do 12 hodín</h2>

<%
    }
%>

<%
    if("invalid" .equals(msg))
    {
%>
<h6>Registrácia nebola úspešná. Užívateľ už existuje.</h6>
<%
    }
%>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-body">

    <form action="registerPrihlaseny"  id="form" method="Post">

        <div class="card-header">
            <h3 class="text-center font-weight-light my-4">Osobné údaje</h3>
        </div>

        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="meno">Meno</label>
                    <input type="text" name="meno" id="meno" class="form-control" placeholder="Zadajte meno">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="priezvisko">Priezvisko</label>
                    <input type="text" name="priezvisko" id="priezvisko" class="form-control" placeholder="Zadajte priezvisko">
                 </div>
            </div>
        </div>



        <div class="form-row">
            <div class="col-md-6">
                 <div class="form-group">
                     <label for="rodnecislo">Rodné číslo v tvare 555555/5555</label>
                    <input type="text" name="rodnecislo" id="rodnecislo" class="form-control" placeholder="Zadajte rodné číslo">
                 </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="pohlavie">Pohlavie</label>
                    <select class="custom-select" name="pohlavie" id="pohlavie">
                        <option selected></option>
                        <option value="muz">Muž</option>
                        <option value="zena">Žena</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="vek">Vek</label>
                    <select class="custom-select" name="vek" id="vek">
                        <option selected>Vyber vekový rozsah</option>
                        <option value="2-17">2-17</option>
                        <option value="18-30">18-30</option>
                        <option value="31-50">31-50</option>
                        <option value="51-100">51-100</option>
                    </select>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label for="vakcina">Vakcina</label>
                    <select class="custom-select" name="vakcina" id="vakcina">
                        <option selected>Vyber najprv vek</option>

                    </select>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label for="poistovna">Poistovna</label>
                    <select class="custom-select" name="poistovna" id="poistovna">
                        <option selected></option>
                        <option value="VsZP">VsZP</option>
                        <option value="Dôvera">Dôvera</option>
                        <option value="Union">Union</option>
                    </select>
                </div>
            </div>
        </div>



        <div class="card-header">
            <h3 class="text-center font-weight-light my-4">Adresa bydliska</h3>
        </div>


        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ulica">Ulica</label>
                    <input type="text" name="ulica" id="ulica" class="form-control" placeholder="Zadajte ulicu trvalého pobytu">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="ulicacislo">Popisné číslo</label>
                    <input type="text" name="ulicacislo" id="ulicacislo" class="form-control" placeholder="Zadajte popisné číslo">
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="psc">Poštové smerovacie číslo</label>
                    <input type="number" name="psc" id="psc" class="form-control" placeholder="Zadajte poštové smerovacie číslo">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="obec">Obec</label>
                    <input type="text" name="obec" id="obec" class="form-control" placeholder="Zadajte názov obce">
                </div>
            </div>
        </div>



        <div class="card-header">
            <h3 class="text-center font-weight-light my-4">Kontaktné údaje</h3>
        </div>

        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="telcislo">Telefónne číslo</label>
                    <input type="number" name="telcislo" id="telcislo" class="form-control" placeholder="tvare: 09xxxxxxxx">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Zadajte kontaktný email">
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="password">Heslo</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Zadajte heslo">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="password2">Zopakuj heslo</label>
                    <input type="password" name="password2" id="password2" class="form-control" placeholder="Zopakuj heslo">
                </div>
            </div>
        </div>

        <div class="form-group mt-4 mb-0">
            <button type="submit" class="btn btn-success btn-block">Požiadať o očkovanie</button>
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
                meno: {
                    required: true,
                    minlength: 2,
                    maxlength: 50
                },
                priezvisko: {
                    required: true,
                    minlength: 2,
                    maxlength: 80
                },
                rodnecislo: {
                    required: true,
                    minlength: 11,
                    maxlength: 11
                },
                pohlavie: {
                    required: true,
                },
                vek: {
                    required: true,
                },
                vakcina: {
                    required: true,
                },
                poistovna: {
                    required: true,
                },
                ulica: {
                    required: true,
                    minlength: 5,
                    maxlength: 60
                },
                ulicacislo: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                psc: {
                    required: true,
                    number: true,
                    minlength: 4,
                    maxlength: 10
                },
                obec: {
                    required: true,
                    minlength: 3,
                    maxlength: 80
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
                password: {
                    required: true,
                    minlength: 5,
                    maxlength: 256
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                },
            }
        })


        $('#vek').on('change', function () {


            $.ajax({
                url: 'selectdruhvakcinyjson',
                type: 'POST',
                data: {
                    "vek": $('#vek').val()
                },
                success: function (data) {
                    //console.log(data)
                    let html = ''
                    data.forEach(vakcina => {
                        html += '<option value="'+vakcina+'">'+vakcina+'</option>'
                    })

                    $('#vakcina').html(html)
                },
                error: function (data) {
                    console.log(data)
                }
            })
        })
})
</script>

</body>
</html>