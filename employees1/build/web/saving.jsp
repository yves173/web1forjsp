<%-- 
    Document   : saving
    Created on : Mar 6, 2022, 12:03:04 AM
    Author     : green
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>EmployeeRegistrationForm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- LINEARICONS -->
        <link rel="stylesheet" href="fonts/linearicons/style.css">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- DATE-PICKER -->
        <link rel="stylesheet" href="vendor/date-picker/css/datepicker.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {font-family: "Lato", sans-serif}
            .mySlides {display: none}
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-black w3-card">
                <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a href="index.html" class="w3-bar-item w3-button w3-padding-large">REGISTER</a>
                <a href="displaying.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LIST</a>

            </div>
        </div>

        <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
        <div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
            <a href="displaying.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">LIST</a>

        </div>


        <div class="wrapper">
            <div class="inner" style="color: red">
                <%

                    try {

                        String empName = request.getParameter("names");
                        String empId = request.getParameter("empId");
                        SimpleDateFormat bd = new SimpleDateFormat("dd-MM-yyyy");
                        Date dateOB = bd.parse(request.getParameter("birthday"));
                        java.sql.Date dateOfBirth = new java.sql.Date(dateOB.getTime());
                        String gender = request.getParameter("gender");
                        Double salary = Double.parseDouble(request.getParameter("salary"));

                        DriverManager.registerDriver(new org.postgresql.Driver());
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/recap1", "postgres", "green1");

                        PreparedStatement pst = con.prepareStatement("insert into employee values(?,?,?,?,?)");
                        pst.setString(1, empId);
                        pst.setDate(2, dateOfBirth);
                        pst.setString(3, gender);
                        pst.setString(4, empName);
                        pst.setDouble(5, salary);
                        pst.execute();
                        pst.close();
                        con.close();
                        out.print("an employee is successfully saved");
                    } catch (Exception e) {

                        out.println("an employee is not saved");
                        //out.print(e.getMessage());
                    }


                %>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>

        <!-- DATE-PICKER -->
        <script src="vendor/date-picker/js/datepicker.js"></script>
        <script src="vendor/date-picker/js/datepicker.en.js"></script>

        <script src="js/main.js"></script>

        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-black w3-card">
                <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a href="index.html" class="w3-bar-item w3-button w3-padding-large">REGISTER</a>
                <a href="displaying.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LIST</a>

            </div>
        </div>

        <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
        <div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
            <a href="displaying.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">LIST</a>

        </div>
    </body>
</html>
