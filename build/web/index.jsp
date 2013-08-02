<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String RefTime = request.getParameter("refresh");
    response.setHeader("Refresh", RefTime); 
    String separator1 = null;
    String separator2 = null;
    //String separator3 = null;%>
<%
    String rowcol = request.getParameter("rowscol");
    String backgrcol = request.getParameter("backgroundcol");
    String titlecol = request.getParameter("titlecol");
    String categ =  request.getParameter("categories");
    String categories[] = categ.split(","); 
    ArrayList cats = new ArrayList();
    for(int c = 0 ; c < categories.length; c++)
        cats.add(categories[c]);
    String fontSz = request.getParameter("font-size"); 
    String fontFm = request.getParameter("font-family");
    //ArrayList categori = (ArrayList) request.getParameter("df");
    //ArrayList categories = (ArrayList) request.getParameter("category");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >

           <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap/CreateCss.jsp?backgroundcol=<%out.print(backgrcol);%>&rowscol=<%out.print(rowcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" rel="stylesheet">




        <title>NewSum Widget</title>
        <script type="text/javascript">


            function resize(multiplier) {
                if (document.body.style.fontSize == "") {
                    document.body.style.fontSize = "1.0em";
                }
                document.body.style.fontSize = parseFloat(document.body.style.fontSize) + (multiplier * 0.2) + "em";
            }


        </script>
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

    <body >

        <div class='navbar'>

            <div class='navbar-inner' >
                <ul class="nav" >

                    <li ><a href="http://www.scify.gr/site/en/newsum-en" target='_blank'><img src="img/logoNewSum2.png"></a></li>
                    <li class="text1" style=" padding-top: 4%; " onmouseover="showmenu('info')" onmouseout="hidemenu('info')"><a href="#"style="color: #000000;">Categories</a>    
                        <table  class="nav table"  id="info" height="0" style=" width: 100%; padding-top: 9%; text-align:  center"  border="0">
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Open Source&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Open Source</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Technology&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Technology</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=SciFY News&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Scify News </a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Europe&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Europe</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Top News&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Top News</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Science&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Science</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Business&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Business</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=World&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >World</a></td></tr>
                            <tr style=" background-color: #ffffff;"><td ><a style=" color: #666666;" href="category.jsp?cat=Education&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>" >Education</a></td></tr>
                        </table> 
                    </li>

                    <li style=" padding-top: 0.5%;"><a href="http://www.scify.gr/site/en/support-us" target="_blank"><img src="img/Scify-min.png"></a></li>

                    <li><img src="img/gr.png" style=" padding-top: 50%;"><img style=" padding-left: 1%;" src="img/us.png"></li>

                    <li><p class="navbar-text pull-right" style=" margin-top: 12%; padding-left: 10%;"><a onclick="resize(1)" href="javascript:void(0);"><i class="icon-plus icon-black"></i></a><a onclick="resize(-1)" href="javascript:void(0);"><i class="icon-minus icon-black"></i></a><i class="icon-text-height icon-black" title="Άλλαξε το μέγεθος των γραμμάτων" data-toggle="tooltip"></i></p></li>
                </ul>
            </div>

        </div>

        <div class="container-fluid" >

            <div class="row-fluid" >
                <div id="output" >
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

                        for (int j = 0; j < cats.size(); j++) {
                    %><tr class="warning"><td><a style=" color: #000000;" href="category.jsp?cat=<%out.print(cats.get(j).toString());%>&rowscol=<%out.print(rowcol);%>&backgroundcol=<%out.print(backgrcol);%>&titlecol=<%out.print(titlecol);%>&fonSz=<%out.print(fontSz);%>&fonFm=<%out.print(fontFm);%>"><% out.print(cats.get(j) + "</br>");%></a></td></tr><%

                            java.lang.String result = port.getTopicTitles(sUserSources, c[j].toString());
                            String[] r = result.split(separator1);
                            String[] r2;
                            for (int i = 0; i < 2; i++) {
                                r2 = r[i].split(separator2);
                                    %>
                        <tr class="warning1"><td><div><a ><% out.print("Link kakai finin i" + "</br>");%></a></div></td></tr>
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
