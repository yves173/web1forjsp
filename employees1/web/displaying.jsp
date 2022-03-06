<%-- 
    Document   : displaying
    Created on : Mar 6, 2022, 12:23:53 AM
    Author     : green
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Employee List </title>
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
            table, th, td {
                border: 1px solid white;
                border-collapse: collapse;
            }
            th, td {
                background-color: #96D4D4;
            }
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
            <div class="inner" style="color: blue">
                <%

                    try {

                        DriverManager.registerDriver(new org.postgresql.Driver());
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/recap1", "postgres", "green1");

                        Statement st = con.createStatement();
                        //st.execute(qry); to pass values to DB
                        ResultSet rs = st.executeQuery("select * from employee");
                        int cols = rs.getMetaData().getColumnCount();
                        out.println("<table>");
                        out.println("<tr>");
                        for (int i = 1; i <= cols; i++) {
                            out.println("<td>");
                            out.println(rs.getMetaData().getColumnName(i));
                            out.println("</td>");
                        }
                        out.println("</tr>");
                        while (rs.next()) {
                            out.println("<tr>");
                            for (int i = 1; i <= cols; i++) {
                                out.println("<td>");
                                out.println(rs.getObject(i));
                                out.println("</td>");
                            }
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        st.close();
                        con.close();

                    } catch (Exception e) {

                        out.print("sorry we can't display the list a this moment");
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