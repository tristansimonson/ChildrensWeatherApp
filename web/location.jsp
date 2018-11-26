<%-- 
    Document   : location
    Created on : Apr 17, 2018, 8:47:24 PM
    Author     : tristan
--%>

<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>         


<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Luckiest+Guy" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>      
    table, th, td{
        padding: 1px;
        border: 1px solid black;
    }
    nav {
        padding-bottom: 15px;
        color: white;
        background-color: #333;
    }
    .grid-container {
        display: grid;
        grid-template-columns: 25% 40% 35%;
        background-color: #FFF;
        padding: 10px;
        line-height: 0.75;
    }
    .grid-outfit {
        display: grid;
        grid-template-columns: auto;
        grid-template-rows: auto auto;
        background-color: #FFF;
        padding: 10px;
    }
    .weather-container {
        display: grid;
        grid-template-columns: auto auto;
        background-color: #FFF;
        padding: 10px;
    }
    .item1{
        grid-row: 1 / 8;
        padding-right: 10px;
    }
    #summary {
        /*font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;*/
        font-family: "Luckiest Guy";
        font-size: 32px;
        border-collapse: collapse;
        width: 100%;
        color: #e9e9e9;
        text-shadow: 3px 3px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
    }
    .topnav {
        overflow: hidden;
        background-color: #e9e9e9;
    }
    .topnav a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 25px 25px;
        text-decoration: none;
        font-size: 50px;
        color: dodgerblue;
        font-family: "Luckiest Guy";
        text-shadow: 3px 3px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
    }
    .address-bar {
        padding-bottom: 5px;
    }
    .search-container {
        float: right;
    }
    .search-container .btn {
        float: right;
        margin-top: 5px;
        background-color: DodgerBlue;
        border: none;
        color: white;
        width: 20%;
        padding: 12px 16px;
        font-size: 25px;
        cursor: pointer;
    }
    .search-container .search-bar {
        font-size: 20px;
        width: 75%;
        height: 50px;
        margin: 5px 5px 0 0;
    }
    .btn {
        margin-top: 5px;
        background-color: DodgerBlue;
        border: none;
        color: white;
        width: 5%;
        padding: 12px 16px;
        font-size: 25px;
        cursor: pointer;
    }
    /* Darker background on mouse-over */
    .btn:hover {
        background-color: RoyalBlue;
    }
    @media screen and (max-width: 600px) {
        .topnav .search-container {
            float: none;
        }
        .topnav a, .topnav input[type=text], .topnav .search-container .btn {
            float: none;
            display: block;
            text-align: left;
            width: 100%;
            margin: 0;
            padding: 14px;
        }
        .topnav input[type=text] {
            border: 1px solid #ccc;  
        }
    }
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location</title>
    <link rel='stylesheet' href='css/style.css'>
</head>
<body>
    <script>
        function changeLoc(cityStateInput){
            fetch('LocationServlet/?cityState='+cityStateInput, {method: 'GET'})
            .then(function(res) {
                return res.json();
            })
            .then(function(data) {
                document.getElementById("cityState").innerHTML = data.cityState;
                document.getElementById("currently").innerHTML = data.temperatureF + " " + data.wind;
                document.getElementById("todayHighLow").innerHTML = data.highTemperatureF + "/" + data.lowTemperatureF;
                document.getElementById("tomorrowHighLow").innerHTML = data.tomorrowHighF + "/" + data.tomorrowLowF;
                var tempDescription = "HOT";
                document.getElementById("tempDescription").style.color = "red";
                document.getElementById("currently").style.color = "red";
                document.getElementById("outfitHeader").style.color = "red";
                document.getElementById("thermIMG").src = "images/hot-therm-white.jpg";
                var strippedTemp = data.temperatureF.replace("F", "");
                var temp = parseInt(strippedTemp);
                if(temp <= 70 && temp > 60){
                    tempDescription = "WARM";
                    document.getElementById("thermIMG").src = "images/hot-therm-white.jpg";
                    document.getElementById("tempDescription").style.color = "orange";
                    document.getElementById("currently").style.color = "orange";
                    document.getElementById("outfitHeader").style.color = "orange";
                }
                if(temp <= 60 && temp > 45){
                    tempDescription = "COOL";
                    document.getElementById("thermIMG").src = "images/cold-therm-white.jpg";
                    document.getElementById("tempDescription").style.color = "deepskyblue";
                    document.getElementById("currently").style.color = "deepskyblue";
                    document.getElementById("outfitHeader").style.color = "deepskyblue";
                }
                if(temp <= 45){
                    tempDescription = "COLD";
                    document.getElementById("thermIMG").src = "images/cold-therm-white.jpg";
                    document.getElementById("tempDescription").style.color = "cornflowerblue";
                    document.getElementById("currently").style.color = "cornflowerblue";
                    document.getElementById("outfitHeader").style.color = "cornflowerblue";
                }
                document.getElementById("outfitHeader").innerHTML = "Pick an Outfit";
                document.getElementById("tempDescription").innerHTML = tempDescription;
            })
        }
        
        function checkOutfit(outfit){
            if(outfit === 1 && document.getElementById("tempDescription").innerHTML === "COLD"){
                document.getElementById("outfitHeader").innerHTML = "Correct";
                document.getElementById("outfitHeader").style.color = "green";
            }
            else if(outfit === 2 && document.getElementById("tempDescription").innerHTML === "WARM"){
                document.getElementById("outfitHeader").innerHTML = "Correct"; 
                document.getElementById("outfitHeader").style.color = "green";
            }
            else if(outfit === 2 && document.getElementById("tempDescription").innerHTML === "COOL"){
                document.getElementById("outfitHeader").innerHTML = "Correct";
                document.getElementById("outfitHeader").style.color = "green";
            }
            else if(outfit === 3 && document.getElementById("tempDescription").innerHTML === "HOT"){
                document.getElementById("outfitHeader").innerHTML = "Correct";   
                document.getElementById("outfitHeader").style.color = "green";
            }
            else{
                document.getElementById("outfitHeader").innerHTML = "Incorrect"; 
                document.getElementById("outfitHeader").style.color = "red";
            }
        }
    </script>
    <header>
        <img class='banner' src="images/weather-banner2.jpg" alt="Weather Banner" >
    </header>
    
    <ul class="address-bar">
        <a href="addresses.jsp"><button class="btn"><i class="fa fa-address-book"></i></button></a>
        <a href="locations.jsp"><button class="btn"><i class="fa fa-globe"></i></button></a>
        <a href="disasters.jsp"><button class="btn"><i class="fa fa-bolt"></i></button></a>
        <a href="dates.jsp"><button class="btn"><i class="fa fa-calendar"></i></button></a>
        <a href="info.jsp"><button class="btn"><i class="fa fa-question-circle"></i></button></a>
        <a><button id="celcius" class="btn" style="float: right">C</button></a>
        <button id="fahrenheit" class="btn" style="float: right; margin-left: 5px; margin-right: 5px">F</button>
        <div class="search-container">
            <button class="btn" id="myBtn" onclick="changeLoc(document.getElementById('cityState').value)"><i class="fa fa-search" ></i></button>      
            <input class="search-bar" id="cityState" style="float:right" type="text" placeholder="ex. Iowa City, IA" name="cityState">
        </div>
    </ul>
    <div class="topnav">
        <a id="todayDate"></a>
    </div>
    <div class="grid-container" id="summary">
        <div class="grid-item">
            <div>
                <img id="thermIMG" width="80%" height="80%" src="images/hot-therm-white.jpg" alt="thermometer image" >
            </div>
            <%  
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/childrens_weatherdb?","root","NewPassword");
            
            // pulls saved locations from account table using email
            // if nobody is logged in no saved locations get displayed
            Statement slStatement = connection.createStatement();
            ResultSet slresultset = null; 
            // set default location to savedlocation1
            ResultSet defaultresultset = slStatement.executeQuery("select loc1 from login where email='" + session.getAttribute("email") + "'");
            
            // initialize variable
            String varCityState = "'Iowa City, IA'";
            // check if there is a saved location
            if(defaultresultset.next()){
                // default location
                varCityState = defaultresultset.getString(1);
            }
            
            // get current hour (0-23) and add 1 to get readable hour
            int hour = LocalDateTime.now().getHour();
            hour += 1;
            // create string for time ex. "1:00AM"
            String hourAMPM = hour +":00AM";
            // if time is greater than 12 it is in the afternoon
            if(hour > 12){
                hour -= 12;
                hourAMPM = hour +":00PM";
            }
            
            Statement displaystatement = connection.createStatement();
            // times weather for the display area
            String displaycommand = "Select temperatureF, temperatureC, highTemperatureF, highTemperatureC, lowTemperatureF, lowTemperatureC, wind, tomorrowHighF, tomorrowHighC, tomorrowLowF, tomorrowLowC from today where cityState="+ varCityState +" and time='2:00PM'"; 
            ResultSet displayresultset = displaystatement.executeQuery(displaycommand);
            
            //holds description of temp outside
            String tempDescription = "HOT";
            String tempColor = "red";
            int temp = 0;
            String strippedTemp = "";
            
            // populate current weather for display found on lefthand side of screen
            if(displayresultset.next()){
                strippedTemp = displayresultset.getString(1).replace("F", "");
                temp = Integer.parseInt(strippedTemp);
                if(temp <= 70 && temp > 60){
                    tempDescription = "WARM";
                    tempColor = "orange";
                }
                if(temp <= 60 && temp > 45){
                    tempDescription = "COOL";
                    tempColor = "light blue";
                }
                if(temp <= 45){
                    tempDescription = "COLD";
                    tempColor = "blue";
                }
            %>
        </div>    
        <div class="grid-item" style="padding-top: 25px">
            <div>
                <div>
                    <h style="color:<%=tempColor%>; font-size:100px; font-family:Luckiest Guy; text-shadow: 3px 3px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000" id="tempDescription"><%=tempDescription%></h>
                    <p id="currently" style="color:<%=tempColor%>; font-size:40px"><%=displayresultset.getString(1)%> <%=displayresultset.getString(7)%></p>
                </div>
                <p id="todayHighLow"> <%=displayresultset.getString(3)%>/<%=displayresultset.getString(5)%></p>
            </div>
            <div>
                <h>Tomorrow</h>
                <p id="tomorrowHighLow"> <%=displayresultset.getString(8)%>/<%=displayresultset.getString(10)%> </p>
            </div>
            <%
            }
            %>
        </div>
        <div class="grid-item" style="padding-top: 25px">
            <div class="grid-outfit">
                <h style="color:<%=tempColor%>; font-size: 40px; text-shadow: 3px 3px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000" id="outfitHeader"> Pick an Outfit </h>
                <div id="1" onclick="checkOutfit(1)">
                    <img width="100" src="images/boy-cold-weather.png" alt="boy cold" >
                    <img width="100" src="images/girl-cold-weather.png" alt="girl cold" >
                </div>
                <div id="2" onclick="checkOutfit(2)">
                    <img width="100" src="images/boy-warm-weather.png" alt="boy warm" >
                    <img width="100" src="images/girl-warm-weather.png" alt="girl warm" >
                </div>
                <div id="3" onclick="checkOutfit(3)">
                    <img width="100" src="images/boy-hot-weather.jpg" alt="boy hot" >
                    <img width="100" src="images/girl-hot-weather.png" alt="girl hot" >
                </div>
            </div>
        </div>
    </div>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getMonth()+1)+"-"+String(d.getDate())+"-"+String(d.getFullYear());
        
        var input = document.getElementById("cityState");
        input.addEventListener("keyup", function(event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                document.getElementById("myBtn").click();
            }
        })
    </script>
</body>
</html>
