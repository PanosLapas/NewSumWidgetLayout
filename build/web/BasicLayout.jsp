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
            if (BackGrCol.equals("ffffff")) {
                colors.add("9933CC");
            } else {
                colors.add("debdee");
            }
            colors.add("669900");
            colors.add("FF8800");
            if (BackGrCol.equals("ffffff")) {
                colors.add("CC0000");
            } else {
                colors.add("CDC8B1");
            }

            String categ = "Τεχνολογία,Αθλητισμός,Επιστήμη,Οικονομία,Ελλάδα,Εκπαίδευση,SciFY News,Πολιτισμός,Κόσμος,Γενικά";
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
          <script>
            function check(){
               //var modid = document.getElementById('serverDown');//.modal;
               $("#serverDown").modal();
            }
        </script>
    </head>
    <body >

        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff;" ><a href="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=<%out.print(fonFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b>News</b></a></i></li>                      
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank"><img src="img/Widget-logo.png"></a></li>
                        <li class="dropdown"><a id="drop1" class="dropdown-toggle" data-toggle="dropdown" role="button" href="#"><img src="img/sett.png"></a>
                            <ul class="dropdown-menu" aria-labelledby="drop1" role="menu">
                                <li role="presentation"><a role="menuitem">Ελληνικά</a></li>
                                <li role="presentation"><a role="menuitem">English</a></li>
                                <li role="presentation"><a role="menuitem" href="http://www.scify.gr/site/en/support-us" target="_blank">developed by <img src="img/Scify-min.png"></a></li>
                            </ul></li>
                    </ul>
                </div>
            </div>
        </div>
        <%-- start web service invocation --%>
        <%
            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                LinksData dl = NewSumInstance.getLinkLabels();
                ArrayList<String> values = dl.getLinks();
                // CategoriesData categories = NewSumInstance.getCategories(values);
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
%>
            <% out.print("See the problem");%>
        <button type="button" action="" onclick="check()" class="btn btn-small btn-primary"  title="User login">Troubleshoot</button>
        <button type="submit" style="display:none" id="hiddenButton"></button>
        <div class="modal hide fade fluid" id="serverDown" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel" style="text-align: center;">Server down</h3>
            </div>
            <div class="modal-body fluid">
                <div align="center">
                    <img align="center" style="height:20%;width:20%;" src="img/underconstruction.jpg">
                    <h3 style="text-align: center;"> The server is currently offline. Please try again later</h3>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <%-- end web service invocation --%>   

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
