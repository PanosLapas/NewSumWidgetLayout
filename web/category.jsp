<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page import="java.util.Calendar"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*" %>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%> 
<%
    String g = request.getParameter("c");
    String BackGrCol = request.getParameter("backGrCol");
    String FontCol = request.getParameter("fontCol");
    String fontFm = request.getParameter("fonFm");
    String col = request.getParameter("col");

    Integer in = Integer.parseInt(g);
    String all = session.getAttribute("categories").toString();
    String ct[] = all.split(",");
    ArrayList<String> cats = new ArrayList();
    for (int c = 0; c < ct.length; c++) {
        cats.add(ct[c]);
    }
    String cat_name = cats.get(in);
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap/CreateCss.jsp?backGrCol=<%out.print(BackGrCol);%>&FontCol=<%out.print(FontCol);%>&fonFm=<%out.print(fontFm);%>" rel="stylesheet">
        <title>Categories</title>
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
        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff; padding-top: 2%;" ><a href="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"> <img src="img/home.png"><b> News</b></a></i></li>                      
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank">powered by <img src="img/logoNewSum2.png"></a></li>
                        <li class="dropdown"><a id="drop1" class="dropdown-toggle" data-toggle="dropdown" role="button" href="#"><img src="img/settings2.png"></a>
                            <ul class="dropdown-menu" aria-labelledby="drop1" role="menu">
                                <li role="presentation"><a role="menuitem">Ελληνικά</a></li>
                                <li role="presentation"><a role="menuitem">English</a></li>
                                <li role="presentation"><a role="menuitem" href="http://www.scify.gr/site/en/support-us" target="_blank">developed by <img src="img/Scify-min.png"></a></li>
                            </ul></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div id="output" class="span12">
                    <%
                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                            TopicsData topics = NewSumInstance.getTopics(values, cat_name);
                            ArrayList<String> topicIds = topics.getTopicIDs();

                    %><table class="table " style=" text-align: center;"><%
                            %><tr class="warning1" style="font-size: 15px;"><td style="color: #<%out.print(col);%>;"><b><%out.print(cat_name);%></b></td></tr><%
                            for (int k = 0; k < topicIds.size(); k++) {
                                SummaryData summary = NewSumInstance.getSummary(topicIds.get(k), values);
                                ArrayList<String> sum = summary.getSummaries();
                                int sunolo = 0; 
%><tr class="warning1" style="font-size:15px;"><td><a onclick="showhide('<%out.print(k);%>')" style="color:#<%out.print(FontCol);%>;"><%out.print(topics.get(k).getTopicTitle());%></a></td></tr><%
                                    %><tr class="warning1" id="<%out.print(k);%>" style="font-size: 15px; display:none;"><td>
                                            <hr style="border-color:#<%out.print(FontCol);%>; height: 3px;"/><%
                                        Calendar datetime = topics.get(k).getDate();
                                        out.print(datetime.getTime().getDay() + "-" + datetime.getTime().getMonth() + "-" + (datetime.getTime().getYear() + 1900));
                                        for (String each : sum) {
                                %><div>  
                                    <% out.print(each);%>
                                </div><%
                                    }
                                %>Sources : <a href="<%out.print(summary.getSnippets().get(0).getSourceUrl());%>" target="_blank"><%out.print(summary.getSnippets().get(0).getSourceName());%></a>
                                <hr style="border-color:#<%out.print(FontCol);%>; height: 3px;"/><%
%></td></tr><%
                       }
                                %></table><%
                       } catch (Exception ex) {
                           out.print(ex);
                       }
                        %>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
