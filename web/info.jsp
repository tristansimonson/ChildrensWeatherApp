<%-- 
    Document   : info
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
    .grid-item{
        font-family: "Comic Sans MS";
        font-weight: bold;
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
        padding: 25px 25px;
        text-decoration: none;
        font-size: 50px;
        color: dodgerblue;
        font-family: "Luckiest Guy";
        text-shadow: 3px 3px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
    }
    /* Darker background on mouse-over */
    .btn:hover {
        background-color: RoyalBlue;
    }
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Info</title>
    <link rel='stylesheet' href='css/style.css' />
</head>
<body>
    <header>
        <img class='banner' src="images/weather-banner2.jpg" alt="Weather Banner" >
    </header>
    
    <ul class="address-bar">
        <a href="location.jsp"><button class="btn"><i class="fa fa-home"></i></button></a>
    </ul>
    
    <div class="topnav">
        <a id="currentPage">INFO</a>
    </div>
    
    <div class="grid-container">
        <div class="grid-item">
            <p> When reading the weather there are some important things to look
                for. "60F 5mph N" means that it is 60 degrees Farenheit outside
                with a 5 mile per hour wind coming from the North. Farenheit is
                a scale used to measure weather in the United States and some
                other places, you might use Celsius though! To compare Farenheit
                and Celsius, click "F" and "C" to the right of the search bar.
                Miles per hour is used to measure the speed of the wind, this 
                could also be kilometers per hour depending on your location! 
                When you see things like "60F/40F" these are the high and low 
                temperatures for the day. 60F will be the high and 40F will be 
                the low!
            </p>
        </div>
        <div class="grid-item">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/hj1MG3e6Y1M?start=73" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>
    </div>
</body>
</html>
