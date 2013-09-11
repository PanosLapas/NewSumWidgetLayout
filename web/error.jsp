<%-- 
    Document   : CustomWidget
    Created on : 26 Ιουλ 2013, 9:43:33 πμ
    Author     : plapas
--%>

<%@page import="javax.jms.Session"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.scify.NewSumInterface.Server.JSon.*"%>
<%@page import="org.scify.NewSumInterface.Server.Adaptor.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8" %> 
<%@ page import="java.net.URLDecoder"%>

<% response.addHeader("Refresh","1800"); %> 
<%//parameters for opening BasicLayout (Theme color, Font family)
    String message = request.getParameter("m");    
    String BackGrCol = request.getParameter("backGrCol");
    String FontCol = request.getParameter("fontCol");
    String fonFm = request.getParameter("font-family");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" >
        <!--Calling the css with appropriate variables--> 
        <link href="css/bootstrap/CreateCss.jsp?backGrCol=<%out.print(BackGrCol);%>&FontCol=<%out.print(FontCol);%>&fonFm=<%out.print(fonFm);%>" rel="stylesheet">
        <title>NewSum Widget</title>
    </head>
    <body >

        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    
                </div>
            </div>
        </div>
                        <div class="row-fluid">
                            <h4>Λυπούμαστε αλλά δεν μπορούμε να σας εξυπηρετήσουμε.</h4>
                            <%if(message.equals("links")){%>
                            <h5>Υπάρχει κάποιο πρόβλημα με τους συνδέσμους των πηγών.</h5>
                            <h5>Δοκιμάστε ξανά αργότερα.</h5>
                            <%}else if(message.equals("cats")){%>
                            <h5>Υπάρχει κάποιο πρόβλημα με τις κατηγορίες των ειδήσεων.</h5>
                            <h5>Δοκιμάστε ξανά αργότερα.</h5>
                            <%}else if(message.equals("topics")){%>
                            <h5>Υπάρχει κάποιο πρόβλημα με τους τίτλους των ειδήσεων.</h5>
                            <h5>Δοκιμάστε ξανά αργότερα.</h5>
                            <%}else if(message.equals("sum")){%> 
                            <h5>Υπάρχει κάποιο πρόβλημα με τις περιλήψεις των ειδήσεων.</h5>
                            <h5>Δοκιμάστε ξανά αργότερα.</h5>
                            <%}else{%>
                            <h5>Δοκιμάστε ξανά αργότερα.</h5>
                            <%}%>
                              <a href="Layout.jsp?&font-family=<%out.print(fonFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><img src="img/ref.png"></a>
                              <br>
                            <img src="img/under3.jpeg" style=" alignment-adjust: middle;">
                        </div>  
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
