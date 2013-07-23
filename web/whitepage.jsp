<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String separator1 = null;
    String separator2 = null;
    //String separator3 = null;%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;">
      <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
     
      
         

        <title>NewSum Widget</title>
        <script>
            function showmenu(elmnt)
            {
                document.getElementById(elmnt).style.visibility = "visible";
            }
            function hidemenu(elmnt)
            {
                document.getElementById(elmnt).style.visibility = "hidden";
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
    <body style=" background-color: #ffffff;">
        <!--   <div class="container" style="width: auto;">
               <div class="navbar navbar-static">
                   <div class="navbar-inner">
                       <div class="container" style="width: auto;">
   
                           <ul class="nav">
                               <li><a href="http://www.scify.gr/site/en/newsum-en" target='_blank'><img src="img/logoNewSum2.png"></a></li>
                               
                                   <li style=" padding-top: 4%; font-family: sans-serif; font-size: 110%;" onmouseover="mopen('m1')"
                                       onmouseout="mclosetime()"><a href="#" style=" color: #9900ff;">Categories</a>
                                       <div id="m1"><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a>
                                       <a href="category.jsp?cat=Technology" class="navbar">Technology</a>
                                       <a href="category.jsp?cat=SciFY News" class="navbar">Scify News </a>
                                       <a href="category.jsp?cat=Europe" class="navbar">Europe</a>
                                       <a href="category.jsp?cat=Top News" class="navbar">Top News</a>
                                       <a href="category.jsp?cat=Science" class="navbar">Science</a>
                                       <a href="category.jsp?cat=Business" class="navbar">Business</a>
                                       <a href="category.jsp?cat=World" class="navbar">World</a>
                                       <a href="category.jsp?cat=Education" class="navbar">Education</a></div>
                                   </li>
        <!--<li class="dropdown"><a onmouseover="showhide('infid')"  href="#" >Categories</a>
            <ul class="dropdown-menu" data-toggle="dropdown" id="info">
                <li ><a  href="#" >Τεχνολογία</a></li>
                <li ><a  href="#" >Επιστήμη</a></li>
                <li ><a  href="#" >Αθλητισμός</a></li>
                <li ><a  href="#" >Ελλάδα</a></li>
                <li ><a  href="#" >Κόσμος</a></li>
                <li ><a  href="#" >SciFY News</a></li>
                <li ><a  href="#" >Γενικά</a></li>
                <li ><a  href="#" >Οικονομία</a></li>
                <li ><a  href="#" >Εκπαίδευση</a></li>
                <li ><a  href="#" >Πολιτισμός</a></li>
            </ul>
        </li>
        <li><a href="http://www.scify.gr/site/en/support-us" target="_blank"><img src="img/Scify-min.png"></a></li>
    </ul>

    <img src="img/gr.png">
    <img src="img/us.png" style="padding-left: 0.8%;">
    </br>
    <a onclick="getElementById('searchDIV').style.visibility = 'visible';" href="#"><i class="icon-search"></i></a>
</div>
</div>
</div>

     <li><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a></li>
        <li><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a></li>
        <li><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a></li>
        <li><a href="category.jsp?cat=Open Source" class="navbar">Open Source</a></li>
</div><ul id="info" class="dropdown-submenu" style=" background-color: #9999ff; border-color: #000000; border: 1;">
                           
                            <li><a style=" color: #666666;" href="category.jsp?cat=Open Source" class="navbar">Open Source</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Technology" class="navbar">Technology</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=SciFY News" class="navbar">Scify News </a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Europe" class="navbar">Europe</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Top News" class="navbar">Top News</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Science" class="navbar">Science</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Business" class="navbar">Business</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=World" class="navbar">World</a></li></br>
                            <li><a style=" color: #666666;" href="category.jsp?cat=Education" class="navbar">Education</a></li></br>
                           
                        </ul> 

        -->
         <div class='navbar'>

            <div class='navbar-inner' >
                <ul class="nav" >

                    <li ><a href="http://www.scify.gr/site/en/newsum-en" target='_blank'><img src="img/logoNewSum2.png"></a></li>
                    <li style=" padding-top: 4%; font-family: sans-serif; " onmouseover="showmenu('info')" onmouseout="hidemenu('info')"><a href="#" style=" color: #000000;">Categories</a>    
                        <table  class="nav table"  id="info" height="0" style=" width: 100%; padding-top: 9%; text-align:  center"  border="0">
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Open Source" class="navbar">Open Source</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Technology" class="navbar">Technology</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=SciFY News" class="navbar">Scify News </a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Europe" class="navbar">Europe</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Top News" class="navbar">Top News</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Science" class="navbar">Science</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Business" class="navbar">Business</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=World" class="navbar">World</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td class="navbar"><a style=" color: #666666;" href="category.jsp?cat=Education" class="navbar">Education</a></td></tr>
                        </table> 
                    </li>

                    <li style=" padding-top: 0.5%;"><a href="http://www.scify.gr/site/en/support-us" target="_blank"><img src="img/Scify-min.png"></a></li>
                
                    <li><img src="img/gr.png"></li></br>
                    <li><img src="img/us.png"></li>
                </ul>
            </div>

        </div>
       
        <div class="container-fluid" style="background-color: #ffffff;">

            <div class="row-fluid" >
                    <div id="output" class="span10">
                        <%-- start web service invocation --%>
                        <%
                            try {
                                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                                // TODO process result here
                                java.lang.String result = port.getFirstLevelSeparator();
                                separator1 = result;
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
                                // TODO initialize WS operation arguments here
                                java.lang.String sUserSources = "All";
                                java.lang.String result1 = port.getCategories(sUserSources);
                                //java.lang.String sCategory = "Europe";
                                String c[] = result1.split(separator1);
                        %><table class="table " style=" text-align: center;"><%

                            for (int j = 0; j < c.length; j++) {
                        %><tr style=" background-color: #33ccff;"><td><a style=" color: #ffffff;" href="category.jsp?cat=<%out.print(c[j].toString());%>"><% out.print(c[j].toString() + "</br>");%></a></td></tr><%

                            java.lang.String result = port.getTopicTitles(sUserSources, c[j].toString());
                            String[] r = result.split(separator1);
                            String[] r2;
                            for (int i = 0; i < 2; i++) {
                                r2 = r[i].split(separator2);
                                        %>
                            <tr class="warning"><td><div><a class='button' onclick="javascript:showdiv('<%out.print(r[i].toString());%>');"><% out.print(r2[1].toString() + "</br>");%></a></div></td></tr>
                                        <%

                                                }
                                            }
                                        %></table>

                        <%
                                //out.println("Result = " + result);
                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        %>
                        <%-- end web service invocation --%>

                    </div>
                
            </div>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>

    </body>
</html>
