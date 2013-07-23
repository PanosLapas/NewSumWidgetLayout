<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>

        <div class='navbar'>

            <div class='navbar-inner nav-collapse' >
                <ul class="nav" >

                    <li ><a href="http://www.scify.gr/site/en/newsum-en" target='_blank'><img src="img/logoNewSum2.png"></a></li>
                    <li style=" padding-top: 4%; font-family: sans-serif; font-size: 110%;" onmouseover="showmenu('info') + hidemenu('output')" onmouseout="hidemenu('info') + showmenu('output')"><a href="#" style=" color: #9900ff;">Categories</a>                     
                        
                        <table  class="nav" id="info" height="0" style=" width: 100%; padding-top: 9%;"  border="0">
                            <tr><td class="navbar"><a href="cat1.jsp" class="navbar">Open Source</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Technology</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Scify News </a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Europe</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Top News</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Science</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Business</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">World</a></td></tr>
                            <tr><td class="navbar"><a href="#" class="navbar">Education</a></td></tr>
                        </table>
                    </li>
                    <li style=" padding-top: 0.5%;"><a href="http://www.scify.gr/site/en/support-us" target="_blank"><img src="img/Scify-min.png"></a></li>
                </ul>
                <img src="img/gr.png">
                <img src="img/us.png" style="padding-left: 0.8%;">
                <br>
                <a onclick="getElementById('searchDIV').style.visibility = 'visible';" href="#"><i class="icon-search"></i></a>

            </div>

        </div>    <%-- start web service invocation --%><hr/>
    <%
    try {
	org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
	org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String sUserSources = "";
	java.lang.String sCategory = "";
	// TODO process result here
	java.lang.String result = port.getTopicIDs(sUserSources, sCategory);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

    <%-- start web service invocation --%><hr/>
    <%
    try {
	org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
	org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String sTopicID = "";
	java.lang.String sUserSources = "";
	// TODO process result here
	java.lang.String result = port.getSummary(sTopicID, sUserSources);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div id="searchDIV" style="visibility: hidden;">
                        <input id="searchtext" class="search-query" type="text" placeholder="Search">
                        <a onclick=" getElementById('searchDIV').style.visibility = 'hidden';" href="#"><img  class="icon-remove"></a>
                    </div>
                    <div id="output">
                        <div class="info" style=' color:  #9900ff; text-align:  center;'>No category selected..</div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>

    </body>
</html>
