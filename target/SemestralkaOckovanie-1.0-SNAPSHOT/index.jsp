<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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

<%@include file="indexnavbar.html"%>

<body>


<script>
    fetch("https://corona.lmao.ninja/v2/countries/slovakia")
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            console.log(data);
            document.getElementById("flag").src = data.countryInfo.flag;
            document.getElementById("country").innerHTML = data.country;
            document.getElementById("Active_Cases").innerHTML = data.active;
            document.getElementById("Total_Cases").innerHTML = data.cases;
            document.getElementById("Critical_Cases").innerHTML = data.critical;
            document.getElementById("Total_Death").innerHTML = data.deaths;
            document.getElementById("Recovered_Cases").innerHTML = data.recovered;
            document.getElementById("Total_Test_Done").innerHTML = data.tests;
        });

</script>

<div class="animatediv">
    <img src="https://atheistiran.com/wp-content/uploads/2020/03/corona-virus.png">
</div>


<div class="container text-center">
    <h1 class="">Covid-19   <span id="country"></span> <img src="" alt="" id="flag"></h1>

    <br>

    <div class="card-deck text-center">
        <div class="card mb-2">
            <div class="card-body bg-primary text-light rounded">
                <h5 class="card-title"><i class="fas fa-tachometer-alt fa-2x"></i></h5>
                <h4 class="card-text">Aktívne prípady</h4>
                <p class="card-text badge badge-outline-light" id="Active_Cases">21</p>
            </div>
        </div>
        <div class="card mb-2">
            <div class="card-body bg-info text-light rounded">
                <h5 class="card-title"><i class="fas fa-list fa-2x"></i></h5>
                <h4 class="card-text">Všetky prípady</h4>
                <p class="card-text badge badge-outline-light" id="Total_Cases">21</p>
            </div>
        </div>
        <div class="card mb-2">
            <div class="card-body bg-warning text-light rounded">
                <h5 class="card-title"><i class="fas fa-times-circle fa-2x"></i></h5>
                <h4 class="card-text">Kritické prípady</h4>
                <p class="card-text badge badge-outline-light" id="Critical_Cases">21</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body bg-danger text-light rounded">
                <h5 class="card-title"><i class="fa fa-times fa-2x"></i></h5>
                <h4 class="card-text">Všetky úmrtia</h4>
                <p class="card-text badge badge-outline-light" id="Total_Death">21</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body bg-success text-light rounded">
                <h5 class="card-title"><i class="fas fa-check-square fa-2x"></i></h5>
                <h4 class="card-text">Pozitívny PCR ľudia</h4>
                <p class="card-text badge badge-outline-light" id="Recovered_Cases">21</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body bg-secondary text-light rounded">
                <h5 class="card-title"><i class="fas fa-eye fa-2x"></i></h5>
                <h4 class="card-text">Počet PCR testov</h4>
                <p class="card-text badge badge-outline-light" id="Total_Test_Done">21</p>
            </div>
        </div>
    </div>
</div>


<!-- Corona animation container -->
<div class="animatediv">
    <img src="https://atheistiran.com/wp-content/uploads/2020/03/corona-virus.png">
</div>

<!-- Image on top of the Main menu container -->
<img src="https://atheistiran.com/wp-content/uploads/2020/03/people-mask.png" class="TopImage">

<!-- Main Menu Start -->
<ul class="menu shadow">

    <li>
        <a>Často si čistite ruky</a>
    </li>

    <li>
        <a>Zabráňte blízkemu kontaktu</a>
    </li>

    <li>
        <a>Ak ste chorí, zostaňte doma</a>
    </li>

    <li>
        <a>Zakryte kašeľ a kýchanie</a>
    </li>

    <li>
        <a>Ak ste chorí, noste masku na tvár</a>
    </li>

    <li>
        <a>Vyčistite a dezinfikujte</a>
    </li>
</ul>


<div class="container" align="center">
    <iframe
            style="border:0;width:80%;height:500px;display:block"
            src="https://mapa.covid.chat/embed">

    </iframe>
</div>

<br>
<br>
<br>
<br>
<br>

<%@include file="footer.jsp"%>


</body>
</html>