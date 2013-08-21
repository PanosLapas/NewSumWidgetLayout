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
    String Categ = request.getParameter("name_cat");
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
                    if (document.getElementById("im" + id).className === "icon-arrow-right") {
                        document.getElementById("im" + id).className = "icon-arrow-down";
                    } else {
                        document.getElementById("im" + id).className = "icon-arrow-right";
                    }
                }
            }
        </script>
        <script>
            function getCateg(category) {
                name_cat = $(category).attr('value');
                window.location.href = "news_by_source.jsp?&name_cat=" + name_cat + "&c=<%out.print(g);%>&fonFm=<%out.print(fontFm);%>&col=<%out.print("FF8800");%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>";
            }
            function getAll() {
                window.location.href = "category.jsp?&c=<%out.print(g);%>&fonFm=<%out.print(fontFm);%>&col=<%out.print("FF8800");%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>";
            }
        </script>
    </head>
    <body>
        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff; padding-top: 2.5%;" ><a href="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b>News</b></a></li>                      
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
        <%
            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                LinksData dl = NewSumInstance.getLinkLabels();
                ArrayList<String> values = dl.getLinks();
                CategoriesData categories = NewSumInstance.getCategories(values);
                TopicsData topics = NewSumInstance.getTopics(values, cat_name);
                ArrayList<String> topicIds = topics.getTopicIDs();
                int sunol = 0;

        %><table class="table " style=" text-align: center;"><%
            %><tr class="warning1" style="font-size: 15px;"><td style="color: #<%out.print(col);%>;"><a href="category.jsp?c=<%out.print(g);%>&fonFm=<%out.print(fontFm);%>&col=<%out.print(col);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b><%out.print(cat_name);%></b></a></td></tr><%
                ArrayList phges = new ArrayList();

                for (int t = 0; t < topicIds.size(); t++) {
                    SummaryData summary = NewSumInstance.getSummary(topicIds.get(t), values);
                    ArrayList<String> sum = summary.getSummaries();
                    if (summary.getSnippets().size() > 1) {
                        for (int sour = 0; sour < summary.getSnippets().size(); sour++) {
                            phges.add(summary.getSnippets().get(sour).getSourceName());
                        }
                        for (int p = 0; p < phges.size(); p++) {
                            int w = p + 1;
                            while (w < phges.size()) {
                                if (phges.get(p).equals(phges.get(w))) {
                                    phges.remove(phges.get(w));
                                } else {
                                    w++;
                                }
                            }
                        }
                    }
                }
                            %><select style=" color: #0044cc;">
                <option onclick="getAll()">Όλες οι πηγές</option>
                <%for (int pg = 0; pg < phges.size(); pg++) {%>
                <option id="m<%out.print(pg);%>" onclick="getCateg(this)"><%out.print(phges.get(pg));%></option>
                <%}%>
            </select><%
                for (int k = 0; k < topicIds.size(); k++) {
                    SummaryData summary = NewSumInstance.getSummary(topicIds.get(k), values);
                    ArrayList<String> sum = summary.getSummaries();
                    if (summary.getSnippets().size() > 1) {

                        ArrayList sources = new ArrayList();
                        ArrayList srcName = new ArrayList();
                        for (int sour = 0; sour < summary.getSnippets().size(); sour++) {
                            sources.add(summary.getSnippets().get(sour).getSourceUrl());
                            srcName.add(summary.getSnippets().get(sour).getSourceName());

                        }
                        for (int a = 0; a < sources.size(); a++) {
                            int b = a + 1;
                            while (b < sources.size()) {
                                if (sources.get(a).equals(sources.get(b))) {
                                    sources.remove(sources.get(b));
                                    srcName.remove(srcName.get(b));
                                } else {
                                    b++;
                                }
                            }
                        }
                        if (sources.size() > 1) {
                            for (int position = 0; position < sum.size(); position++) {
                                if (Categ.equals(srcName.get(position))) {
            %><tr class="warning1" style="font-size:15px;"><td><a onclick="showhide('<%out.print(k);%>')" style="color:#<%out.print(FontCol);%>;"><i id="im<%out.print(k);%>" class="icon-arrow-right"></i><%out.print(topics.get(k).getTopicTitle());%></a></td></tr><%
            %><tr class="warning1" id="<%out.print(k);%>" style="font-size: 15px; display:none;"><td>
                    <hr style="border-color:#<%out.print(FontCol);%>; height: 3px;"/><%

                        Calendar datetime = topics.get(k).getDate();
                    %><img style=" width: 150px; height: 100px;" src="img/<%out.print(cat_name);%>.png"><br><%
                    %><span class="label label-info" ><%out.print(datetime.getTime().getDay() + "-" + datetime.getTime().getMonth() + "-" + (datetime.getTime().getYear() + 1900));%></span><br><%


                        out.print(sum.get(position));%>&nbsp;&nbsp;<span class="label label-info" <%if (BackGrCol.equals("58595b")) {%>style="background-color:#<%out.print("ffffff");%>"<%}%>><a href="<%out.print(sources.get(position));%>" target="_blank" <%if (BackGrCol.equals("ffffff")) {%>style="color:#<%out.print("ffffff");%>"<%}%>><%out.print(srcName.get(position));%></a></span>

                    <% %>
                    <hr style="border-color: #<%out.print(FontCol);%>; height: 3px;"/>
                </td></tr>
                <%}
                                }

                            }
                        }

                    }

                %></table><%
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
            %>


        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
