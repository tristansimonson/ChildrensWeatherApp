<%-- 
    Document   : disasters
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style>      
    table, th, td{
        padding: 1px;
        border: 1px solid black;
    }
    .grid-container {
        display: grid;
        grid-template-columns: auto auto;
        grid-template-rows: 200px;
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
        font-size: 25px;
        border-collapse: collapse;
        width: 100%;
    }

.address-bar {
  padding-bottom: 5px;
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
.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 15px 25px;
  text-decoration: none;
  font-size: 30px;
  font-family: "Luckiest Guy";
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #37a69b;
  color: white;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 4px;
  font-size: 17px;
  border: none;
}

/* Darker background on mouse-over */
.btn:hover {
    background-color: RoyalBlue;
}
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disasters</title>
    <link rel='stylesheet' href='css/style.css' />
</head>
<body>
    <header>
        <img class='banner' src="images/weather-banner2.jpg" alt="Weather Banner" >
    </header>
    
    <ul class="address-bar">
        <a href="location.jsp"><button class="btn"><i class="fa fa-home"></i></button></a>
        <a href="addresses.jsp"><button class="btn"><i class="fa fa-globe"></i></button></a>
        <a href="locations.jsp"><button class="btn"><i class="fa fa-address-book"></i></button></a>
        <a href="dates.jsp"><button class="btn"><i class="fa fa-calendar"></i></button></a>
    </ul>
    
    <div class="topnav">
        <a id="currentPage">DISASTERS</a>
    </div>
    
    <div class="grid-container">
        <div class="grid-item">
            <p> Addresses are important because they tell you where something is. 
                Addresses are used when someone has to mail something. They can also 
                be used to search for a place, like when you search for the weather!
                Addresses are made up of:
                <br> PERSONS NAME </br> 
                STREET ADDRESS, CITY 
                <br> STATE ZIPCODE </br>
                To search for weather on our website you only need to use CITY, STATE
                try it out! STATE will be in the abbreviated, or short, form. So IOWA
                would be shortened to IA.
            </p>
        </div>
        <div class="grid-item">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/y2d-0dIimgY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>
    </div>
</body>
</html>
