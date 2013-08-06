<%-- 
    Document   : CustomWidget
    Created on : 26 Ιουλ 2013, 9:43:33 πμ
    Author     : plapas
--%>

<%@page import="javax.jms.Session"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8" %> 
<%@ page import="java.net.URLDecoder"%>
<%
    String BackGrCol = request.getParameter("backGrCol");
    String FontCol = request.getParameter("fontCol");
    String fonFm = request.getParameter("font-family");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" >
        <link href="css/bootstrap/CreateCss.jsp?backGrCol=<%out.print(BackGrCol);%>&FontCol=<%out.print(FontCol);%>&fonFm=<%out.print(fonFm);%>" rel="stylesheet">
        <title>NewSum Widget</title>
        <%

            ArrayList colors = new ArrayList();
            colors.add("0099CC");
            colors.add("9933CC");
            colors.add("669900");
            colors.add("FF8800");
            colors.add("CC0000");

            String categ = "Τεχνολογία,Αθλητισμός,Επιστήμη,Οικονομία,Ελλάδα,Εκπαίδευση,SciFY News,Πολιτισμός";
            session.setAttribute("categories", categ);
            String categories1[] = categ.split(",");
            ArrayList<String> cats = new ArrayList();
            for (int c = 0; c < categories1.length; c++) {
                cats.add(categories1[c]);
            }
        %>
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

        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff; padding-top: 2%;" ><a href="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=<%out.print(fonFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"> <img src="img/home.png"><b> News</b></a></i></li>                      
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
                <div class="span12">
                    <%-- start web service invocation --%>
                    <%
                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                    %><table class="table " style=" text-align: center;"><%
    for (int u = 0; u < cats.size(); u++) {
        for (int color_ch = 0; color_ch < colors.size(); color_ch++) {
            if (u % colors.size() == color_ch) {
                        %><tr class="warning1"  style=" background-color: #<%out.print(BackGrCol);%>;" ><td><a onclick="showhide('<%out.print(u);%>')" style=" color: #<%out.print(colors.get(color_ch));%>;"><b><%out.print(cats.get(u));%></b></a></td></tr><%
                                }
                            }
                            TopicsData topics = NewSumInstance.getTopics(values, cats.get(u));
                                        %><tr id="<%out.print(u);%>" class="warning1" style=" font-size: 15px; display:none;"><td><%
    for (int TopTwo = 0; TopTwo < 2; TopTwo++) {

                                %>
                                <div>
                                    <a href="category.jsp?&c=<%out.print(u);%>&fonFm=<%out.print(fonFm);%>&col=<%out.print("FF8800");%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"  style=" color: #<%out.print(FontCol);%>;"><%out.print(topics.get(TopTwo).getTopicTitle());%></a>
                                </div>
                                <hr style="height: 3px;"/><%

                                    }%></td></tr><%

                                          }
                                %></table><%
                                    } catch (Exception ex) {
                                        // TODO handle custom exceptions here
                                        out.print(ex);
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
