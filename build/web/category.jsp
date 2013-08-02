<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page import="java.util.Calendar"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%
    // String rowcol = request.getParameter("rowscol");
    //String backgrcol = request.getParameter("backgroundcol");
    //String titlecol = request.getParameter("titlecol");
    String fontFm = request.getParameter("fonFm");
    String cat_name = request.getParameter("cat");
    String col = request.getParameter("col");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">

        <title>Categories</title>
        <script type="text/javascript">


            function resize(multiplier) {
                if (document.body.style.fontSize == "") {
                    document.body.style.fontSize = "1.0em";
                }
                document.body.style.fontSize = parseFloat(document.body.style.fontSize) + (multiplier * 0.2) + "em";
            }


        </script>
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

    <body style=" background-color:#58595b;">
        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff; padding-top: 7%;" ><b>News</b></li>                      
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
                            TopicsData topics = NewSumInstance.getTopics(values, categories.get(0));//gia category vale cat_name
                            ArrayList<String> topicIds = topics.getTopicIDs();
                            %><table class="table " style=" text-align: center;"><%
                            %><tr style="font-family: <%out.print(fontFm);%>; color: #ffffff; font-size: 15px; background-color: #<%out.print(col);%>;"><td><%out.print("Τεχνολογία");%></td></tr><%
                                for (int k = 0; k < topicIds.size(); k++) {
                                    SummaryData summary = NewSumInstance.getSummary(topicIds.get(k), values);
                                    ArrayList<String> sum = summary.getSummaries();
                                    ArrayList s_name = new ArrayList();
                                    int sunolo=0;
                                    //s_name.add(); 
                            %><tr style="font-family: <%out.print(fontFm);%>; color: #000000; font-size:15px; background-color: #ffffff;"><td><a onclick="showhide('<%out.print(k);%>')" style=" font-family: <%out.print(fontFm);%>; color: #000000;"><%out.print(topics.get(k).getTopicTitle());%></a></td></tr><%
                            %><tr id="<%out.print(k);%>" style="font-family:  <%out.print(fontFm);%>; color: #ffffff; font-size: 15px; display:none; background-color: #58595b;"><td><%
                                     Calendar datetime = topics.get(k).getDate();
                                     out.print(datetime.getTime().getDay()+"-"+datetime.getTime().getMonth()+"-"+(datetime.getTime().getYear()+1900));
                                     for(String each : sum){
                                         %><div>  
                                             <% out.print(each);%>
                                         </div><%
                                     }
                                         %>Sources : <a href="<%out.print(summary.getSnippets().get(0).getSourceUrl());%>" target="_blank"><%out.print(summary.getSnippets().get(0).getSourceName());%></a><%
                                  //   out.print("edw:"+s_name );
                            %></td></tr><%
                                    }
                            %></table><%




                                    /* int s=0;
                                     for(String each2 : topicIds ){
                                     //   out.print("IDs : "+ each2  );
                          
                                     s++;
                                     }
                                     for(int i = 0 ; i < topicIds.size(); i++){
                                     Calendar datetime = topics.get(i).getDate();
                                     //datetime.getWeekYear();
                                     // out.print("Day : "+ datetime.getTime().getDay() );
                           
                                     // out.print("Month : "+ datetime.getTime().getMonth() );
                          
                                     //  out.print("Year : "+ (datetime.getTime().getYear()+1900));
                          
                                     // out.print("Hour : "+ datetime.getTime().getHours()+ " : " + datetime.getTime().getMinutes() + " : " + datetime.getTime().getSeconds()   );
                           
                                     String title = topics.get(i).getTopicTitle();
                                     // out.print("Title : "+ title);
                          
                                     SummaryData summary = NewSumInstance.getSummary(topicIds.get(i), values);
                                     ArrayList<String> sum = summary.getSummaries();
                                     for (String each1 : sum) {
                                     //  out.print(each1 );
                                     }
                                     int src = topics.get(i).getSourcesNum();
                                     //    out.print("Sources: "+src);
                                     }
                                     //java.lang.String result = port.getTopics(sUserSources, sCategory);
                                     */     //out.println("Result = "+result);
                                } catch (Exception ex) {
                                    // TODO handle custom exceptions here
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
