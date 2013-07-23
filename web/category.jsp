<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%String separator1 = null;
    String separator2 = null;
    String separator3 = null;%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function showdiv(id) {
                if (document.getElementById(id).style.display == "none") {

                    document.getElementById(id).style.display = "block";
                }
                else {
                    document.getElementById(id).style.display = "none";
                }
            }
            function hidediv(id) {
                document.getElementById(id).style.display = 'none';
            }

        </script> 
        <script>
            function showmenu(elmnt)
            {
                var t = document.getElementById(elmnt).style.visibility;
                if (t != "visible")
                    document.getElementById(elmnt).style.visibility = "visible";
                else
                    return;
            }
            function hidemenu(elmnt)
            {
                var t = document.getElementById(elmnt).style.visibility;
                if (t != "hidden")
                    document.getElementById(elmnt).style.visibility = "hidden";
                else
                    return;

            }
        </script>
        <script>
            var divState = {}; // we store the status in this object
            function showhide(id) {
                if (document.getElementById) {
                    var divid = document.getElementById(id);

                    divState[id] = (divState[id]) ? false : true; // initialize / invert status (true is visible and false is closed)
                    //close others
                    for (var div in divState) {
                        if (divState[div] && div != id) { // ignore closed ones and the current
                            document.getElementById(div).style.display = 'none'; // hide
                            divState[div] = false; // reset status
                        }
                    }
                    divid.style.display = (divid.style.display == 'block' ? 'none' : 'block');
                }
            }
        </script>
    </head>
    <body>
        <%
            String cat_name = request.getParameter("cat");%>
        <%-- start web service invocation --%>
        <%
            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                // TODO process result here
                java.lang.String result = port.getFirstLevelSeparator();
                separator1 = result;
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        %>
        <%-- end web service invocation --%>
        <%-- start web service invocation --%>
        <%
            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                // TODO process result here
                java.lang.String result = port.getSecondLevelSeparator();
                separator2 = result;
                //out.println("Result = " + result);
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        %>
        <%-- end web service invocation --%>
        <%-- start web service invocation --%>
        <%
            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                // TODO process result here
                java.lang.String result = port.getThirdLevelSeparator();
                separator3 = result;
                //out.println("Result = "+result);
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        %>
        <%-- end web service invocation --%>


        <div class='navbar'>
            <div class='navbar-inner nav-collapse' style="height: auto; ">
                <ul class="nav" >
                    <li ><a href="http://www.scify.gr/site/en/newsum-en" target='_blank'><img src="img/logoNewSum2.png"></a></li>
                    <li style=" padding-top: 4%; font-family: sans-serif; font-size: 100%;" onmouseover="showmenu('info')" onmouseout="hidemenu('info')"><a href="#" style=" color: #9900ff;">Categories</a>    
                        <table  class="nav table table-striped nav-collapse "  id="info" height="0" style=" width: 100%; padding-top: 9%; text-align:  center;"  border="0">
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Technology" class="navbar">Technology</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=SciFY News" class="navbar">Scify News </a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Europe" class="navbar">Europe</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Top News" class="navbar">Top News</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Science" class="navbar">Science</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Business" class="navbar">Business</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=World" class="navbar">World</a></td></tr>
                            <tr class="info"><td class="navbar"><a href="category.jsp?cat=Education" class="navbar">Education</a></td></tr>
                        </table></li>
                    <li style=" padding-top: 0.5%;"><a href="http://www.scify.gr/site/en/support-us" target="_blank"><img src="img/Scify-min.png"></a></li>
                </ul>
                <img src="img/gr.png">
                <img src="img/us.png" style="padding-left: 0.8%;">
                <br>
                <a onclick="getElementById('searchDIV').style.visibility = 'visible';" href="#"><i class="icon-search"></i></a>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div id="searchDIV" style="visibility: hidden;">
                        <input id="searchtext" class="search-query" type="text" placeholder="Search">
                        <a onclick=" getElementById('searchDIV').style.visibility = 'hidden';" href="#"><img  class="icon-remove"></a>
                    </div></br>
                    <div id="output">

                        <div class="info" style=" color: #999999;"  >
                            <table class=" table table-striped"><tr class="info"><td><b><%out.print(cat_name + "</br>");%></b></td></tr></table>
                                            <%-- start web service invocation --%>
                                            <%
                                                try {
                                                    org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                                                    org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                                                    // TODO initialize WS operation arguments here
                                                    java.lang.String sUserSources = port.getLinkLabels();
                                                    java.lang.String sCategory = cat_name;
                                                    // TODO process result here
                                                    java.lang.String result = port.getTopicIDs(sUserSources, sCategory);
                                                    String[] r = result.split(separator1);
                                            %><table class="table table-striped"><%
                                                        for (int i = 0; i < r.length; i++) {

                                %>

                                <tr ><td><a class="button"  onclick="showhide('<%out.print(r[i].toString());%>')"><%out.println("Title = " + port.getTopicTitlesByID(r[i].toString()) + "</br>");%></a></td></tr>
                                <tr><td> <div id='<%out.print(r[i].toString());%>' style='display: none;'>

                                            <%
                                                //String[] s2 = s1[i].split(separator3);
                                                 out.println(" Ο κ.Σόιμπλε δεν έρχεται λοιπόν στην Αθήνα ως νέος ρωμαίος Imperator, που επισκέπτεται τις ευρωπαϊκές επαρχίες του, όπως το φαντάζεται ο Αλέξης Τσίπρας, αλλά ως ο αρχιτέκτονας μιας νέας τάξης πραγμάτων, που δεν γνωρίζει εδαφικές κατακτήσεις και προσαρτήσεις, αλλά κτίζεται στα ερείπια του κοινωνικού κράτους, της δημόσιας περιουσίας και των εργασιακών δικαιωμάτων – όλα αυτά στο όνομα της επανάκτησης της ανταγωνιστικότητας.Ο κ.Σόιμπλε δεν έρχεται λοιπόν στην Αθήνα ως νέος ρωμαίος Imperator, που επισκέπτεται τις ευρωπαϊκές επαρχίες του, όπως το φαντάζεται ο Αλέξης Τσίπρας, αλλά ως ο αρχιτέκτονας μιας νέας τάξης πραγμάτων, που δεν γνωρίζει εδαφικές κατακτήσεις και προσαρτήσεις, αλλά κτίζεται στα ερείπια του κοινωνικού κράτους, της δημόσιας περιουσίας και των εργασιακών δικαιωμάτων – όλα αυτά στο όνομα της επανάκτησης της ανταγωνιστικότητας."+"</br>");
                                            %>
                                        </div></td></tr>

                                <%
                                    }
                                %>  </table><%
                                                        } catch (Exception ex) {
                                                            // TODO handle custom exceptions here
                                                        }
                                %>
                                <%-- end web service invocation --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>

    </body>
</html>
