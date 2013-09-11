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
<%//parameters for opening BasicLayout (Theme color, Font family)
    response.addHeader("Refresh","1800");//auto-refresh of the page
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
        <%
            //Arraylist of colors for coloring Categories' names
            ArrayList colors = new ArrayList();
            colors.add("0099CC");
            if (BackGrCol.equals("ffffff")) {//if the theme is light we choose another color
                colors.add("9933CC");
            } else {//when the theme is dark
                colors.add("007FFF");
            }
            colors.add("669900");
            colors.add("FF8800");
            if (BackGrCol.equals("ffffff")) {//if the theme is light we choose another color
                colors.add("CC0000");
            } else {//when the theme is dark
                colors.add("CDC8B1");
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
                    if (document.getElementById("im" + id).className === "icon-arrow-right") {//using right arrow
                        document.getElementById("im" + id).className = "icon-arrow-down";//changing to the down arrow 
                    } else {
                        document.getElementById("im" + id).className = "icon-arrow-right"; //reverse change
                    }
                }

            }
        </script>
    </head>
    <body >

        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank"><img src="img/Widget-logo.png"></a></li>
                        <li style=" font-size: 16px; color: #ffffff;" ><a href="Layout.jsp?&font-family=<%out.print(fonFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b>NewSum</b></a></i></li>                      

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
        <%  ArrayList<String> values=null;
            CategoriesData categories=null;
            TopicsData topics=null;
            try { 
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                try{ 
                LinksData dl = NewSumInstance.getLinkLabels();
                values = dl.getLinks();
                } catch (Exception ex) {
                           response.sendRedirect("error.jsp?&m=links&font-family="+fonFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                }
                try{
                categories = NewSumInstance.getCategories(values);
                } catch (Exception ex) {
                           response.sendRedirect("error.jsp?&m=cats&font-family="+fonFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                }
        %><%
            for (int u = 0; u < categories.size(); u++) {//loop for all the size of our categories
                for (int color_ch = 0; color_ch < colors.size(); color_ch++) {//loop for coloring the categories' names
                    if (u % colors.size() == color_ch) {//using mod for coloring (we have 5 colors and 10 categories. we should color all of them)
        %><div class="row showcat navbar-innerNew" style="font-size:13px;">
            <span><b style="color:#<%out.print(colors.get(color_ch));%>;"><%out.print(categories.get(u));%></b></span>
            <span class="pull-right"><i class="icon-chevron-right"></i></span>
            <br>
        <%
                    }
                }
                 try{
                 topics = NewSumInstance.getTopics(values, categories.get(u));//get topics from all sources for the selected categories
                 } catch (Exception ex) {
                           response.sendRedirect("error.jsp?&m=topics&font-family="+fonFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                 }
                   for (int TopTwo = 0; TopTwo < 2; TopTwo++) {//we 'll show in a hidden div the first two topics
                                        //each one link leads to it's summary. Clicking on the category name leads to category.jsp page
                        %>                          
                    <div class="showtopic">
                        <a href="category.jsp?&top=<%out.print(TopTwo);%>&c=<%out.print(u);%>&fonFm=<%out.print(fonFm);%>&col=<%out.print("FF8800");%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"  style="color: #000000; "><%out.print(topics.get(TopTwo).getTopicTitle());%></a>
                       </div>
                    <%

                    }%>
                    <div class="showtopic"><a href="category.jsp?c=<%out.print(u);%>&fonFm=<%out.print(fonFm);%>&col=<%out.print("FF8800");%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b>Δείτε όλα τα θέματα</b></a></div>
              </div><hr style="border-color:#<%out.print(FontCol);%>; height: 1px;"/>
            <%

            }
            %>
               
            <%
                        } catch (Exception ex) {
                           response.sendRedirect("error.jsp?&m=sun&font-family="+fonFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                        }
            %> 
            <%-- end web service invocation --%>   
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
